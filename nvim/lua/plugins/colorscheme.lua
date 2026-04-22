return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = function(_, opts)
      local function is_dark()
        return vim.fn.system("defaults read -g AppleInterfaceStyle 2>/dev/null"):match("Dark") ~= nil
      end
      opts.style = is_dark() and "moon" or "day"

      local group = vim.api.nvim_create_augroup("tokyonight_appearance", { clear = true })
      vim.api.nvim_create_autocmd("FocusGained", {
        group = group,
        callback = function()
          local want = is_dark() and "dark" or "light"
          if vim.o.background ~= want then
            vim.o.background = want
            require("tokyonight").load()
          end
        end,
      })
    end,
  },
}
