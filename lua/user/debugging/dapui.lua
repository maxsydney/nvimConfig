local status_ok, dapui = pcall(require, "dapui")
if not status_ok then
  print("Failed to load plugin dapui")
  return
end

dapui.setup()
