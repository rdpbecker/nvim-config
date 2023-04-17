local condition = require('galaxyline.condition')
local get_git_dir = require('galaxyline/provider_vcs').get_git_dir
local vcs = require('galaxyline/provider_vcs')

function bg(groups, default)
    for i=1, #groups do
        hl = vim.api.nvim_get_hl_by_name(groups[i],   1)
        if hl['background'] ~= nil then
            return string.format("#%06x",hl.background)
        end
        if hl['ctermbg'] ~= nil then
            return string.format("#%06x",hl.ctermbg)
        end
    end
    return default
end

function fg(groups, default)
    for i=1, #groups do
        hl = vim.api.nvim_get_hl_by_name(groups[i],   1)
        if hl['foreground'] ~= nil then
            return string.format("#%06x",hl.foreground)
        end
        if hl['ctermfg'] ~= nil then
            return string.format("#%06x", hl.ctermfg)
        end
    end
    return default
end

local COLOURS = {
    ['pink'] = bg({'TabLineFill'}, '#ff0089'),
    ['sky'] = fg({'TabLine'}, '#5fafff'),
    ['mint'] = fg({'TabLineFill'}, '#00ffaf'),
    --['gitGreen'] = fg({'DiffAdded'}, '#00ff70'),
    --['gitYellow'] = fg({'DiffChanged'}, '#d7df00'),
    --['gitRed'] = fg({'DiffRemoved'}, '#ff7070'),
    ['gitGreen'] = '#00ff70',
    ['gitYellow'] = '#d7df00',
    ['gitRed'] = '#ff7070',
    ['lightGrey'] = '#d0d0d0',
    ['background'] = bg({'FoldColumn'}, '#101010'),
}

local SEPARATORS = {
    left_full = '',
    left_sep = '',
    right_full = '',
    right_sep = ''
}


local function find_git_root()
    return get_git_dir(vim.fn.expand '%:p:h')
end

require('galaxyline').section.left = {
    {
        ViMode = {
            provider = vim.fn.mode,
--            provider = function() -- auto change color according the vim mode
--                local mode_color = nil
--                local mode_name = nil

--                if vim.g.libmodalActiveModeName then
--                    mode_name = vim.g.libmodalActiveModeName
--                    mode_color = _MODES[mode_name]
--                else
--                    local current_mode = _MODES[mode(true)] or _MODES[mode(false)]

--                    mode_name = current_mode[1]
--                    mode_color = current_mode[2]
--                end
--
--                require('highlite').highlight('GalaxyViMode', {fg=mode_color, style='bold'})
--
--                return mode_name..' '
--            end,
            icon = '▊ ',
            highlight = {COLOURS.lightGrey,COLOURS.background},
            separator = ' ' .. SEPARATORS.right_sep .. ' ',
            separator_highlight = {COLOURS.lightGrey,COLOURS.background},
	    }
    },

    {   
        FileName = {
            provider  = {space, 'FileIcon', 'FileName'},
            condition = function() return vim.fn.empty(vim.fn.expand('%:t')) ~= 1 end,
            highlight = {COLOURS.sky,COLOURS.background, 'bold'},
            separator = SEPARATORS.right_sep .. ' ',
            separator_highlight = {COLOURS.sky,COLOURS.background},
        }
    },

    {
        GitBranch = {
            provider = 'GitBranch',
            icon = ' ',
            --condition = require('galaxyline/provider_vcs').check_git_workspace,
            condition = function()
                local function is_empty()
                    return vcs.get_git_branch() ~= nil
                end
                return condition.check_git_workspace() and condition.hide_in_width() and is_empty()
            end,
            --condition = find_git_root,
            highlight = {COLOURS.mint,COLOURS.background},
            separator = ' ' .. SEPARATORS.right_sep .. ' ',
            separator_highlight = {COLOURS.mint,COLOURS.background},
        }
    },

    {
        DiffAdd = {
            provider = 'DiffAdd',
            condition = find_git_root,
            icon = '+',
            highlight = {COLOURS.gitGreen,COLOURS.background},
        }
    },

    {
        DiffModified = {
            provider = 'DiffModified',
            condition = find_git_root,
            icon = '~',
            highlight = {COLOURS.gitYellow,COLOURS.background},
        }
    },

    {
        DiffRemove = {
            provider = 'DiffRemove',
            condition = find_git_root,
            icon = '-',
            highlight = {COLOURS.gitRed,COLOURS.background},
            separator = "",
            separator_highlight = {COLOURS.background,COLOURS.background}
        }
    },

    {
        MidSeparator = {
            provider = {space},
            highlight = {COLOURS.background, COLOURS.background},
            separator = SEPARATORS.right_full,
            separator_highlight = {COLOURS.background,COLOURS.pink}
        }
    },
}

require('galaxyline').section.right = {
    {
        MidSeparator = {
            provider = {space},
            highlight = {COLOURS.background, COLOURS.background},
            separator = SEPARATORS.left_full,
            separator_highlight = {COLOURS.background,COLOURS.pink}
        }
    },

    {
		LineNumber =
		{
			provider = function() return vim.fn.line('.') end,
			icon = ' ',
			condition = function() return vim.fn.empty(vim.fn.expand('%:t')) ~= 1 end,
			highlight = {COLOURS.sky,COLOURS.background},
			separator = SEPARATORS.left_sep .. " ",
			separator_highlight = {COLOURS.sky,COLOURS.background},
		},
		ColumnNumber =
		{
			provider = function() return vim.fn.col('.') end,
			icon = ' ',
			condition = function() return vim.fn.empty(vim.fn.expand('%:t')) ~= 1 end,
			highlight = {COLOURS.sky,COLOURS.background},
			separator = ' ',
			separator_highlight = {COLOURS.background,COLOURS.background},
		}
	},

    {
        PerCent = {
            provider = 'LinePercent',
            highlight = {COLOURS.lightGrey,COLOURS.background},
            separator = ' ' .. SEPARATORS.left_sep,
            separator_highlight = {COLOURS.lightGrey,COLOURS.background}
        }
    },
}
