-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

local prefix = "<Leader>o"
---@type LazySpec
return {
  {
    "stevearc/overseer.nvim", -- A task runner and job management plugin for Neovim
    keys = { "<leader>o" },
    cmd = {
      "OverseerBuild",
      "OverseerClearCache",
      "OverseerClose",
      "OverseerDeleteBundle",
      "OverseerInfo",
      "OverseerLoadBundle",
      "OverseerOpen",
      "OverseerQuickAction",
      "OverseerRun",
      "OverseerRunCmd",
      "OverseerSaveBundle",
      "OverseerTaskAction",
      "OverseerToggle",
    },
    -- lazy = false,
    opts = {
      setup = {
        task_list = {
          strategy = "toggleterm",
          bindings = {
            ["<C-L>"] = false,
            ["<C-H>"] = false,
            ["<C-K>"] = false,
            ["<C-J>"] = false,
            q = "<Cmd>close<CR>",
            K = "IncreaseDetail",
            J = "DecreaseDetail",
            ["<C-P>"] = "ScrollOutputUp",
            ["<C-N>"] = "ScrollOutputDown",
          },
        },
      },
      templates = {
        {
          name = "compile with compiler",
          builder = function() return { cmd = { "compiler" }, args = { vim.fn.expand "%:p" } } end,
        },
        {
          name = "view file output",
          builder = function() return { cmd = { "opout" }, args = { vim.fn.expand "%:p" } } end,
        },
        {
          name = "present with pdfpc",
          builder = function() return { cmd = { "pdfpc" }, args = { vim.fn.expand "%:r" .. ".pdf" } } end,
          condition = { callback = function() return vim.fn.filereadable(vim.fn.expand "%:r" .. ".pdf") == 1 end },
        },
      },
    },
    config = function()
      require("overseer").setup(opts.setup)
      vim.tbl_map(require("overseer").register_template, opts.templates)
      component_aliases = {
        default = {
          -- These are the default components listed in the README
          -- You probably want to keep them
          { "display_duration", detail_level = 2 },
          "on_output_summarize",
          "on_exit_set_status",
          "on_complete_notify",
          "on_complete_dispose",
          -- This puts the parsed results into the quickfix
          { "on_result_diagnostics_quickfix", open = true },
          -- This puts the parsed results into neovim's diagnostics
          "on_result_diagnostics",
        },
        default_vscode = {
          "default",
          -- "on_output_quickfix",
          "on_result_diagnostics",
          { "on_output_quickfix", open_on_match = true },
          -- { "on_output_quickfix", open = true },
        },
      }
      -- vim.keymap.set("n", "<leader>or", "<cmd>OverseerRun<CR>", { desc = "OverseerRun" })
      vim.api.nvim_create_user_command("OverseerRestartLast", function()
        local overseer = require "overseer"
        local tasks = overseer.list_tasks { recent_first = true }
        if vim.tbl_isempty(tasks) then
          vim.notify("No tasks found", vim.log.levels.WARN)
        else
          overseer.run_action(tasks[1], "restart")
        end
      end, {})
      vim.keymap.set("n", "<leader>ol", "<cmd>OverseerRestartLast<CR>", { desc = "Rerun last task" })
    end,
    specs = {
      {
        "catppuccin",
        optional = true,
        ---@type CatppuccinOptions
        opts = { integrations = { overseer = true } },
      },
      {
        "AstroNvim/astrocore",
        opts = {
          commands = {
            -- AutoCompile = {
            --   function()
            --     require("overseer").run_template({ name = "compile with compiler" }, function(task)
            --       if task then
            --         task:add_component { "restart_on_save", paths = { vim.fn.expand "%:p" } }
            --       else
            --         vim.notify("Error setting up auto compilation", vim.log.levels.ERROR)
            --       end
            --     end)
            --   end,
            --   desc = "Automatically compile the current file with `compiler` on save",
            -- },
            Compile = {
              function() require("overseer").run_template { name = "compile with compiler" } end,
              desc = "Compile the current file with `compiler`",
            },
            OpOut = {
              function() require("overseer").run_template { name = "view file output" } end,
              desc = "View the current file ouptut with `opout`",
            },
            Present = {
              function()
                require("overseer").run_template({ name = "present with pdfpc" }, function(task)
                  if not task then vim.notify("Unable to start presentation", vim.log.levels.ERROR) end
                end)
              end,
              desc = "Present the current file with `pdfpc`",
            },
          },
          mappings = {
            n = {
              [prefix] = { desc = " Overseer" },
              [prefix .. "a"] = { "<Cmd>OverseerQuickAction<CR>", desc = "Quick Action" },
              [prefix .. "i"] = { "<Cmd>OverseerInfo<CR>", desc = "Overseer Info" },
              [prefix .. "k"] = { "<Cmd>Compile<CR>", desc = "Compile" },
              -- [prefix .. "K"] = { "<Cmd>AutoCompile<CR>", desc = "Auto Compile" },
              [prefix .. "<CR>"] = { "<Cmd>OverseerToggle<CR>", desc = "Overseer" },
              -- [prefix .. "p"] = { "<Cmd>Present<CR>", desc = "Present file output" },
              [prefix .. "r"] = { "<Cmd>OverseerRun<CR>", desc = "Run" },
              [prefix .. "v"] = { "<Cmd>OpOut<CR>", desc = "View Output" },
            },
          },
        },
      },
    },
  },
}
