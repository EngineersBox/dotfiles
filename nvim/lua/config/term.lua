-- Taken from NvChad (siduck): https://github.com/NvChad/ui/blob/v3.0/lua/nvchad/term/init.lua
local config = {
    startinsert = true,
    base46_colors = true,
    winopts = { number = false, relativenumber = false },
    sizes = { sp = 0.3, vsp = 0.2, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
    float = {
      relative = "editor",
      row = 0.3,
      col = 0.25,
      width = 0.5,
      height = 0.4,
      border = "single",
    },
};

local api = vim.api
local g = vim.g
local M = {}
local set_buf = api.nvim_set_current_buf

g.nvchad_terms = {}

local pos_data = {
  sp = { resize = "height", area = "lines" },
  vsp = { resize = "width", area = "columns" },
  ["bo sp"] = { resize = "height", area = "lines" },
  ["bo vsp"] = { resize = "width", area = "columns" },
}

local configuration = vim.fn['gruvbox_material#get_configuration']()
local palette = vim.fn['gruvbox_material#get_palette'](configuration.background, configuration.foreground, configuration.colors_override)

vim.g.terminal_color_0=palette.bg5[0]
vim.g.terminal_color_1=palette.red[0]
vim.g.terminal_color_2=palette.green[0]
vim.g.terminal_color_3=palette.yellow[0]
vim.g.terminal_color_4=palette.blue[0]
vim.g.terminal_color_5=palette.purple[0]
vim.g.terminal_color_6=palette.aqua[0]
vim.g.terminal_color_7=palette.fg0[0]
vim.g.terminal_color_8=palette.bg5[0]
vim.g.terminal_color_9=palette.red[0]
vim.g.terminal_color_10=palette.green[0]
vim.g.terminal_color_11=palette.yellow[0]
vim.g.terminal_color_12=palette.blue[0]
vim.g.terminal_color_13=palette.purple[0]
vim.g.terminal_color_14=palette.aqua[0]
vim.g.terminal_color_15=palette.fg0[0]

-- used for initially resizing terms
vim.g.nvhterm = false
vim.g.nvvterm = false

-------------------------- util funcs -----------------------------
local function save_term_info(index, val)
  local terms_list = g.nvchad_terms
  terms_list[tostring(index)] = val
  g.nvchad_terms = terms_list
end

local function opts_to_id(id)
  for _, opts in pairs(g.nvchad_terms) do
    if opts.id == id then
      return opts
    end
  end
end

local function create_float(buffer, float_opts)
  local opts = vim.tbl_deep_extend("force", config.float, float_opts or {})

  opts.width = math.ceil(opts.width * vim.o.columns)
  opts.height = math.ceil(opts.height * vim.o.lines)
  opts.row = math.ceil(opts.row * vim.o.lines)
  opts.col = math.ceil(opts.col * vim.o.columns)

  vim.api.nvim_open_win(buffer, true, opts)
end

local function format_cmd(cmd)
  return type(cmd) == "string" and cmd or cmd()
end

M.display = function(opts)
  if opts.pos == "float" then
    create_float(opts.buf, opts.float_opts)
  else
    vim.cmd(opts.pos)
  end

  local win = api.nvim_get_current_win()
  opts.win = win

  vim.bo[opts.buf].buflisted = false
  vim.bo[opts.buf].ft = "NvTerm_" .. opts.pos:gsub(" ", "")

  if config.startinsert then
    vim.cmd "startinsert"
  end

  -- resize non floating wins initially + or only when they're toggleable
  if (opts.pos == "sp" and not vim.g.nvhterm) or (opts.pos == "vsp" and not vim.g.nvvterm) or (opts.pos ~= "float") then
    local pos_type = pos_data[opts.pos]
    local size = opts.size and opts.size or config.sizes[opts.pos]
    local new_size = vim.o[pos_type.area] * size
    api["nvim_win_set_" .. pos_type.resize](0, math.floor(new_size))
  end

  api.nvim_win_set_buf(win, opts.buf)

  local winopts = vim.tbl_deep_extend("force", config.winopts, opts.winopts or {})

  for k, v in pairs(winopts) do
    vim.wo[win][k] = v
  end

  save_term_info(opts.buf, opts)
end

local function create(opts)
  local buf_exists = opts.buf
  opts.buf = opts.buf or vim.api.nvim_create_buf(false, true)

  -- handle cmd opt
  local shell = vim.o.shell
  local cmd = shell

  if opts.cmd and opts.buf then
    cmd = { shell, "-c", format_cmd(opts.cmd) .. "; " .. shell }
  else
    cmd = { shell }
  end

  M.display(opts)

  save_term_info(opts.buf, opts)

  opts.termopen_opts = vim.tbl_extend("force", opts.termopen_opts or {}, { detach = false })
  if not buf_exists then
    vim.fn.termopen(cmd, opts.termopen_opts)
  end

  vim.g.nvhterm = opts.pos == "sp"
  vim.g.nvvterm = opts.pos == "vsp"
end

--------------------------- user api -------------------------------
M.new = function(opts)
  create(opts)
end

M.toggle = function(opts)
  local x = opts_to_id(opts.id)
  opts.buf = x and x.buf or nil

  if (x == nil or not api.nvim_buf_is_valid(x.buf)) or vim.fn.bufwinid(x.buf) == -1 then
    create(opts)
  else
    api.nvim_win_close(x.win, true)
  end
end

-- spawns term with *cmd & runs the *cmd if the keybind is run again
M.runner = function(opts)
  local x = opts_to_id(opts.id)
  local clear_cmd = opts.clear_cmd or "clear; "
  opts.buf = x and x.buf or nil

  -- if buf doesnt exist
  if x == nil then
    create(opts)
  else
    -- window isnt visible
    if vim.fn.bufwinid(x.buf) == -1 then
      M.display(opts)
    end

    local cmd = format_cmd(opts.cmd)

    if x.buf == api.nvim_get_current_buf() then
      vim.cmd "bp"
      cmd = format_cmd(opts.cmd)
      set_buf(x.buf)
    end

    local job_id = vim.b[x.buf].terminal_job_id
    vim.api.nvim_chan_send(job_id, clear_cmd .. cmd .. " \n")
  end
end

--------------------------- autocmds -------------------------------
api.nvim_create_autocmd("TermClose", {
  callback = function(args)
    save_term_info(args.buf, nil)
  end,
})

return M
