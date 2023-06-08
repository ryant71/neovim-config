--------------
-- Defaults --
--------------
-- {
--   -- Built in file matchers
--   builtin_matchers = {
--     -- Detects Kubernetes files based on content
--     kubernetes = { enabled = true },
--     cloud_init = { enabled = true }
--   },
-- 
--   -- Additional schemas available in Telescope picker
--   schemas = {
--     --{
--       --name = "Kubernetes 1.22.4",
--       --uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.22.4-standalone-strict/all.json",
--     --},
--   },
-- 
--   -- Pass any additional options that will be merged in the final LSP config
--   lspconfig = {
--     flags = {
--       debounce_text_changes = 150,
--     },
--     settings = {
--       redhat = { telemetry = { enabled = false } },
--       yaml = {
--         validate = true,
--         format = { enable = true },
--         hover = true,
--         schemaStore = {
--           enable = true,
--           url = "https://www.schemastore.org/api/json/catalog.json",
--         },
--         schemaDownload = { enable = true },
--         schemas = {},
--         trace = { server = "debug" },
--       },
--     },
--   },
-- }
------------------
-- End Defaults --
------------------





local cfg = require("yaml-companion").setup({
  -- Add any options here, or leave empty to use the default settings

  builtin_matchers = {
    -- Detects Kubernetes files based on content
    kubernetes = { enabled = true },
    cloud_init = { enabled = true },
	-- cloudformation = { enabled = true }
  },

  schemas = {
    {
      name = "AWS CloudFormation",
      uri = "https://raw.githubusercontent.com/awslabs/goformation/master/schema/cloudformation.schema.json",
    },
  },

  lspconfig = {
    cmd = {"yaml-language-server"}
  },
})

require("lspconfig")["yamlls"].setup(cfg)
