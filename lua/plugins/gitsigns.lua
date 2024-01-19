return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPost", "BufWritePost", "BufNewFile" },
  opts = {
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
      untracked = { text = "▎" },
    },
    on_attach = function(buffer)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
      end

      -- stylua: ignore start
      map('n', '<leader>hs', gs.stage_hunk, "Git stage hunk")
      map('n', '<leader>hr', gs.reset_hunk, "Git reset hunk")
      map('v', '<leader>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end, "Git stage hunk")
      map('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end, "Git reset hunk")
      map('n', '<leader>hS', gs.stage_buffer, "Git stage buffer")
      map('n', '<leader>hu', gs.undo_stage_hunk, "Git undo stage hunk")
      map('n', '<leader>hR', gs.reset_buffer, "Git reset buffer")
      map('n', '<leader>hp', gs.preview_hunk, "Git preview hunk")
      map('n', '<leader>hb', function() gs.blame_line { full = true } end, "Git blame line")
      map('n', '<leader>tb', gs.toggle_current_line_blame, "Git toggle current line blame")
      map('n', '<leader>hd', gs.diffthis, "Git diff this")
      map('n', '<leader>hD', function() gs.diffthis('~') end, "Git diff this")
      map('n', '<leader>td', gs.toggle_deleted, "Git toggle deleted")
    end,
  },
}
