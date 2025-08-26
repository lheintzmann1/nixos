
-- Fugitive keymaps
vim.keymap.set('n', '<leader>gs', '<cmd>Git<CR>', { desc = 'Git status' })
vim.keymap.set('n', '<leader>gp', '<cmd>Git push<CR>', { desc = 'Git push' })
vim.keymap.set('n', '<leader>gl', '<cmd>Git pull<CR>', { desc = 'Git pull' })
vim.keymap.set('n', '<leader>gc', '<cmd>Git commit<CR>', { desc = 'Git commit' })
          ignore_whitespace = false,
        },
        current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil,
        max_file_length = 40000,
        preview_config = {
          border = 'single',
          style = 'minimal',
          relative = 'cursor',
          row = 0,
          col = 1
        },
        
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map({ 'n', 'v' }, ']c', function()
            if vim.wo.diff then
              return ']c'
            end
            vim.schedule(function()
              gs.next_hunk()
            end)
            return '<Ignore>'
          end, { expr = true, desc = 'Jump to next git change' })

          map({ 'n', 'v' }, '[c', function()
            if vim.wo.diff then
              return '[c'
            end
            vim.schedule(function()
              gs.prev_hunk()
            end)
            return '<Ignore>'
          end, { expr = true, desc = 'Jump to previous git change' })

          -- Actions
          -- visual mode
          map('v', '<leader>hs', function()
            gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
          end, { desc = 'stage git hunk' })
          map('v', '<leader>hr', function()
            gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
          end, { desc = 'reset git hunk' })
          
          -- normal mode
          map('n', '<leader>hs', gs.stage_hunk, { desc = 'git stage hunk' })
          map('n', '<leader>hr', gs.reset_hunk, { desc = 'git reset hunk' })
          map('n', '<leader>hS', gs.stage_buffer, { desc = 'git Stage buffer' })
          map('n', '<leader>hu', gs.undo_stage_hunk, { desc = 'undo stage hunk' })
          map('n', '<leader>hR', gs.reset_buffer, { desc = 'git Reset buffer' })
          map('n', '<leader>hp', gs.preview_hunk, { desc = 'preview git hunk' })
          map('n', '<leader>hb', function()
            gs.blame_line { full = false }
          end, { desc = 'git blame line' })
          map('n', '<leader>hd', gs.diffthis, { desc = 'git diff against index' })
          map('n', '<leader>hD', function()
            gs.diffthis '~'
          end, { desc = 'git diff against last commit' })

          -- Toggles
          map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = 'toggle git blame line' })
          map('n', '<leader>td', gs.toggle_deleted, { desc = 'toggle git show deleted' })

          -- Text object
          map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'select git hunk' })
        end
      })
    end,
  },
  
  {
    "vim-fugitive",
    enabled = nixCats('general.extras') or false,
    cmd = { "Git", "Gstatus", "Gblame", "Gpush", "Gpull" },
    keys = {
      { "<leader>gs", "<cmd>Git<CR>", desc = "Git status" },
      { "<leader>gb", "<cmd>Git blame<CR>", desc = "Git blame" },
      { "<leader>gp", "<cmd>Git push<CR>", desc = "Git push" },
      { "<leader>gl", "<cmd>Git pull<CR>", desc = "Git pull" },
    },
  },
}
