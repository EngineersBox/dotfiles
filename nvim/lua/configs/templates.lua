local skeld = require("skel-nvim.defaults")
local utils = require("skel-nvim.utils")

-- Creates a header guard of the form _<PROJECT NAME>__<UNDERSCORE_DELIMITED_SRC_PATH>_<FILENAME>_H_
-- For example: _PSXMC__GAME_WORLD_CHUNK__CHUNK_MESH_H_
local function source_path_header_guard(cfg)
    local path = ""
    local include = false
    local basename, filename, _ = utils.get_basename_parts(cfg.filename)
    for str in string.gmatch(cfg.filename, "([^%/]+)") do
        if include and str ~= basename then
            path = path .. "_" .. str:upper()
        end
        if not include and str == "src" then
            include = true
        end
    end
    local project_name = cfg.project_name
    if project_name ~= nil then
        project_name = "_" .. project_name:upper() .. "_"
    else
        project_name = ""
    end
    return project_name .. path .. "__" .. filename:upper() .. "_H_"
end

local function header_include(cfg)
  local _, base, _ = utils.get_basename_parts(cfg.filename)
  return "#include \"" ..base..".h\""
end

return {
	templates_dir = vim.fn.stdpath("config") .. "/templates",
	skel_enabled = true,
	apply_skel_for_empty_file = true,
	mappings = {
		["*.c"] = "c_source.skel",
		["*.h"] = "c_header.skel",
	},
	substitutions = {
		["FILENAME"] = skeld.get_filename,
		["C_HEADER_GUARD"] = source_path_header_guard,
		["C_HEADER_INCLUDE"] = header_include,
	},
    project_name = nil,
	projects = {
        psxmc = {
            path = "%/Users%/jackkilrain%/Desktop%/Projects%/C%-CPP%/PSX%-Minecraft",
            project_name = "PSXMC",
        }
    }
}
