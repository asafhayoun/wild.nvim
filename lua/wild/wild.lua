-- Template: https://github.com/rktjmp/lush-template/blob/main/lua/lush_theme/lush_template.lua
-- VSCode Theme Color Reference: https://code.visualstudio.com/api/references/theme-color#command-center-colors

local lush = require("lush")
local hsl = lush.hsl

local config = require("wild.config")
---@type WildThemeOptions
local options = config.options

-- local norm_fg = "#D4D4D4"
local norm_fg = hsl("#c7d8d8")
-- local norm_bg_solid = "#1E1E1E"
local norm_bg_solid = hsl("#222228")

local blue = hsl(233, 41, 66)
local blue2 = hsl("#4fc1ff")
local light_blue = hsl("#9CDCFE")
local bright_blue = hsl("#2aaaff")
local green = hsl("#6A9955")
local blue_green = hsl("#4EC9B0")
local light_green = hsl(99, 28, 73)
local light_red = hsl("#D16969")
local orange = hsl(17, 76, 64)
local light_orange = hsl(20, 88, 75)
local yellow_orange = hsl(41, 64, 74)
local yellow = hsl(55, 63, 70)
local pink = hsl(254, 59, 79)
local purple = hsl(305, 35, 65)

local white = hsl("#f8f8f2")
local gray = hsl("#51504f")
local gray2 = hsl("#858585")
local gray3 = hsl("#808080")
local black = hsl("#2d2d2d") -- TabLine
local black2 = hsl("#252526") -- Statusline, TabLineFill, Pmenu
local black3 = hsl("#2a2d2e") -- CursorLine (list.hoverBackground from VSCode)

local error_red = hsl("#F14C4C")
local warn_yellow = hsl("#CCA700")
local info_blue = hsl("#3794ff")
local hint_gray = hsl(0, 0, 72)
-- local ok_green = hsl(96, 85, 45) -- color for success, so I use notebookStatusSuccessIcon.foreground
local ok_green = hsl(165, 70, 46)

local selection_blue = "#04395e"
local folded_blue = "#202d39" -- editor.foldBackground
local float_border_fg = "#454545"
local indent_guide_fg = "#404040"
local indent_guide_context_fg = "#707070"
local label_fg = "#c8c8c8"

local tab_effect = "#aaaaaa"
local transparent = options.transparent.color
local norm_bg = config._is_code(options.transparent.normal) and transparent or norm_bg_solid
local norm_nc_bg = config._is_code(options.transparent.blurred) and transparent or norm_bg_solid
local tree_bg = config._is_tree(options.transparent.normal) and transparent or norm_bg_solid
local tree_nc_bg = config._is_tree(options.transparent.blurred) and transparent or norm_bg_solid
local tree_line = config._is_tree(options.transparent.blurred) and "NONE" or black3
local cursor_line = config._is_code(options.transparent.normal) and transparent or black3
local menu_items = config._is_code(options.transparent.normal) and transparent or hsl("#3f3868")

