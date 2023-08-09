local saga_status, saga = pcall(require, "lspsaga")
if not sage_status then
  return
end

saga.init_lsp_saga({
  move_in_sage = { prev = "<C-k>", next = "<C-j>" },
  finder_action_keys = {
    open = "<CR>",
  },
  definition_action_key = {
    edit = "<CR>",
  },
})
