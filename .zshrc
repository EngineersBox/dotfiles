# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    autojump
    brew
    cp
    colored-man-pages
    command-not-found
    docker
    docker-compose
    fancy-ctrl-z
    fzf
    gitignore
    mvn
    rsync
    rust
    sudo
    alias-finder
)

source $ZSH/oh-my-zsh.sh

# ---- RUST ----

fpath+=~/.zfunc
source "$HOME/.cargo/env"

# ---- CUSTOM CONFIGS ----

eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/geometry.omp.json)"
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh

# ---- PATH ENV VAR ---- #

export PATH="/opt/homebrew/opt/gnu-getopt/bin:/usr/local/sbin:/Applications/CMake.app/Contents/bin:/usr/local/code:$HOME/.autojump/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/homebrew/bin:/opt/homebrew/:sbin:$HOME/.local/bin:$HOME/.local/sbin:$HOME/Library/psn00bsdk/bin:$HOME/.pub-cache/bin:$PATH"
CMAKE_OSX_SYSROOT=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk

# ---- FUNCTIONS ---- #

function git_cp() {
    git add .
    git commit -m "$1"
    git push
}

function leak_test() {
    md ./memory_analysis
    leaks --hex --atExit -- $1 | grep LEAK:
}

function leak_test_log() {
    md ./memory_analysis
    leaks --hex --outputGraph="./memory_analysis/$(date +"%Y-%m-%d_%H-%M-%S")" --atExit -- $1
}

function init_qemu() {
  cd $1
  qemu-system-x86_64 -drive file=$HOME/linux_distros/ubuntu.raw,format=raw,index=0,media=disk \
    -drive media=cdrom,file=$HOME/linux_distros/ubuntu-20.04.4-live-server-amd64.iso,readonly=on \
    -boot d \
    -m 4G,slots=4,maxmem=32G \
    -smp 4 \
    -machine pc,nvdimm=on \
    -object memory-backend-file,id=mem1,share=on,mem-path=$HOME/linux_distros/vms/qemu/f27nvdimm0,size=4G \
    -device nvdimm,memdev=mem1,id=nv1,label-size=2M \
    -object memory-backend-file,id=mem2,share=on,mem-path=$HOME/linux_distros/vms/qemu/f27nvdimm1,size=4G \
    -device nvdimm,memdev=mem2,id=nv2,label-size=2M \
    -virtfs local,path=$1,security_model=none,mount_tag=$2
}

function start_qemu() {
  echo "Mount the FS into the VM with: 'sudo mount -t 9p -o trans=\"virtio $2 $1\" -oversion=9p2000.u'"
  cd $1
  qemu-system-x86_64 -drive file=$HOME/linux_distros/ubuntu.raw,format=raw,index=0,media=disk \
    -boot d \
    -m 4G,slots=4,maxmem=32G \
    -smp 4 \
    -machine pc,nvdimm=on \
    -object memory-backend-file,id=mem1,share=on,mem-path=$HOME/linux_distros/vms/qemu/f27nvdimm0,size=4G \
    -device nvdimm,memdev=mem1,id=nv1,label-size=2M \
    -object memory-backend-file,id=mem2,share=on,mem-path=$HOME/linux_distros/vms/qemu/f27nvdimm1,size=4G \
    -device nvdimm,memdev=mem2,id=nv2,label-size=2M \
    -virtfs local,path=$1,security_model=none,mount_tag=$3
}

function showPreview() {
  gitFilePreview="git diff $@ --color=always -- {-1} | delta --line-numbers --dark"
  execute="enter:execute(git difftool {} < /dev/tty)"
  git diff $@ --name-only | fzf -m --ansi --bind $execute --preview-window=wrap --preview "$gitFilePreview"
}

function fzd() {
  if git rev-parse --git-dir > /dev/null 2>&1; then
    if [ -d .git ]; then
      showPreview > /dev/null
    else
      gitRepoDir=$(git rev-parse --git-dir | sed 's/.git//')
      pushd $gitRepoDir > /dev/null
      showPreview > /dev/null
      popd > /dev/null
    fi
  else
    echo "Error: Not inside a git repository."
  fi
}