---@diagnostic disable
local theme = lush(function(injected_functions)
	local sym = injected_functions.sym
	return {

		--
		-- Preset
		--
		TabBorder { fg = black2 }, -- tab.border, border to separate tabs from each other
		FloatBorder { fg = float_border_fg },
		SelectionHighlightBackground { bg = "#333a40" },
		LightBulb { fg = "#ffcc00" },
		CodeLens { fg = hint_gray },
		-- GutterGitModified { fg = '#1b81a8' },
		GutterGitModified { fg = light_orange },
		-- GutterGitAdded { fg = '#487e02' },
		GutterGitAdded { fg = ok_green },
		GutterGitDeleted { fg = "#f14c4c" },
		Breadcrumb { fg = "#a9a9a9", bg = norm_bg },
		ScrollbarSlider { bg = "#424242" },
		PeekViewBorder { fg = "#3794ff" },
		PeekViewNormal { bg = "#001f33" },
		PeekViewCursorLine { bg = "#002f4e" },
		PeekViewMatchHighlight { bg = "#996214" }, -- peekViewEditor.matchHighlightBackground
		GhostText { fg = "#6b6b6b" },
		Icon { fg = "#c5c5c5" },
		Description { fg = "#989898" }, -- descriptionForeground
		ProgressBar { fg = "#0e70c0" }, -- progressBar.background
		MatchedCharacters { fg = bright_blue }, -- editorSuggestWidget.highlightForeground
		Hint { MatchedCharacters }, -- for the hint letter in options, e.g., the q in [q]uickfix
		DashboardDesc { fg = light_blue, bg = menu_items, sp = hsl(201, 88, 62), gui = "underline" },
		DashboardHeader { fg = blue_green },
		DashboardIcon { fg = yellow_orange },
		DashboardKey {
			fg = blue,
			-- bg = black, sp = hsl("#eeee44"), gui = "bold, underline"
		},
		DashboardFooter { fg = ok_green },
		-- For the unused code, use Identifier's fg (9cdcfe) as the base color,
		-- editorUnnecessaryCode.opacity is 000000aa (the alpha value is aa),
		-- so the color will be 9cdcfeaa. Converting hexa to hex gets 729db4.
		UnnecessaryCode { fg = "#729db4" },
		-- Git diff
		DiffTextAdded { bg = "#386229" },
		DiffTextDeleted { bg = "#781212" },
		DiffTextChanged { bg = "#0000ff" },
		DiffLineAdded { bg = "#373d29" },
		DiffLineDeleted { bg = "#4b1818" },
		DiffLineChanged { bg = "#0e2f44" },
		-- Quickfix list (can be used to define qf syntax, e.g.,
		-- ~/.config/nvim/syntax/qf.vim)
		QfFileName { fg = white },
		QfSelection { bg = "#3a3d41" }, -- terminal.inactiveSelectionBackground
		QfText { fg = "#bbbbbb" }, -- normal text in quickfix list

		--
		-- Editor
		--
		CursorLine { bg = cursor_line },
		CursorColumn { bg = black3 },
		ColorColumn { bg = black2 }, -- #5a5a5a in VSCode (editorRuler.foreground) it's too bright
		Conceal { fg = gray2 },
		Cursor { fg = gray, bg = "#aeafad" },
		-- lCursor { },
		-- CursorIM { },
		Directory { fg = light_green },
		NvimTreeModifiedFile { GutterGitModified },

		DiffAdd { DiffLineAdded },
		DiffDelete { DiffLineDeleted },
		DiffChange { DiffLineChanged },
		DiffText { DiffTextChanged },
		EndOfBuffer { fg = norm_bg },
		-- TermCursor { },
		-- TermCursorNC { },
		ErrorMsg { fg = error_red },
		WinSeparator { fg = "#444444" }, -- editorGroup.border
		VirtSplit { WinSeparator }, -- deprecated and use WinSeparator instead
		LineNr { fg = gray2 },
		CursorLineNr { fg = "#c6c6c6" },
		Folded { bg = folded_blue },
		CursorLineFold { CursorLineNr },
		FoldColumn { LineNr }, -- #c5c5c5 in VSCode (editorGutter.foldingControlForeground) and it's too bright
		SignColumn { bg = norm_bg },
		IncSearch { bg = norm_bg, fg = yellow, gui = "bold" },
		-- Substitute { },
		MatchParen { bg = gray, gui = "bold, underline" },
		ModeMsg { fg = norm_fg },
		MsgArea { fg = norm_fg },
		-- MsgSeparator { },
		MoreMsg { fg = norm_fg },
		NonText { fg = gray2 },
		Normal { fg = norm_fg, bg = norm_bg },
		NormalNC { bg = norm_nc_bg },
		Pmenu { fg = norm_fg, bg = "#28282e" },
		PmenuSel { fg = white, bg = selection_blue },
		PmenuSbar { bg = black2 },
		PmenuThumb { bg = "#474747" },
		NormalFloat { Pmenu },
		Question { fg = blue },
		QuickFixLine { QfSelection },
		Search { bg = "#613214" },
		SpecialKey { NonText },
		SpellBad { gui = "undercurl", sp = error_red },
		SpellCap { gui = "undercurl", sp = warn_yellow },
		SpellLocal { gui = "undercurl", sp = info_blue },
		SpellRare { gui = "undercurl", sp = info_blue },
		StatusLine { bg = black2 },
		StatusLineNC { fg = gray, bg = black2 },
		TabLine { fg = "#8f8f8f", bg = black },
		TabLineFill { fg = "NONE", bg = black2 },
		TabLineSel { fg = white, bg = norm_bg },
		Title { fg = blue, gui = "bold" },
		Visual { bg = "#264F78" },
		-- VisualNOS { },
		WarningMsg { fg = warn_yellow },
		Whitespace { fg = "#3e3e3d" },
		WildMenu { PmenuSel },
		Winbar { Breadcrumb },
		WinbarNC { Breadcrumb },

		--
		-- Flash
		--
		FlashCursor { SelectionHighlightBackground },

		--
		-- Syntax
		--
		Comment { fg = hsl("#7fc07f") },

		Constant { fg = pink },
		String { fg = orange },
		Character { fg = yellow_orange },
		Number { fg = light_green },
		Boolean { fg = purple },
		Float { Number },

		Identifier { fg = light_blue },
		Function { fg = yellow },

		Keyword { fg = blue },
		Statement { Keyword },
		Conditional { Statement },
		Repeat { Statement },
		Label { fg = pink },
		-- Operator { fg = hsl(24, 92, 84) },
		Operator { fg = norm_fg },
		Exception { Statement },

		PreProc { Keyword },
		Include { PreProc },
		Define { PreProc },
		Macro { fg = pink, bg = hsl(218, 16, 15) },
		PreCondit { PreProc },

		StorageClass { fg = blue },
		Structure { fg = hsl(174, 50, 56) },
		Type { Structure },
		Typedef { Type },

		Special { fg = yellow_orange },
		SpecialChar { Special },
		Tag { Special },
		Delimiter { Special },
		SpecialComment { Special },
		Debug { Special },

		Underlined { gui = "underline" },
		-- Ignore { },
		Error { fg = error_red },
		Todo { fg = norm_bg, bg = yellow_orange, gui = "bold" },

		--
		-- LSP
		--
		LspReferenceText { SelectionHighlightBackground },
		LspReferenceRead { SelectionHighlightBackground },
		LspReferenceWrite { SelectionHighlightBackground },
		LspCodeLens { CodeLens },
		-- LspCodeLensSeparator { }, -- Used to color the seperator between two or more code lens.
		LspSignatureActiveParameter { MatchedCharacters },
		LspInlayHint { fg = hsl("#9f9f9f"), bg = hsl("#2a2a2a") },

		--
		-- Notify
		--
		NotifyBackground { bg = norm_bg_solid },

		--
		-- Diagnostics
		--
		DiagnosticError { fg = error_red },
		DiagnosticWarn { fg = warn_yellow },
		DiagnosticInfo { fg = info_blue },
		DiagnosticHint { fg = hsl(250, 40, 77) },
		DiagnosticOk { fg = ok_green },
		DiagnosticVirtualTextError { DiagnosticError, bg = "#332323" },
		DiagnosticVirtualTextWarn { DiagnosticWarn, bg = "#2f2c1b" },
		DiagnosticVirtualTextInfo { DiagnosticInfo, bg = "#212a35" },
		DiagnosticVirtualTextHint { DiagnosticHint, bg = hsl(250, 9, 20) },
		DiagnosticVirtualTextOk { DiagnosticOk, bg = "#233323" },
		DiagnosticUnderlineError { gui = "undercurl", sp = error_red },
		DiagnosticUnderlineWarn { gui = "undercurl", sp = warn_yellow },
		DiagnosticUnderlineInfo { gui = "undercurl", sp = info_blue },
		DiagnosticUnderlineHint { gui = "undercurl", sp = hint_gray },
		DiagnosticUnderlineOk { gui = "undercurl", sp = ok_green },
		DiagnosticFloatingError { DiagnosticError },
		DiagnosticFloatingWarn { DiagnosticWarn },
		DiagnosticFloatingInfo { DiagnosticInfo },
		DiagnosticFloatingHint { DiagnosticHint },
		DiagnosticFloatingOk { DiagnosticOk },
		DiagnosticSignError { DiagnosticError },
		DiagnosticSignWarn { DiagnosticWarn },
		DiagnosticSignInfo { DiagnosticInfo },
		DiagnosticSignHint { DiagnosticHint },
		DiagnosticSignOk { DiagnosticOk },
		DiagnosticUnnecessary { UnnecessaryCode, gui = "underdashed" },
		DiagnosticDeprecated { fg = gray3, gui = "strikethrough" },

		TreesitterContext { Pmenu },
		TreesitterContextLineNumber { LineNr, bg = TreesitterContext.bg },
		TreesitterContextBottom { gui = "underline", sp = black },

		--
		-- Treesitter
		--
		-- The obsolete TS* highlight groups are removed since this commit
		-- https://github.com/nvim-treesitter/nvim-treesitter/commit/42ab95d5e11f247c6f0c8f5181b02e816caa4a4f
		-- Now use the capture names directly as the highlight groups.
		-- (1). How to define the highlight group, see https://github.com/rktjmp/lush.nvim/issues/109
		-- (2). To find all the capture names, see https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md#highlights)

		-- Misc
		sym("@comment") { Comment },
		sym("@comment.documentation") { sym("@comment") },
		sym("@error") { fg = error_red },
		-- sym("@none") { },
		-- sym("@preproc") { },
		-- sym("@define") { },
		sym("@operator") { Operator },

		-- Punctuation
		sym("@punctuation.delimiter") { fg = norm_fg },
		sym("@punctuation.bracket") { fg = norm_fg },
		sym("@punctuation.special") { fg = blue },

		-- Literals
		-- sym("@string") { },
		sym("@string.documentation") { fg = orange },
		sym("@string.regex") { fg = light_red },
		sym("@string.escape") { fg = yellow_orange },
		-- sym("@string.special") { },
		-- sym("@character") { },
		-- sym("@character.special") { },
		-- sym("@boolean") { },
		-- sym("@number") { },
		-- sym("@float") { },

		-- Function
		-- sym("@function") { },
		sym("@function.builtin") { Function },
		sym("@function.call") { Function },
		sym("@function.macro") { fg = Macro.fg },
		-- sym("@method") { },
		-- sym("@method.call") { },
		sym("@constructor") { Keyword },
		sym("@parameter") { fg = light_blue },

		-- Keyword
		sym("@keyword") { Keyword },
		sym("@keyword.coroutine") { fg = pink },
		sym("@keyword.function") { fg = blue },
		sym("@keyword.operator") { Keyword, gui = "bold" },
		sym("@keyword.return") { fg = pink },
		-- sym("@conditional") { },
		-- sym("@conditional.ternary") { },
		-- sym("@repeat") { },
		-- sym("@debug") { },
		sym("@label") { fg = label_fg },
		sym("@label.rust") { fg = light_orange },
		-- sym("@include") { },
		-- sym("@exception") { },

		-- Types
		sym("@type") { fg = blue_green },
		sym("@type.builtin") { fg = blue },
		sym("@type.definition") { fg = blue_green },
		sym("@type.qualifier") { fg = blue },
		sym("@storageclass") { fg = blue },
		sym("@attribute") { fg = Macro.fg },
		sym("@field") { fg = light_blue },
		sym("@property") { sym("@field") },

		-- Identifiers
		sym("@variable") { fg = light_blue },
		sym("@variable.builtin") { fg = blue },
		sym("@constant") { Constant },
		sym("@constant.builtin") { Constant },
		sym("@constant.macro") { PreProc },
		sym("@namespace") { fg = light_green },
		-- sym("@symbol") { },

		-- Text (Mainly for markup languages)
		sym("@text") { fg = norm_fg },
		sym("@text.strong") { fg = norm_fg, gui = "bold" },
		sym("@text.emphasis") { fg = norm_fg, gui = "italic" },
		sym("@text.underline") { fg = norm_fg, gui = "underline" },
		sym("@text.strike") { fg = norm_fg, gui = "strikethrough" },
		sym("@text.title") { Title, gui = "bold" },
		sym("@text.literal") { fg = orange },
		-- sym("@text.quote") { },
		sym("@text.uri") { Tag },
		sym("@text.math") { fg = blue_green },
		-- sym("@text.environment") { },
		-- sym("@text.environment.name") { },
		sym("@text.reference") { fg = orange },
		sym("@text.todo") { Todo },
		sym("@text.note") { fg = info_blue },
		sym("@text.warning") { fg = warn_yellow },
		sym("@text.danger") { fg = error_red },
		sym("@text.diff.add") { DiffTextAdded },
		sym("@text.diff.delete") { DiffTextDeleted },

		-- Tags
		sym("@tag") { fg = blue },
		sym("@tag.tsx") { Type },
		sym("@tag.attribute") { fg = light_blue },
		sym("@tag.delimiter") { fg = gray3 },

		-- Conceal
		-- sym("@conceal") { },

		-- Spell
		-- sym("@spell") { },
		-- sym("@nospell") { },

		--
		-- LSP semantic tokens
		--
		-- The help page :h lsp-semantic-highlight
		-- A short guide: https://gist.github.com/swarn/fb37d9eefe1bc616c2a7e476c0bc0316
		-- Token types and modifiers are described here: https://code.visualstudio.com/api/language-extensions/semantic-highlight-guide
		sym("@lsp.type.namespace") { sym("@namespace") },
		sym("@lsp.type.type") { fg = blue_green },
		sym("@lsp.type.class") { fg = blue_green },
		sym("@lsp.type.enum") { fg = blue_green },
		sym("@lsp.type.interface") { fg = blue_green },
		sym("@lsp.type.struct") { fg = blue_green },
		sym("@lsp.type.typeParameter") { fg = blue_green },
		sym("@lsp.type.parameter") { fg = light_blue },
		sym("@lsp.type.variable") { fg = light_blue },
		sym("@lsp.type.property") { fg = light_blue },
		sym("@lsp.type.enumMember") { fg = blue2 },
		sym("@lsp.type.event") { fg = light_red },
		sym("@lsp.type.function") { fg = yellow },
		sym("@lsp.type.method") { fg = yellow_orange },
		-- sym("@lsp.type.macro") { fg = blue },
		sym("@lsp.type.macro") { Macro },
		sym("@lsp.type.keyword") { fg = blue },
		sym("@lsp.type.modifier") { fg = blue },
		sym("@lsp.type.comment") { Comment },
		sym("@lsp.type.string") { String },
		sym("@lsp.type.number") { Number },
		sym("@lsp.type.regexp") { sym("@string.regex") },
		sym("@lsp.type.operator") {},
		sym("@lsp.type.decorator") { sym("@attribute") },
		sym("@lsp.type.lifetime") { sym("@label") },
		sym("@lsp.type.lifetime.rust") { sym("@label.rust") },
		sym("rustDerive") { sym("@attribute") },
		sym("rustDeriveTrait") { sym("@function.macro") },
		sym("@lsp.type.deriveHelper") { Macro },
		sym("@lsp.type.derive") { fg = light_green, bg = hsl(139, 16, 15) },
		sym("@lsp.type.formatSpecifier") { fg = blue2 },
		sym("@lsp.mod.constant") { Constant },
		sym("@lsp.typemod.type.defaultLibrary") { fg = blue_green },
		sym("@lsp.typemod.class.defaultLibrary") { fg = blue_green },
		sym("@lsp.typemod.variable.defaultLibrary") { sym("@variable.builtin") },
		sym("@lsp.typemod.function.defaultLibrary") { sym("@function.builtin") },
		sym("@lsp.typemod.method.defaultLibrary") { sym("@function.builtin") },
		sym("@lsp.typemod.macro.defaultLibrary") { fg = yellow_orange, bg = hsl(1, 16, 17) },
		sym("@lsp.typemod.variable.readonly") { fg = blue2 },
		sym("@lsp.typemod.property.readonly") { fg = blue2 },
		-- Set injected highlights. Mainly for Rust doc comments and also works for
		-- other lsps that inject tokens in comments.
		-- Ref: https://github.com/folke/tokyonight.nvim/pull/340
		sym("@lsp.typemod.operator.injected") { sym("@lsp.type.operator") },
		sym("@lsp.typemod.string.injected") { sym("@lsp.type.string") },
		sym("@lsp.typemod.variable.injected") { sym("@lsp.type.variable") },

		--
		-- nvim-lspconfig
		--
		-- LspInfoTitle { },
		-- LspInfoList { },
		-- LspInfoFiletype { },
		-- LspInfoTip { },
		LspInfoBorder { FloatBorder },

		--
		-- nvim-cmp
		--
		CmpItemAbbrDeprecated { fg = gray3, bg = "NONE", gui = "strikethrough" },
		CmpItemAbbrMatch { MatchedCharacters, bg = "NONE" },
		CmpItemAbbrMatchFuzzy { CmpItemAbbrMatch },
		CmpItemMenu { Description },
		CmpItemKindText { fg = "#cccccc", bg = "NONE" },
		CmpItemKindMethod { fg = "#b180d7", bg = "NONE" },
		CmpItemKindFunction { CmpItemKindMethod },
		CmpItemKindConstructor { CmpItemKindFunction },
		CmpItemKindField { fg = "#75beff", bg = "NONE" },
		CmpItemKindVariable { CmpItemKindField },
		CmpItemKindClass { fg = "#ee9d28", bg = "NONE" },
		CmpItemKindInterface { CmpItemKindField },
		CmpItemKindModule { CmpItemKindText },
		CmpItemKindProperty { CmpItemKindText },
		CmpItemKindUnit { CmpItemKindText },
		CmpItemKindValue { CmpItemKindText },
		CmpItemKindEnum { CmpItemKindClass },
		CmpItemKindKeyword { CmpItemKindText },
		CmpItemKindSnippet { CmpItemKindText },
		CmpItemKindColor { CmpItemKindText },
		CmpItemKindFile { CmpItemKindText },
		CmpItemKindReference { CmpItemKindText },
		CmpItemKindFolder { CmpItemKindText },
		CmpItemKindEnumMember { CmpItemKindField },
		CmpItemKindConstant { CmpItemKindText },
		CmpItemKindStruct { CmpItemKindText },
		CmpItemKindEvent { CmpItemKindClass },
		CmpItemKindOperator { CmpItemKindText },
		CmpItemKindTypeParameter { CmpItemKindText },
		-- Predefined for the winhighlight config of cmp float window
		SuggestWidgetBorder { FloatBorder },
		SuggestWidgetSelect { bg = selection_blue },

		--
		-- diff
		--
		-- VSCode doesn't have foreground for git added/removed/changed, so here I
		-- use the corresponding colors for gutter instead.
		diffAdded { GutterGitAdded },
		diffRemoved { GutterGitDeleted },
		diffChanged { GutterGitModified },

		--
		-- Aerial
		--
		AerialTextIcon { CmpItemKindText },
		AerialMethodIcon { CmpItemKindMethod },
		AerialFunctionIcon { CmpItemKindFunction },
		AerialConstructorIcon { CmpItemKindConstructor },
		AerialFieldIcon { CmpItemKindField },
		AerialVariableIcon { CmpItemKindVariable },
		AerialClassIcon { CmpItemKindClass },
		AerialInterfaceIcon { CmpItemKindInterface },
		AerialModuleIcon { CmpItemKindModule },
		AerialPropertyIcon { CmpItemKindProperty },
		AerialUnitIcon { CmpItemKindUnit },
		AerialValueIcon { CmpItemKindValue },
		AerialEnumIcon { CmpItemKindEnum },
		AerialKeywordIcon { CmpItemKindKeyword },
		AerialSnippetIcon { CmpItemKindSnippet },
		AerialColorIcon { CmpItemKindColor },
		AerialFileIcon { CmpItemKindFile },
		AerialReferenceIcon { CmpItemKindReference },
		AerialFolderIcon { CmpItemKindFolder },
		AerialEnumMemberIcon { CmpItemKindEnumMember },
		AerialConstantIcon { CmpItemKindConstant },
		AerialStructIcon { CmpItemKindStruct },
		AerialEventIcon { CmpItemKindEvent },
		AerialOperatorIcon { CmpItemKindOperator },
		AerialTypeParameterIcon { CmpItemKindTypeParameter },

		--
		-- Gitsigns
		--
		NvimTreeGitNew { GutterGitAdded },
		NvimTreeGitDeleted { GutterGitDeleted },
		NvimTreeGitDirty { GutterGitModified },
		NvimTreeGitStaged { fg = hsl(160, 60, 50), gui = "bold" },
		NvimTreeGitUnstaged { fg = hsl(0, 60, 50), gui = "bold" },
		NvimTreeNormal { bg = tree_bg },
		NvimTreeNormalNC { bg = tree_nc_bg },
		NvimTreeCursorLine { bg = tree_line, gui = "bold" },

		NeoTreeGitAdded { GutterGitAdded },
		NeoTreeGitDeleted { GutterGitDeleted },
		NeoTreeGitModified { GutterGitModified },
		NeoTreeGitStaged { NvimTreeGitStaged },
		NeoTreeGitUnstaged { NvimTreeGitUnstaged },
		-- NeoTreeGitUntracked { fg = GutterGitAdded.fg, bg = hsl(90, 20, 30) },
		NeoTreeGitUntracked { fg = hsl(68, 44, 51) },
		NeoTreeGitIgnored { fg = "#9f9f9f" },
		NeoTreeDotfile { fg = "#bbbbbb" },
		NeoTreeNormal { NvimTreeNormal },
		NeoTreeNormalNC { NvimTreeNormalNC },
		NeoTreeCursorLine { NvimTreeCursorLine },

		GitSignsAdd { GutterGitAdded },
		GitSignsChange { GutterGitModified },
		GitSignsDelete { GutterGitDeleted },
		GitSignsAddNr { GitSignsAdd },
		GitSignsChangeNr { GitSignsChange },
		GitSignsDeleteNr { GitSignsDelete },
		GitSignsAddLn { DiffAdd },
		GitSignsChangeLn { DiffChange },
		GitSignsDeleteLn { DiffDelete },
		GitSignsAddInline { DiffTextAdded },
		GitSignsChangeInline { DiffTextChanged },
		GitSignsDeleteInline { DiffTextDeleted },

		--
		-- Bufferline
		--
		BufferLineTab { fg = norm_fg, bg = norm_bg_solid },
		-- BufferLineTabInactive { BufferLineTab },
		BufferLineTabSeparator { fg = BufferLineTab.bg, bg = NormalFloat.bg },
		BufferLineSeparator { bg = BufferLineTab.bg, fg = NormalFloat.bg },
		BufferLineTabSelected { gui = "underline", sp = tab_effect, fg = blue_green, bg = hsl("#443344") },
		BufferLineOffsetSeparator { fg = BufferLineTab.bg },
		BufferLinePickVisible { fg = error_red, gui = "bold" },
		BufferLinePickSelected { BufferLineTabSelected, fg = error_red },
		BufferLineIndicator { BufferLineTab },
		BufferLineIndicatorVisible { BufferLineIndicator },
		BufferLineIndicatorSelected { BufferLineTabSelected },
		BufferLineTabSeparatorSelected {
			bg = BufferLineTabSelected.bg,
			fg = NormalFloat.bg,
			BufferLineTabSelected,
		},
		BufferLineSeparatorVisible { fg = NormalFloat.bg, bg = BufferLineTab.bg },
		BufferLineSeparatorSelected { BufferLineTabSeparatorSelected },
		BufferLineDuplicate { BufferLineTab },
		BufferLineDuplicateVisible { BufferLineTab },
		BufferLineDuplicateSelected { BufferLineTabSelected },
		BufferLineModified { BufferLineTab, fg = yellow_orange.lighten(20) },
		BufferLineModifiedVisible { BufferLineModified },
		BufferLineModifiedSelected { BufferLineTabSelected, fg = BufferLineModified.fg },
		BufferLineFill { bg = BufferLineSeparator.fg },
		BufferLineDiagnostic { BufferLineTab },
		BufferLineDiagnosticVisible { BufferLineDiagnostic },
		BufferLineDiagnosticSelected { BufferLineTabSelected },
		BufferLineErrorDiagnostic { BufferLineTab, fg = error_red },
		BufferLineErrorDiagnosticVisible { BufferLineErrorDiagnostic },
		BufferLineErrorDiagnosticSelected { BufferLineTabSelected, fg = error_red },
		BufferLineError { BufferLineTab, fg = error_red },
		BufferLineErrorVisible { BufferLineError },
		BufferLineErrorSelected { BufferLineTabSelected, fg = error_red },
		BufferLineWarningDiagnostic { BufferLineTab, fg = warn_yellow },
		BufferLineWarningDiagnosticVisible { BufferLineWarningDiagnostic },
		BufferLineWarningDiagnosticSelected { BufferLineTabSelected, fg = warn_yellow },
		BufferLineWarning { BufferLineTab, fg = warn_yellow },
		BufferLineWarningVisible { BufferLineWarning },
		BufferLineWarningSelected { BufferLineTabSelected, fg = warn_yellow },
		BufferLineInfoDiagnostic { BufferLineTab, fg = blue2 },
		BufferLineInfoDiagnosticVisible { BufferLineInfoDiagnostic },
		BufferLineInfoDiagnosticSelected { BufferLineTabSelected, fg = blue2 },
		BufferLineInfo { BufferLineTab, fg = blue2 },
		BufferLineInfoVisible { BufferLineInfo },
		BufferLineInfoSelected { BufferLineTabSelected, fg = blue2 },
		BufferLineHintDiagnostic { BufferLineTab, fg = hint_gray },
		BufferLineHintDiagnosticVisible { BufferLineHintDiagnostic },
		BufferLineHintDiagnosticSelected { BufferLineTabSelected, fg = hint_gray },
		BufferLineHint { BufferLineTab, fg = hint_gray },
		BufferLineHintVisible { BufferLineHint },
		BufferLineHintSelected { BufferLineTabSelected, fg = BufferLineHint.fg },
		BufferLineNumbers { BufferLineTab, fg = yellow },
		BufferLineNumbersVisible { BufferLineNumbers },
		BufferLineNumbersSelected { BufferLineTabSelected, fg = yellow },
		BufferLineBuffer { BufferLineTab },
		BufferLineBufferVisible { BufferLineBuffer },
		BufferLineBufferSelected { BufferLineTabSelected },
		BufferLineTabClose { BufferLineTab, fg = light_orange.desaturate(33) },
		BufferLineCloseButton { BufferLineTabClose },
		BufferLineCloseButtonVisible { BufferLineCloseButton },
		BufferLineCloseButtonSelected { BufferLineTabSelected, fg = BufferLineTabClose.fg },
		BufferLineGroupLabel { bg = hsl("#c060e0") },
		BufferLineGroupSeparator { BufferLineTabSeparator },
		BufferLineTruncMarker { gui = "bold", fg = blue2 },
		BufferLineBackground { BufferLineTab },
		BufferLinePick {},
		-- BufferLineDevIconRs {},
		BufferLineDevIconMdSelected { BufferLineTabSelected },
		BufferLineDevIconLua { fg = blue.darken(10) },
		BufferLineDevIconLuaSelected { fg = BufferLineDevIconLua.fg, BufferLineTabSelected },

		--
		-- Navic
		--
		NavicIconsFile { String, gui = "underline" },
		NavicIconsModule { sym("@namespace") },
		NavicIconsNamespace { sym("@namespace") },
		NavicIconsPackage { fg = light_red },
		NavicIconsClass { Structure },
		NavicIconsMethod { sym("@lsp.type.method") },
		NavicIconsProperty { sym("@property") },
		NavicIconsField { sym("@field") },
		NavicIconsConstructor { sym("@constructor") },
		NavicIconsEnum { sym("@lsp.type.enum") },
		NavicIconsInterface { sym("@lsp.type.interface") },
		NavicIconsFunction { Function },
		NavicIconsVariable { fg = hsl("#4488ff") },
		NavicIconsConstant { Constant },
		NavicIconsString { String },
		NavicIconsNumber { Number },
		NavicIconsBoolean { Boolean },
		NavicIconsArray { fg = blue2 },
		NavicIconsObject { fg = white, gui = "bold" },
		NavicIconsKey { sym("@attribute") },
		NavicIconsNull { Constant },
		NavicIconsEnumMember { sym("@lsp.type.enumMember") },
		NavicIconsStruct { Structure },
		NavicIconsEvent { sym("@lsp.type.event") },
		NavicIconsOperator { Operator },
		NavicIconsTypeParameter { sym("@lsp.type.typeParameter") },
		NavicText { fg = hsl("#c8c8b8") },
		NavicSeparator { fg = light_blue },
		--
		-- vim-illuminate
		--
		IlluminatedWordText { SelectionHighlightBackground },
		IlluminatedWordRead { SelectionHighlightBackground },
		IlluminatedWordWrite { SelectionHighlightBackground },

		--
		-- Telescope
		--
		TelescopeBorder { FloatBorder },
		TelescopePromptBorder { TelescopeBorder },
		TelescopeResultsBorder { TelescopePromptBorder },
		TelescopePreviewBorder { TelescopePromptBorder },
		TelescopeSelection { PmenuSel },
		TelescopeSelectionCaret { TelescopeSelection },
		TelescopeMultiIcon { fg = blue_green },
		TelescopeMatching { CmpItemAbbrMatch },
		TelescopeNormal { Normal },
		TelescopePromptPrefix { Icon },

		--
		-- Harpoon
		--
		HarpoonBorder { TelescopeBorder },
		HarpoonWindow { TelescopeNormal },

		--
		-- fFHighlight
		--
		fFHintWords { gui = "underline", sp = "yellow" },
		fFHintCurrentWord { gui = "undercurl", sp = "yellow" },

		--
		-- indent-blankline
		--
		IndentBlanklineChar { fg = indent_guide_fg },
		IndentBlanklineSpaceChar { IndentBlanklineChar },
		IndentBlanklineSpaceCharBlankline { IndentBlanklineChar },
		IndentBlanklineContextChar { fg = indent_guide_context_fg },
		IndentBlanklineContextSpaceChar { IndentBlanklineContextChar },
		IndentBlanklineContextStart { gui = "underline", sp = indent_guide_context_fg },

		--
		-- hlslens
		--
		HlSearchNear { IncSearch },
		HlSearchLens { Description },
		HlSearchLensNear { HlSearchLens },

		--
		-- nvim-ufo
		--
		UfoPreviewBorder { PeekViewBorder },
		UfoPreviewNormal { PeekViewNormal },
		UfoPreviewCursorLine { PeekViewCursorLine },
		UfoFoldedFg { fg = norm_fg },
		UfoFoldedBg { bg = folded_blue },
		UfoCursorFoldedLine { bg = "#2F3C48", gui = "bold, italic" },
		UfoPreviewSbar { PeekViewNormal },
		UfoPreviewThumb { bg = "#394a4b" },
		UfoFoldedEllipsis { fg = "#989ca0" },

		--
		-- nvim-bqf
		--
		BqfPreviewFloat { PeekViewNormal },
		BqfPreviewBorder { PeekViewBorder },
		BqfPreviewCursor { Cursor },
		BqfPreviewCursorLine { PeekViewCursorLine },
		BqfPreviewRange { PeekViewMatchHighlight },
		BqfPreviewBufLabel { fg = "#8f989e" }, -- descriptionForeground with PeekViewNormal's bg as the background
		BqfSign { fg = blue_green },

		--
		-- Symbols-outline
		--
		FocusedSymbol { fg = white, bg = selection_blue },
		SymbolsOutlineConnector { fg = "#585858" },

		--
		-- mg979/tabline.nvim
		--
		TSelect { TabLineSel },
		TVisible { TabLine },
		THidden { TabLine },
		TExtra { TabLine },
		TSpecial { TabLine },
		TFill { TabLineFill },
		TCorner { fg = white, bg = black2 },
		TNumSel { TSelect },
		TNum { TabLine },
		TSelectMod { TSelect },
		TVisibleMod { TVisible },
		THiddenMod { THidden },
		TExtraMod { TExtra },
		TSpecialMod { TSpecial },
		TSelectDim { TSelect },
		TVisibleDim { TVisible },
		THiddenDim { THidden },
		TExtraDim { TExtra },
		TSpecialDim { TSpecial },
		TSelectSep { TabBorder },
		TVisibleSep { TabBorder },
		THiddenSep { TabBorder },
		TExtraSep { TabBorder },
		TSpecialSep { TabBorder },
	}
end)
---@diagnostic enable
if config.options.transparent.float then
	theme.NormalFloat = { bg = transparent }
end
return theme
