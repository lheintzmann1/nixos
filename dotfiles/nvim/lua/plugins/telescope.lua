-- Telescope configuration for fuzzy finding

local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
    prompt_prefix = " ",
    selection_caret = " ",
    file_ignore_patterns = {
      "%.git/",
      "node_modules/",
      "target/",
      "%.lock",
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
      previewer = false,
    },
    buffers = {
      theme = "dropdown",
      previewer = false,
    },
  },
})

-- Enable telescope extensions
telescope.load_extension('fzf')

-- Telescope keymaps
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind [B]uffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[F]ind [W]ord under cursor' })
vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = '[F]ind [R]esume last search' })
vim.keymap.set('n', '<leader>f.', builtin.oldfiles, { desc = '[F]ind Recent Files' })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
vim.keymap.set('n', '<leader>/', function()
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })
          selection_caret = " ",
          path_display = { "truncate" },
          file_ignore_patterns = {
            "node_modules",
            ".git/",
            ".cache",
            "%.o",
            "%.a",
            "%.out",
            "%.class",
            "%.pdf",
            "%.mkv",
            "%.mp4",
            "%.zip",
            "target/",
            "build/",
            "dist/",
          },
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.55,
              results_width = 0.8,
            },
            vertical = {
              mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },
          sorting_strategy = "ascending",
        },
        
        pickers = {
          find_files = {
            find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
          },
          live_grep = {
            additional_args = function(opts)
              return { "--hidden" }
            end
          },
          buffers = {
            theme = "dropdown",
            previewer = false,
            sort_lastused = true,
          },
          git_files = {
            theme = "dropdown",
          },
        },
        
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
          ["ui-select"] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      })
      
      -- Enable telescope extensions
      pcall(telescope.load_extension, 'fzf')
      pcall(telescope.load_extension, 'ui-select')
      
      -- Utility function for searching in git root
      local function find_git_root()
        local current_file = vim.api.nvim_buf_get_name(0)
        local current_dir
        local cwd = vim.fn.getcwd()
        
        if current_file == "" then
          current_dir = cwd
        else
          current_dir = vim.fn.fnamemodify(current_file, ":h")
        end
        
        local git_root = vim.fn.systemlist("git -C " .. vim.fn.escape(current_dir, " ") .. " rev-parse --show-toplevel")[1]
        if vim.v.shell_error ~= 0 then
          print("Not a git repository. Searching on current working directory")
          return cwd
        end
        return git_root
      end
      
      -- Custom function to search in git root
      local function live_grep_git_root()
        local git_root = find_git_root()
        if git_root then
          require('telescope.builtin').live_grep({
            search_dirs = { git_root },
          })
        end
      end
      
      vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})
      vim.keymap.set('n', '<leader>fG', live_grep_git_root, { desc = '[F]ind by [G]rep on Git Root' })
    end,
  },
}