function nnn-preview () {
    # Block nesting of nnn in subshells
    if [ -n "$NNNLVL" ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to see.
    # To cd on quit only on ^G, remove the "export" and set NNN_TMPFILE *exactly* as this:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # This will create a fifo where all nnn selections will be written to
    NNN_FIFO="$(mktemp --suffix=-nnn -u)"
    export NNN_FIFO
    (umask 077; mkfifo "$NNN_FIFO")

    # Preview command
    preview_cmd="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/plugins/preview-tui"

    # Use `tmux` split as preview
    if [ -e "${TMUX%%,*}" ]; then
        tmux split-window -e "NNN_FIFO=$NNN_FIFO" -dh "$preview_cmd"

    # Use `xterm` as a preview window
    elif (which xterm &> /dev/null); then
        xterm -e "$preview_cmd" &

    # Unable to find a program to use as a preview window
    else
        echo "unable to open preview, please install tmux or xterm"
    fi

    nnn "$@"

    rm -f "$NNN_FIFO"
}

function find_port() {
    lsof -i :$1
}

function kill_port() {
    local pid="$(lsof -t -i :$1)"
    kill -9 "$pid"
}

# ---- ALIASES ---- #

# -- GIT -- #

alias gs="git status --short"

alias gd="git diff"

alias ga="git add"
alias gc="git commit -S -s -m"
alias gac="git add . && git commit -S -s -m"
function gacp() {
    gac "$1"
    git push
}

alias gp="git push"
alias gu="git pull"

alias gl="git log --all --graph --pretty=format:'%C(magenta)%h %C(white) %an %ar%C(auto) %D%n%s%n'"
alias gb="git branch"

alias gi="git init"
alias gcl="git clone"

alias grhh="git reset head --hard"

# -- GIT -- #

alias xtr="eza -lxaoTR --icons=always"
alias xr="eza -lxaoR --icons=always"
alias xt="eza -lxaoT --icons=always"
alias xa="eza -lxao --icons=always"

alias reload="source ~/.zshrc"
alias myip="curl http://ipecho.net/plain; echo"

alias ts="ets -f '[%Y-%m-%d %H:%M:%S.%L]'"
alias mvshaders="ditto ~/Desktop/Projects/GLSL/QuantaShader/shaders ~/Library/Application\ Support/minecraft/shaderpacks/QuantaShader/shaders"

alias update_vcpkg="cd $HOME/vcpkg && git pull && cd -"
alias update_overleaf="nativefier --upgrade /Applications/Overleaf.app"

alias clear_intellij_cache="rm -rf ~/Library/Caches/JetBrains/IntelliJIdea*"

alias reload_sketchybar="launchctl kickstart -k \"gui/${UID}/homebrew.mxcl.sketchybar\""

alias kitten="kitty +kitten"
alias icat="kitten icat"

# ---- EXPORT DEFINITIONS ---- #

export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
# jenv enable-plugin export
export EDITOR="$(which nvim)"
export GOPATH=$HOME/golang
export GOROOT=/opt/homebrew/opt/go/libexec
export PATH="$GOPATH/bin:$PATH"
export PATH="$GOROOT/bin:$PATH"
export GUILE_LOAD_PATH="/usr/local/share/guile/site/3.0"
export GUILE_LOAD_COMPILED_PATH="/usr/local/lib/guile/3.0/site-ccache"
export GUILE_SYSTEM_EXTENSIONS_PATH="/usr/local/lib/guile/3.0/extensions"
export VCPKG_ROOT="$HOME/vcpkg"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/opt/libffi/lib/pkgconfig:/usr/local/opt/libxml2/lib/pkgconfig:/usr/local/lib/pkgconfig:$HOME/vcpkg/packages/openmpi_x64-osx/lib/pkgconfig"
export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --preview 'bat --color=always --style=numbers,header,grid --line-range :300 {}'"
export PSN00BSDK_LIBS="$HOME/Library/psn00bsdk/lib/libpsn00b"
export GPG_TTY=$(tty)


# Opam configuration
[[ ! -r $HOME/.opam/opam-init/init.zsh ]] || source $HOME/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# Configure ghostty config
pushd -q ~/.config/ghostty
go run update_config.go
popd -q

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jackkilrain/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jackkilrain/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jackkilrain/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jackkilrain/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

compinit

