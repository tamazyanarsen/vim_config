call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

Plug 'https://github.com/pwntester/octo.nvim.git'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-tree/nvim-web-devicons'

Plug 'tanvirtin/monokai.nvim'

Plug 'valloric/youcompleteme'

Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-surround'

Plug 'scrooloose/syntastic'

Plug 'https://github.com/tpope/vim-fugitive.git'

Plug 'neoclide/coc-eslint'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']


Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'williamboman/mason.nvim'

Plug 'https://github.com/neovim/nvim-lspconfig.git'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting





set completeopt=menu,menuone,noselect

let $FZF_DEFAULT_COMMAND = 'ag -g ""'

nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l




" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

set number

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

:let g:NERDTreeWinSize=60

set autowriteall

syntax on
" colorscheme monokai
colorscheme monokai_pro
" colorscheme monokai_soda
" colorscheme monokai_ristretto






lua <<EOF

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
	capabilities = capabilities
}
require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
}



  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })


  -- Octo.nvim
  require"octo".setup({
  default_remote = {"upstream", "origin"}; -- order to try remotes
  ssh_aliases = {},                        -- SSH aliases. e.g. `ssh_aliases = {["github.com-work"] = "github.com"}`
  reaction_viewer_hint_icon = "";         -- marker for user reactions
  user_icon = " ";                        -- user icon
  timeline_marker = "";                   -- timeline marker
  timeline_indent = "2";                   -- timeline indentation
  right_bubble_delimiter = "";            -- bubble delimiter
  left_bubble_delimiter = "";             -- bubble delimiter
  github_hostname = "";                    -- GitHub Enterprise host
  snippet_context_lines = 4;               -- number or lines around commented lines
  gh_env = {},                             -- extra environment variables to pass on to GitHub CLI, can be a table or function returning a table
  issues = {
    order_by = {                           -- criteria to sort results of `Octo issue list`
      field = "CREATED_AT",                -- either COMMENTS, CREATED_AT or UPDATED_AT (https://docs.github.com/en/graphql/reference/enums#issueorderfield)
      direction = "DESC"                   -- either DESC or ASC (https://docs.github.com/en/graphql/reference/enums#orderdirection)
    }
  },
  pull_requests = {
    order_by = {                           -- criteria to sort the results of `Octo pr list`
      field = "CREATED_AT",                -- either COMMENTS, CREATED_AT or UPDATED_AT (https://docs.github.com/en/graphql/reference/enums#issueorderfield)
      direction = "DESC"                   -- either DESC or ASC (https://docs.github.com/en/graphql/reference/enums#orderdirection)
    },
    always_select_remote_on_create = "false" -- always give prompt to select base remote repo when creating PRs
  },
  file_panel = {
    size = 10,                             -- changed files panel rows
    use_icons = true                       -- use web-devicons in file panel (if false, nvim-web-devicons does not need to be installed)
  },
  mappings = {
    issue = {
      close_issue = { lhs = "<space>ic", desc = "close issue" },
      reopen_issue = { lhs = "<space>io", desc = "reopen issue" },
      list_issues = { lhs = "<space>il", desc = "list open issues on same repo" },
      reload = { lhs = "<C-r>", desc = "reload issue" },
      open_in_browser = { lhs = "<C-b>", desc = "open issue in browser" },
      copy_url = { lhs = "<C-y>", desc = "copy url to system clipboard" },
      add_assignee = { lhs = "<space>aa", desc = "add assignee" },
      remove_assignee = { lhs = "<space>ad", desc = "remove assignee" },
      create_label = { lhs = "<space>lc", desc = "create label" },
      add_label = { lhs = "<space>la", desc = "add label" },
      remove_label = { lhs = "<space>ld", desc = "remove label" },
      goto_issue = { lhs = "<space>gi", desc = "navigate to a local repo issue" },
      add_comment = { lhs = "<space>ca", desc = "add comment" },
      delete_comment = { lhs = "<space>cd", desc = "delete comment" },
      next_comment = { lhs = "]c", desc = "go to next comment" },
      prev_comment = { lhs = "[c", desc = "go to previous comment" },
      react_hooray = { lhs = "<space>rp", desc = "add/remove 🎉 reaction" },
      react_heart = { lhs = "<space>rh", desc = "add/remove ❤️ reaction" },
      react_eyes = { lhs = "<space>re", desc = "add/remove 👀 reaction" },
      react_thumbs_up = { lhs = "<space>r+", desc = "add/remove 👍 reaction" },
      react_thumbs_down = { lhs = "<space>r-", desc = "add/remove 👎 reaction" },
      react_rocket = { lhs = "<space>rr", desc = "add/remove 🚀 reaction" },
      react_laugh = { lhs = "<space>rl", desc = "add/remove 😄 reaction" },
      react_confused = { lhs = "<space>rc", desc = "add/remove 😕 reaction" },
    },
    pull_request = {
      checkout_pr = { lhs = "<space>po", desc = "checkout PR" },
      merge_pr = { lhs = "<space>pm", desc = "merge commit PR" },
      squash_and_merge_pr = { lhs = "<space>psm", desc = "squash and merge PR" },
      list_commits = { lhs = "<space>pc", desc = "list PR commits" },
      list_changed_files = { lhs = "<space>pf", desc = "list PR changed files" },
      show_pr_diff = { lhs = "<space>pd", desc = "show PR diff" },
      add_reviewer = { lhs = "<space>va", desc = "add reviewer" },
      remove_reviewer = { lhs = "<space>vd", desc = "remove reviewer request" },
      close_issue = { lhs = "<space>ic", desc = "close PR" },
      reopen_issue = { lhs = "<space>io", desc = "reopen PR" },
      list_issues = { lhs = "<space>il", desc = "list open issues on same repo" },
      reload = { lhs = "<C-r>", desc = "reload PR" },
      open_in_browser = { lhs = "<C-b>", desc = "open PR in browser" },
      copy_url = { lhs = "<C-y>", desc = "copy url to system clipboard" },
      goto_file = { lhs = "gf", desc = "go to file" },
      add_assignee = { lhs = "<space>aa", desc = "add assignee" },
      remove_assignee = { lhs = "<space>ad", desc = "remove assignee" },
      create_label = { lhs = "<space>lc", desc = "create label" },
      add_label = { lhs = "<space>la", desc = "add label" },
      remove_label = { lhs = "<space>ld", desc = "remove label" },
      goto_issue = { lhs = "<space>gi", desc = "navigate to a local repo issue" },
      add_comment = { lhs = "<space>ca", desc = "add comment" },
      delete_comment = { lhs = "<space>cd", desc = "delete comment" },
      next_comment = { lhs = "]c", desc = "go to next comment" },
      prev_comment = { lhs = "[c", desc = "go to previous comment" },
      react_hooray = { lhs = "<space>rp", desc = "add/remove 🎉 reaction" },
      react_heart = { lhs = "<space>rh", desc = "add/remove ❤️ reaction" },
      react_eyes = { lhs = "<space>re", desc = "add/remove 👀 reaction" },
      react_thumbs_up = { lhs = "<space>r+", desc = "add/remove 👍 reaction" },
      react_thumbs_down = { lhs = "<space>r-", desc = "add/remove 👎 reaction" },
      react_rocket = { lhs = "<space>rr", desc = "add/remove 🚀 reaction" },
      react_laugh = { lhs = "<space>rl", desc = "add/remove 😄 reaction" },
      react_confused = { lhs = "<space>rc", desc = "add/remove 😕 reaction" },
    },
    review_thread = {
      goto_issue = { lhs = "<space>gi", desc = "navigate to a local repo issue" },
      add_comment = { lhs = "<space>ca", desc = "add comment" },
      add_suggestion = { lhs = "<space>sa", desc = "add suggestion" },
      delete_comment = { lhs = "<space>cd", desc = "delete comment" },
      next_comment = { lhs = "]c", desc = "go to next comment" },
      prev_comment = { lhs = "[c", desc = "go to previous comment" },
      select_next_entry = { lhs = "]q", desc = "move to previous changed file" },
      select_prev_entry = { lhs = "[q", desc = "move to next changed file" },
      close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
      react_hooray = { lhs = "<space>rp", desc = "add/remove 🎉 reaction" },
      react_heart = { lhs = "<space>rh", desc = "add/remove ❤️ reaction" },
      react_eyes = { lhs = "<space>re", desc = "add/remove 👀 reaction" },
      react_thumbs_up = { lhs = "<space>r+", desc = "add/remove 👍 reaction" },
      react_thumbs_down = { lhs = "<space>r-", desc = "add/remove 👎 reaction" },
      react_rocket = { lhs = "<space>rr", desc = "add/remove 🚀 reaction" },
      react_laugh = { lhs = "<space>rl", desc = "add/remove 😄 reaction" },
      react_confused = { lhs = "<space>rc", desc = "add/remove 😕 reaction" },
    },
    submit_win = {
      approve_review = { lhs = "<C-a>", desc = "approve review" },
      comment_review = { lhs = "<C-m>", desc = "comment review" },
      request_changes = { lhs = "<C-r>", desc = "request changes review" },
      close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
    },
    review_diff = {
      add_review_comment = { lhs = "<space>ca", desc = "add a new review comment" },
      add_review_suggestion = { lhs = "<space>sa", desc = "add a new review suggestion" },
      focus_files = { lhs = "<leader>e", desc = "move focus to changed file panel" },
      toggle_files = { lhs = "<leader>b", desc = "hide/show changed files panel" },
      next_thread = { lhs = "]t", desc = "move to next thread" },
      prev_thread = { lhs = "[t", desc = "move to previous thread" },
      select_next_entry = { lhs = "]q", desc = "move to previous changed file" },
      select_prev_entry = { lhs = "[q", desc = "move to next changed file" },
      close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
      toggle_viewed = { lhs = "<leader><space>", desc = "toggle viewer viewed state" },
    },
    file_panel = {
      next_entry = { lhs = "j", desc = "move to next changed file" },
      prev_entry = { lhs = "k", desc = "move to previous changed file" },
      select_entry = { lhs = "<cr>", desc = "show selected changed file diffs" },
      refresh_files = { lhs = "R", desc = "refresh changed files panel" },
      focus_files = { lhs = "<leader>e", desc = "move focus to changed file panel" },
      toggle_files = { lhs = "<leader>b", desc = "hide/show changed files panel" },
      select_next_entry = { lhs = "]q", desc = "move to previous changed file" },
      select_prev_entry = { lhs = "[q", desc = "move to next changed file" },
      close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
      toggle_viewed = { lhs = "<leader><space>", desc = "toggle viewer viewed state" },
    }
  }
})
EOF
