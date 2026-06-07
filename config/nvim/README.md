# Neovim Configuration

A modern, well-structured Neovim configuration built with Lua. 

## 🚀 Features

- **Plugin Management**: Uses Lazy.nvim for fast and efficient plugin loading
- **Startup Screen**: Alpha-nvim for a beautiful startup dashboard
- **Beautiful UI**: db.nvim colorscheme with transparent background support
- **Status Line**: Lualine.nvim for a beautiful and informative status bar
- **Fuzzy Finding**: Telescope integration for file searching and navigation
- **Git Integration**: LazyGit integration through Snacks.nvim and GitGutter for change indicators
- **Note Taking**: Obsidian.nvim integration for markdown note management
- **Auto-completion**: Enhanced nvim-cmp with snippets, LSP integration, and Tailwind support
- **Language Server**: Comprehensive LSP setup with Mason for multiple languages
- **Smart Keymaps**: Intuitive keybindings optimized for productivity
- **File Browser**: Integrated telescope file browser with hidden file support
- **Mini File Explorer**: Mini.files for lightweight file navigation
- **Focus Mode**: Focus.nvim for distraction-free editing
- **Color Highlighting**: Nvim-colorizer for enhanced color display
- **Syntax Highlighting**: Treesitter for advanced syntax parsing
- **Key Display**: Showkeys for displaying pressed keys
- **Code Utilities**: Mini suite for comments, surround, whitespace, and split/join operations
- **Code Formatting**: Conform.nvim for automatic code formatting
- **Diagnostics**: Trouble.nvim for better diagnostic display
- **Enhanced UI**: Noice.nvim for improved command line and popup interfaces
- **HTML/CSS**: Emmet support for rapid HTML/CSS development
- **Auto-pairs**: Nvim-autopairs for automatic bracket and quote pairing
- **Spell Checking**: Telescope spell suggestions and language switching

## 📁 Structure

```
~/.config/nvim/
├── init.lua                 # Main entry point
├── lazy-lock.json          # Plugin lock file
├── after/                  # After directory (empty)
└── lua/
    ├── core/
    │   ├── init.lua        # Core initialization
    │   ├── keymaps.lua     # Key mappings
    │   └── options.lua     # Neovim options
    ├── plugins/
    │   ├── alphanvim.lua   # Startup screen configuration
    │   ├── autopairs.lua   # Auto-pairs configuration
    │   ├── colorscheme.lua # db.nvim colorscheme
    │   ├── colorhighlight.lua # Nvim-colorizer
    │   ├── emmet.lua       # Emmet HTML/CSS abbreviations
    │   ├── focus.lua       # Focus.nvim configuration
    │   ├── formatting.lua  # Code formatting configuration
    │   ├── gitgutter.lua   # Git change indicators
    │   ├── lualine.lua     # Status line configuration
    │   ├── lush.lua        # Colorscheme development
    │   ├── mini.lua        # Mini.nvim suite configuration
    │   ├── nvim-cmp.lua    # Enhanced completion configuration
    │   ├── noice.lua       # Enhanced UI configuration
    │   ├── obsidian.lua    # Obsidian integration
    │   ├── prettier.lua    # Prettier formatting
    │   ├── showkeys.lua    # Key display configuration
    │   ├── snacks.lua      # Snacks.nvim configuration
    │   ├── spelling.lua    # Spell checking configuration
    │   ├── telescope.lua   # Telescope fuzzy finder
    │   ├── treesitter.lua  # Treesitter configuration
    │   └── trouble.lua     # Diagnostics display
    └── lsp/
        ├── mason.lua       # LSP package manager
        ├── lsp.lua         # LSP server configurations
        └── lsp-format.lua  # LSP formatting configuration
    ├── current-theme.lua   # Current theme tracking
    └── lazySetup.lua       # Lazy.nvim setup
```

## 🎨 Appearance

