-- vim: foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2

local status_ok, config_local = pcall(require, "config-local")
if not status_ok then
  return
end

config_local.setup {}
