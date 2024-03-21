-- Plugins

local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('junegunn/vim-easy-align')

Plug('preservim/nerdtree')

Plug('itchyny/lightline.vim')
Plug('nvim-lua/plenary.nvim')
Plug('junegunn/fzf.vim')
Plug('nvim-telescope/telescope.nvim')
Plug('rose-pine/neovim')
--Plug('akinsho/bufferline.nvim')
Plug('mengelbrecht/lightline-bufferline')
Plug('epwalsh/obsidian.nvim')

vim.call('plug#end')

-- Colorscheme
vim.opt.termguicolors = true
vim.cmd("colorscheme rose-pine")
vim.wo.number = true

-- Keymaps

vim.g.mapleader=" "

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<C-N>',':bnext<CR>')
vim.keymap.set('n', '<C-P>',':bprev<CR>')
vim.keymap.set('n','<leader>t',':NERDTree<CR>')
vim.keymap.set('n','<leader>on',':ObsidianNew')
vim.keymap.set('n','<leader>oq',':ObsidianQuickSwitch<CR>')

-- Tabline config

vim.o.showtabline=2
--vim.g.lightline = {colorscheme = 'rosepine'}
--require("bufferline").setup{}
vim.g['lightline'] = {
  colorscheme = 'rosepine',
  active = {
    left = {{'mode', 'paste'}, {'readonly', 'filename', 'modified'}}
  },
  tabline = {
    left = {{'buffers'}},
    right = {{'close'}}
  },
  component_expand = {
    buffers = 'lightline#bufferline#buffers'
  },
  component_type = {
    buffers = 'tabsel'
  }
}

-- Obsidian config
require("obsidian").setup({

  workspaces = {
    {
      name = "personal",
      path = "~/obsidian/glasshouse",
    },
  },



  -- Optional, configure key mappings. These are the defaults. If you don't want to set any keymappings this
  -- way then set 'mappings = {}'.
  mappings = {
    -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
    ["gf"] = {
      action = function()
        return require("obsidian").util.gf_passthrough()
      end,
      opts = { noremap = false, expr = true, buffer = true },
    },
    -- Toggle check-boxes.
    ["<leader>ch"] = {
      action = function()
        return require("obsidian").util.toggle_checkbox()
      end,
      opts = { buffer = true },
    },
  },

  -- Where to put new notes. Valid options are
  --  * "current_dir" - put new notes in same directory as the current buffer.
  --  * "notes_subdir" - put new notes in the default notes subdirectory.
  new_notes_location = "current_dir",

  -- Optional, customize how note IDs are generated given an optional title.
  ---@param title string|?
  ---@return string
  note_id_func = function(title)
    -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
    -- In this case a note with the title 'My new note' will be given an ID that looks
    -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
    local suffix = ""
    if title ~= nil then
      -- If title is given, transform it into valid file name.
      suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
    else
      -- If title is nil, just add 4 random uppercase letters to the suffix.
      for _ = 1, 4 do
        suffix = suffix .. string.char(math.random(65, 90))
      end
    end
    return suffix
  end,

  -- Optional, customize how note file names are generated given the ID, target directory, and title.
  ---@param spec { id: string, dir: obsidian.Path, title: string|? }
  ---@return string|obsidian.Path The full path to the new note.
  note_path_func = function(spec)
    -- This is equivalent to the default behavior.
    local path = spec.dir / tostring(spec.id)
    return path:with_suffix(".md")
  end,


  -- Optional, customize how markdown links are formatted.
  markdown_link_func = function(opts)
    return require("obsidian.util").markdown_link(opts)
  end,

  -- Either 'wiki' or 'markdown'.
  preferred_link_style = "markdown",


  picker = {
    -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
    name = "telescope.nvim",
    -- Optional, configure key mappings for the picker. These are the defaults.
    -- Not all pickers support all mappings.
    mappings = {
      -- Create a new note from your query.
      new = "<C-x>",
      -- Insert a link to the selected note.
      insert_link = "<C-l>",
    },
  },

  -- Specify how to handle attachments.
  attachments = {
    -- The default folder to place images in via `:ObsidianPasteImg`.
    -- If this is a relative path it will be interpreted as relative to the vault root.
    -- You can always override this per image by passing a full path to the command instead of just a filename.
    img_folder = "assets/imgs",  -- This is the default
    -- A function that determines the text to insert in the note when pasting an image.
    -- It takes two arguments, the `obsidian.Client` and an `obsidian.Path` to the image file.
    -- This is the default implementation.
    ---@param client obsidian.Client
    ---@param path obsidian.Path the absolute path to the image file
    ---@return string
    img_text_func = function(client, path)
      path = client:vault_relative_path(path) or path
      return string.format("![%s](%s)", path.name, path)
    end,
  },

  ui = {enable=false}

})
