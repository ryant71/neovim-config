; extends

;; Handle ZipFile: | (or InlineCode: |) multi-line blocks
(
  (block_mapping_pair
    key: (flow_node (plain_scalar) @cfn.key)
    value: (block_node (block_scalar) @injection.content))
  (#match? @cfn.key "^(ZipFile|InlineCode)$")
  (#set! injection.language "python")
)

;; Handle single-line forms: ZipFile: "<code>" / '<code>' / plain
(
  (block_mapping_pair
    key: (flow_node (plain_scalar) @cfn.key)
    value: (flow_node (double_quote_scalar) @injection.content))
  (#match? @cfn.key "^(ZipFile|InlineCode)$")
  (#set! injection.language "python")
)
(
  (block_mapping_pair
    key: (flow_node (plain_scalar) @cfn.key)
    value: (flow_node (single_quote_scalar) @injection.content))
  (#match? @cfn.key "^(ZipFile|InlineCode)$")
  (#set! injection.language "python")
)
(
  (block_mapping_pair
    key: (flow_node (plain_scalar) @cfn.key)
    value: (flow_node (plain_scalar) @injection.content))
  (#match? @cfn.key "^(ZipFile|InlineCode)$")
  (#set! injection.language "python")
)
