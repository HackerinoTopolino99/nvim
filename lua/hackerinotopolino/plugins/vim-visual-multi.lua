return{
  "mg979/vim-visual-multi",
  branch = "master",
  config = function()
    vim.g.VM_default_mappings = 0
    vim.g.VM_maps = {
      ["Find Under"] = "<C-d>",
      ["Find Subword Under"] = "<C-d>",
      ["Add Cursor Down"] = "<C-i>",
      ["Add Cursor up"] = "<C-k>",
    }
  end,
} 
