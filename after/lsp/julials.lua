return {
  on_attach = function(client)
    local environment = vim.tbl_get(client, "settings", "julia", "environmentPath")
    if environment then client.notify("julia/activateenvironment", { envPath = environment }) end
  end,
  settings = {
    julia = {
      completionmode = "qualify",
      lint = { missingrefs = "none" },
    },
  },
}
