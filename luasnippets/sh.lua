-- Shell snippets (filetype "sh" covers bash scripts too)
-- Loaded by require("luasnip.loaders.from_lua") in after/plugin/luasnip.lua
local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
	-- "@" and "~" delimit placeholders, since bash is full of {} [] and <>
	s(
		{ trig = "args", desc = "Parse flags and positional args (while/case)" },
		fmt(
			[=[
usage() {
	cat <<EOF
Usage: ${0##*/} [-h] [-v] [-o FILE] @~

@~

Options:
  -h, --help          Show this help and exit
  -v, --verbose       Enable verbose output
  -o, --output FILE   Write output to FILE
EOF
}

verbose=0
output=""

while [[ $# -gt 0 ]]; do
	case "$1" in
		-h|--help) usage; exit 0 ;;
		-v|--verbose) verbose=1; shift ;;
		-o|--output)
			[[ $# -ge 2 ]] || { echo "error: $1 requires an argument" >&2; exit 2; }
			output="$2"; shift 2 ;;
		--output=*) output="${1#*=}"; shift ;;
		--) shift; break ;;
		-*) echo "error: unknown option: $1" >&2; usage >&2; exit 2 ;;
		*) break ;;
	esac
done

if [[ $# -lt 1 ]]; then
	usage >&2
	exit 2
fi

@~
]=],
			{
				i(1, "ARG..."),
				i(2, "Describe what this script does."),
				i(0),
			},
			{ delimiters = "@~" }
		)
	),

  s(
    { trig = ";bash", desc = "Setup basic bash scaffold" },
    fmt(
      [=[
#!/usr/bin/env bash

set -euo pipefail

@~
]=],
      { i(0) },
			{ delimiters = "@~" }
    )
  ),
}
