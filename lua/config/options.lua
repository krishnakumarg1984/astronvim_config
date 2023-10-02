-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/AstroNvim/AstroNvim/blob/main/lua/astronvim/options.lua
-- Add any additional options here

vim.opt.backupdir = vim.opt.backupdir - { "." }
vim.opt.backupext = "nvimbackup"
vim.opt.breakindentopt = { "shift:2", "sbr", "list:-1" } -- https://vi.stackexchange.com/questions/9635/what-is-the-best-practice-in-vim8-for-wrapping-with-indentation-aka-breakindent
vim.opt.clipboard = ""
vim.opt.cmdheight = 1 -- until the cmdheight=0 bugs are squashed
vim.opt.complete = vim.opt.complete + { "i" }
vim.opt.conceallevel = 0
vim.opt.confirm = true -- Give me a prompt instead of just rejecting risky :write, :saveas
vim.opt.cpoptions = vim.opt.cpoptions - { "a" } -- Stop the :read command from annoyingly setting the alternative buffer
-- vim.opt.cursorlineopt = "number"
vim.opt.exrc = true
vim.opt.fileformats = vim.opt.fileformats + { "mac" } -- This gives the end-of-line (<EOL>) formats that will be tried when starting to edit a new buffer and when reading a file into an existing buffer
vim.opt.fillchars = vim.opt.fillchars + {
  fold = " "
  foldclose = ""
  foldopen = ""
  foldsep = "│"
  horiz = "━"
  horizdown = "┳"
  horizup = "┻"
  stlnc = "»"
  vert = "┃"
  verthoriz = "╋"
  vertleft = "┫"
  vertright = "┣"
}
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- set Treesitter based folding
vim.opt.foldmethod = "expr"
vim.opt.foldopen = vim.opt.foldopen + { "jump" }
vim.opt.history = 10000
vim.opt.isfname = vim.opt.isfname - { ",", "=" } -- When using commands like Ctrl-x Ctrl-f for filename completion, do not read equal signs as part of file names, a common nuisance when working with shell scripts
vim.opt.iskeyword = vim.opt.iskeyword + { "-" }
vim.opt.list = true -- show whitespace characters
vim.opt.listchars = { tab = "→ ", extends = "⟩", precedes = "⟨", trail = "·", nbsp = "␣" }
vim.opt.pumwidth = 35
vim.opt.report = 0 -- Threshold for reporting number of lines changed.
vim.opt.scrolloff = 2 -- Minimal number of screen lines to keep above and below the cursor
vim.opt.shiftround = true
vim.opt.showbreak = "↪ "
vim.opt.showmatch = true
vim.opt.showtabline = (vim.t.bufs and #vim.t.bufs > 1) and 2 or 1
vim.opt.signcolumn = "yes:1"
-- vim.opt.softtabstop = 2 -- how many spaces to insert with tab key
-- vim.opt.spellfile = vim.fn.expand "~/.config/nvim/spell/en.utf-8.add"
vim.opt.spelloptions = vim.opt.spelloptions + { "camel" }
vim.opt.splitkeep = "screen"
vim.opt.suffixes = {
  "*.aux",
  "~",
  "*.bak",
  "*.bbl",
  "*.dvi",
  "*.info",
  "*.log",
  "*.old",
  "*.o",
  "*.obj",
  "*.out",
  "*.info",
  "*.swp",
  "*/.log",
  "*/.out",
} -- This gives files lower priority, instead of outright ignoring them

vim.opt.swapfile = false
vim.opt.synmaxcol = 300
vim.opt.tags = { "$HOME/.cache/nvim/tags" }
-- vim.opt.thesaurus = vim.fn.expand "~/.config/nvim/spell/mthesaur.txt"
vim.opt.updatecount = 100 -- After typing these no. of characters, the swap file will be written to disk. When zero, no swap file will be created at all (see chapter on recovery).
vim.opt.whichwrap = {
  ["<"] = true,
  [">"] = true,
  ["["] = true,
  ["]"] = true,
  ["b"] = true,
  ["h"] = true,
  ["l"] = true,
  ["s"] = true,
}
vim.opt.wildignore = {
  "*.4ct",
  "*.4tc",
  "*.7z",
  "*.a",
  "*.acn",
  "*.acr",
  "*.alg",
  "*.auxlock",
  "*.backup",
  "*.bcf",
  "*.beam",
  "*.bin",
  "*.blg",
  "*.bmp",
  "*.brf",
  "*.cb",
  "*.cb2",
  "*.class",
  "*.cpt",
  "*.cut",
  "*.dats",
  "*.db",
  "*.dll",
  "*.dmg",
  "*.docx",
  "*.dpth",
  "*.DS_Store",
  "*.dx64fsl",
  "*.el",
  "*.end",
  "*.ent",
  "*.eps",
  "*.exe",
  "*.fasl",
  "*.fdb_latexmk",
  "*.fff",
  "*.fls",
  "*.flv",
  "*.fmt",
  "*.fot",
  "*.gaux",
  "*.gem",
  "*.gif",
  "*.git",
  "*.glg",
  "*.glo",
  "*.gls",
  "*.glsdefs",
  "*.glstex",
  "*.gtex",
  "*.hg",
  "*.hst",
  "*.idv",
  "*.idx",
  "*.ilg",
  "*.img",
  "*.ind",
  "*.ini",
  "*.ipynb",
  "*.ist",
  "*.jpeg",
  "*.JPG",
  "*.la",
  "*.lb",
  "*.lg",
  "*.listing",
  "*.lnk",
  "*.loa",
  "*.load",
  "*.loe",
  "*.lof",
  "*.lol",
  "*.lot",
  "*.lox",
  "*.ltjruby",
  "*.luac",
  "*.lx64fsl",
  "*.maf",
  "*.manifest",
  "*.mf",
  "*.mkv",
  "*.mlf",
  "*.mlt",
  "*.mo",
  "*.mod",
  "*.mp",
  "*.mp4",
  "*.mw",
  "*.nav",
  "*.nlg",
  "*.nlo",
  "*.nls",
  "*.o",
  "*.obj",
  "*.orig",
  "*.pax",
  "*.pdf",
  "*.pdfpc",
  "*.pdfsync",
  "*.png",
  "*.pre",
  "*.ps",
  "*.psd",
  "*.pyc",
  "*.pyg",
  "*.pyo",
  "*.pytxcode",
  "*.rar",
  "*.rbc",
  "*.rbo",
  "*.run.xml",
  "*.save",
  "*.snm",
  "*.so",
  "*.soc",
  "*.sout",
  "*.spl",
  "*.sqlite",
  "*.sta",
  "*.svg",
  "*.svn",
  "*.sw?",
  "*.swp",
  "*.sympy",
  "*.synctex",
  "*.synctex.gz",
  "*.tar",
  "*.tar.bz2",
  "*.tar.gz",
  "*.tar.xz",
  "*.tdo",
  "*.texpadtmp",
  "*.tfm",
  "*.thm",
  "*.tiff",
  "*.toc",
  "*.trc",
  "*.ttt",
  "*.upa",
  "*.upb",
  "*.ver",
  "*.vrb",
  "*.wrt",
  "*.xcp",
  "*.xdv",
  "*.xdy",
  "*.xlsx",
  "*.xmpi",
  "*.xpm",
  "*.xref",
  "*.xyc",
  "*.xz",
  "*.zip",
  "*/.bundle/*",
  "*/.cls",
  "*/.fdb*/",
  "*/.git/*",
  "*/.glo",
  "*/.ist",
  "*/.sass-cache/*",
  "*/.svn/*",
  "*/.toc",
  "*/.vim$",
  "*/__pycache__/*",
  "*/build/*",
  "*/builds/*",
  "*/dist*/*",
  "*/node_modules/*",
  "*/target/*",
  "*/tmp/*",
  "*/vendor/cache/*",
  "*/vendor/gems/*",
  "*/venv/*",
  "*\\tmp\\*",
  "*~",
  "./tags",
  "._*",
  ".git/",
  ".git/*",
  ".idea/",
  "~$",
  "_site",
  "bower_components/*",
  "CVS",
  "CVS/*",
  "media/*",
  "migrations",
  "tags",
  "types_*taghl",
  "vendor/cache/**",
  "vendor/rails/**",
} -- Ignore the following type of files when tab completing. There are certain files that we would never want to edit with Vim. Wildmenu will ignore files with these extensions. )))
vim.opt.wildignorecase = true -- If supported, make wildmenu completions case-insensitive
vim.opt.winaltkeys = "no"
vim.opt.winminheight = 0 -- Default is 1. The minimal height of a window, when it's not the current window.
vim.opt.wrap = true -- soft wrap lines