- **Startup Screen**: Alpha-nvim with file icons and recent files
- **Colorscheme**: [db.nvim](https://github.com/daanblom/db.nvim) - A beautiful dark theme 
- **Status Line**: Lualine.nvim with git integration and lazy updates
- **Icons**: Nvim-web-devicons for file type icons
- **Dark Mode**: Optimized for dark backgrounds
- **Color Highlighting**: Enhanced color display with nvim-colorizer
- **Enhanced UI**: Noice.nvim for improved command line and popup interfaces

## 🔧 Core Configuration

### Editor Options
- Line numbers with relative numbering
- 2-space indentation with smart indenting
- True color support
- Mouse support enabled
- Clipboard integration with system clipboard
- Undo file persistence
- Smart case-insensitive search
- Split right and below by default
- Updatetime set to 50ms for faster response
- EditorConfig support enabled

### Key Mappings

#### Leader Key
- `<Space>` - Main leader key
- `<Space>` - Local leader key

#### Navigation & Editing
- `J` - Join lines while keeping cursor in middle
- `n/N` - Search with cursor centered
- `J/K` (visual) - Move selected lines up/down
- `<`/`>` (visual) - Indent selected lines
- `x` - Delete character without yanking
- `jj` - Exit insert mode

#### System Clipboard
- `<leader>y` - Copy to system clipboard
- `<leader>Y` - Copy line to system clipboard
- `<leader>d` - Delete without yanking
- `<leader>D` - Delete line without yanking
- `<leader>yf` - Copy filepath to clipboard
- `<leader>yn` - Copy filename to clipboard
- `<leader>ye` - Copy file extension to clipboard

#### Search & Replace
- `<leader>s` - Search and replace word under cursor
- `<C-c>` - Clear search highlights

#### File Operations
- `<leader>f` - Format code

#### Tab Management
- `<leader>t` - Open new tab
- `<leader>x` - Close current tab
- `<leader>l` - Next tab
- `<leader>h` - Previous tab

#### Snacks Picker (Enhanced File Operations)
- `<leader>pf` - Find files (Snacks)
- `<leader>ps` - Search in files (Snacks)
- `<leader>pws` - Search for word under cursor (Snacks)
- `<leader>pwk` - Show keymaps (Snacks)

#### Git Integration
- `<leader>lg` - Open LazyGit
- `<leader>gl` - Open LazyGit log

#### Telescope Operations
- `<leader>pr` - Find recent files
- `<leader>pWs` - Find connected words under cursor
- `<leader>ths` - Theme switcher
- `e` - Open file browser

#### File Browser (Telescope)
- `e` - Open file browser
- `<C-v>` - Open in vertical split
- `<C-s>` - Open in horizontal split
- `<C-t>` - Open in new tab
- `N` - Create new file/folder
- `h` - Go to parent directory
- `/` - Start filtering
- `<Esc>` - Close file browser

#### Mini File Explorer
- `<leader>ee` - Toggle mini file explorer
- `<leader>ef` - Open explorer at current file location
- `<CR>` or `L` - Enter directory or open file
- `-` or `H` - Go to parent directory

#### LSP (Language Server Protocol)
- `gd` - Go to definition (Telescope)
- `gD` - Go to declaration
- `gi` - Go to implementation (Telescope)
- `gt` - Go to type definition (Telescope)
- `gR` - Show references (Telescope)
- `K` - Show hover documentation
- `<leader>rn` - Smart rename
- `<leader>vca` - Code actions
- `<leader>d` - Show line diagnostics
- `<leader>D` - Show buffer diagnostics (Telescope)
- `<leader>rs` - Restart LSP
- `<C-h>` - Signature help (insert mode)

#### Diagnostics & Formatting
- `<leader>xw` - Open workspace diagnostics (Trouble)
- `<leader>xd` - Open document diagnostics (Trouble)
- `<leader>xq` - Open quickfix list (Trouble)
- `<leader>xl` - Open location list (Trouble)
- `<leader>xt` - Open todos (Trouble)
- `<leader>mp` - Format file or range (Conform)
- `<leader>xe` - Wrap with Emmet abbreviation

#### Code Utilities
- `<leader>cw` - Erase trailing whitespace
- `sa` - Add surrounding (normal/visual mode)
- `ds` - Delete surrounding
- `sf` - Find surrounding (right)
- `sF` - Find surrounding (left)
- `sh` - Highlight surrounding
- `sr` - Replace surrounding
- `sj` - Join arguments
- `sk` - Split arguments
- `<C-space>` - Incremental selection (treesitter)

#### Spell Checking
- `<leader>sp` - Telescope spell suggestions
- `:SpellEN` - Switch to English spell checking
- `:SpellNL` - Switch to Dutch spell checking

## 📦 Plugins

### Core Plugins
- **[Lazy.nvim](https://github.com/folke/lazy.nvim)** - Plugin manager with automatic updates and change detection
- **[Alpha-nvim](https://github.com/goolord/alpha-nvim)** - Startup screen with file icons
- **[Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)** - Fuzzy finder with FZF integration
- **[Snacks.nvim](https://github.com/folke/snacks.nvim)** - Enhanced picker and utilities with LazyGit integration
- **[Nvim-autopairs](https://github.com/windwp/nvim-autopairs)** - Auto-pair brackets and quotes with Treesitter integration

### Appearance
- **[db.nvim](https://github.com/daanblom/db.nvim)** - Colorscheme 
- **[Lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)** - Status line with git integration and lazy updates
- **[Nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)** - File icons
- **[Nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua)** - Color highlighting
- **[Noice.nvim](https://github.com/folke/noice.nvim)** - Enhanced UI for command line and popups
- **[Lush.nvim](https://github.com/rktjmp/lush.nvim)** - Colorscheme development

### Productivity
- **[Obsidian.nvim](https://github.com/epwalsh/obsidian.nvim)** - Obsidian integration with workspace configuration
- **[Focus.nvim](https://github.com/cdmill/focus.nvim)** - Focus mode and zen editing
- **[Showkeys](https://github.com/nvzone/showkeys)** - Display pressed keys with customizable window

### Git Integration
- **[Vim-gitgutter](https://github.com/airblade/vim-gitgutter)** - Git change indicators

### Language Server Protocol
- **[Mason.nvim](https://github.com/williamboman/mason.nvim)** - LSP package manager with automatic installation
- **[Mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim)** - Mason LSP integration
- **[Mason-tool-installer](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim)** - Auto-install tools
- **[Nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)** - LSP configurations
- **[Nvim-lsp-file-operations](https://github.com/antosha417/nvim-lsp-file-operations)** - LSP file operations

#### Supported LSP Servers
- **lua_ls** - Lua language server
- **html** - HTML language server
- **bashls** - Bash language server
- **cssls** - CSS language server
- **tailwindcss** - Tailwind CSS language server
- **gopls** - Go language server
- **emmet_ls** - Emmet language server
- **emmet_language_server** - Alternative Emmet server
- **marksman** - Markdown language server
- **denols** - Deno language server
- **ts_ls** - TypeScript language server

#### Development Tools
- **prettier** - Code formatter
- **stylua** - Lua formatter
- **isort** - Python import sorter
- **pylint** - Python linter
- **clangd** - C/C++ language server

### Enhanced Completion
- **[Nvim-cmp](https://github.com/hrsh7th/nvim-cmp)** - Completion engine with smart behavior
- **[Cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)** - LSP completion source
- **[Cmp-buffer](https://github.com/hrsh7th/cmp-buffer)** - Buffer completion source
- **[Cmp-path](https://github.com/hrsh7th/cmp-path)** - Path completion source
- **[LuaSnip](https://github.com/L3MON4D3/LuaSnip)** - Snippet engine with JS regex support
- **[Cmp-luasnip](https://github.com/saadparwaiz1/cmp_luasnip)** - LuaSnip completion
- **[Friendly-snippets](https://github.com/rafamadriz/friendly-snippets)** - VSCode-style snippets
- **[Lspkind.nvim](https://github.com/onsails/lspkind.nvim)** - VSCode pictograms
- **[Tailwindcss-colorizer-cmp](https://github.com/roobert/tailwindcss-colorizer-cmp.nvim)** - Tailwind color support

### Code Enhancement
- **[Nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** - Syntax highlighting and parsing
- **[Nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)** - Auto-close tags for JSX/TSX/HTML
- **[Mini.nvim](https://github.com/echasnovski/mini.nvim)** - Lightweight plugin suite
  - **mini.comment** - Comment operations with context awareness and TSX/JSX support
  - **mini.files** - Lightweight file explorer with proper navigation
  - **mini.surround** - Surround text objects with custom mappings
  - **mini.trailspace** - Trailing whitespace management with auto-highlight removal
  - **mini.splitjoin** - Split and join code structures

### Code Formatting & Diagnostics
- **[Conform.nvim](https://github.com/stevearc/conform.nvim)** - Code formatting with language-specific formatters
- **[Trouble.nvim](https://github.com/folke/trouble.nvim)** - Better diagnostics display with todo integration
- **[Prettier.nvim](https://github.com/MunifTanjim/prettier.nvim)** - Prettier integration
- **[Nvim-emmet](https://github.com/olrtg/nvim-emmet)** - Emmet HTML/CSS abbreviations

### Telescope Extensions
- **telescope-fzf-native** - FZF integration for faster searching
- **telescope-file-browser** - File browser with hidden file support
- **telescope-themes** - Theme switcher with live preview
- **telescope-spell-errors** - Spell checking integration

### Spell Checking
- **[Telescope-spell-errors](https://github.com/matkrin/telescope-spell-errors.nvim)** - Spell error detection and suggestions

## 🛠️ Installation

1. **Prerequisites**
   - Neovim 0.8.0 or higher
   - Git
   - A Nerd Font (recommended for icons)

2. **Clone the configuration**
   ```bash
   git clone <your-repo-url> ~/.config/nvim
   ```

3. **Install dependencies**
   ```bash
   # Install ripgrep for telescope live grep (optional but recommended)
   # Arch Linux
   sudo pacman -S ripgrep
   
   # Ubuntu/Debian
   sudo apt install ripgrep
   ```

4. **Start Neovim**
   ```bash
   nvim
   ```

   Lazy.nvim will automatically install all plugins on first run.

## 🔄 Updating

To update plugins:
```vim
:Lazy sync
```

To update the configuration:
```bash
cd ~/.config/nvim
git pull
```

## 🎨 Customization

### Adding New Plugins
Add new plugin configurations in `lua/plugins/` directory. Each file should return a plugin specification table.

### Modifying Keymaps
Edit `lua/core/keymaps.lua` to customize keybindings.

### Changing Options
Modify `lua/core/options.lua` to adjust Neovim settings.

### Obsidian Configuration
The Obsidian integration is configured for a specific workspace path. Update `lua/plugins/obsidian.lua` to match your Obsidian vault location.

## 📝 Notes

- The configuration uses Lazy.nvim for fast plugin loading with automatic updates and change detection
- All plugins are configured with lazy loading for optimal performance
- Git integration is available through LazyGit and GitGutter
- Focus mode available for distraction-free reading or editing
- Treesitter provides advanced syntax highlighting for multiple languages including Lua, TypeScript, Go, HTML, CSS, Python, Rust, Java, and more
- Mini.nvim suite offers lightweight alternatives to larger plugins
- Comprehensive LSP setup supports multiple languages including Lua, TypeScript, Go, HTML, CSS, Python, Rust, and more
- Enhanced completion with snippets, LSP integration, and Tailwind CSS support
- Mason automatically manages LSP servers and development tools
- Conform.nvim provides automatic code formatting with language-specific formatters including Biome, Prettier, Stylua, and more
- Trouble.nvim offers a better interface for viewing diagnostics and quickfix lists with todo integration
- Noice.nvim enhances the UI with improved command line and popup interfaces
- Emmet support for rapid HTML/CSS development with abbreviation expansion
- Auto-pairs with Treesitter integration for smart bracket and quote pairing
- Showkeys displays pressed keys in a customizable window
- The configuration includes comprehensive diagnostic icons and virtual text
- LSP file operations are automatically handled
- The status line shows git branch, diff information, and lazy updates
- File browser supports hidden files and custom keymaps
- Mini files provides a lightweight alternative to larger file explorers
- Spell checking with telescope integration and language switching support

## 🤝 Contributing

Feel free to submit issues and enhancement requests!

## 📄 License

This configuration is open source and available under the [MIT License](LICENSE). 
