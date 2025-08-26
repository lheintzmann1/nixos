-- Treesitter configuration for syntax highlighting and text objects

require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  
  indent = { 
    enable = true,
  },
  
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<M-space>',
    },
  },
  
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },
}
              ['al'] = '@loop.outer',
              ['il'] = '@loop.inner',
              ['ai'] = '@conditional.outer',
              ['ii'] = '@conditional.inner',
            },
          },
          
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              [']m'] = '@function.outer',
              [']]'] = '@class.outer',
              [']b'] = '@block.outer',
              [']a'] = '@parameter.inner',
            },
            goto_next_end = {
              [']M'] = '@function.outer',
              [']['] = '@class.outer',
              [']B'] = '@block.outer',
              [']A'] = '@parameter.inner',
            },
            goto_previous_start = {
              ['[m'] = '@function.outer',
              ['[['] = '@class.outer',
              ['[b'] = '@block.outer',
              ['[a'] = '@parameter.inner',
            },
            goto_previous_end = {
              ['[M'] = '@function.outer',
              ['[]'] = '@class.outer',
              ['[B'] = '@block.outer',
              ['[A'] = '@parameter.inner',
            },
          },
          
          swap = {
            enable = true,
            swap_next = {
              ['<leader>a'] = '@parameter.inner',
            },
            swap_previous = {
              ['<leader>A'] = '@parameter.inner',
            },
          },
        },
        
        -- Language-specific configurations
        ensure_installed = {}, -- We use nix to manage parsers
        
        -- Auto tag (for HTML/JSX)
        autotag = {
          enable = true,
          filetypes = { "html", "xml", "javascript", "javascriptreact", "typescript", "typescriptreact" },
        },
      }
      
      -- Enable folding with treesitter
      vim.opt.foldmethod = 'expr'
      vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
      vim.opt.foldenable = false -- Don't start with folds closed
    end,
  },
}
