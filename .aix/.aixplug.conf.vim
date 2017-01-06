" ========================= Plugin Config Start =========================
" Set Ale Cheacker
let g:ale_sign_error = 'x'
let g:ale_sign_warning = '*'

" AirLine Settings
let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1
let g:airline_theme='serene'
let g:airline_left_sep=''
let g:airline_right_sep=''
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ''
" let g:airline#extensions#tabline#left_alt_sep = ''
" let g:airline#extensions#tabline#right_sep = ''
" let g:airline#extensions#tabline#right_alt_sep = ''

" fzf Plugin config
set rtp+=~/.fzf

" TagBar Config
" Just configure and [make] ctags file
" let g:tagbar_ctags_bin = "/usr/bin/ctags"
" let g:tagbar_iconchars = ['+', '-']
" for coffeeScript
" let g:tagbar_type_coffee = {
" 			\ 'ctagstype' : 'coffee',
" 			\ 'kinds'     : [
" 			\ 'c:classes',
" 			\ 'm:methods',
" 			\ 'f:functions',
" 			\ 'v:variables',
" 			\ 'f:fields',
" 			\ ]
" 			\ }
" let g:tagbar_type_css = {
" 			\ 'ctagstype' : 'Css',
" 			\ 'kinds'     : [
" 			\ 'c:classes',
" 			\ 's:selectors',
" 			\ 'i:identities'
" 			\ ]
" 			\ }

"------------------ YouCompleteMe -------------------
" Linux vim && NeoVim Using YouCompleteMe
" let g:deoplete#enable_at_startup=1
" let g:ycm_auto_trigger = 1
" let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
" let g:ycm_collect_identifiers_from_tags_files = 1
" let g:ycm_add_preview_to_completeopt = 1
" let g:ycm_use_ultisnips_completer = 1
" let g:ycm_error_symbol = '>>'
" let g:ycm_warning_symbol = '>*'
" let g:ycm_cache_omnifunc = 1
" let g:ycm_max_diagnostics_to_display=10
" let g:ycm_key_list_select_completion = ['<C-n>', '<C-j>']
" let g:ycm_key_list_previous_completion = ['<C-p>', '<C-k>']
" let g:ycm_filetype_blacklist = {
" 			\ 'tagbar' : 1,
" 			\ 'qf' : 1,
" 			\ 'notes' : 1,
" 			\ 'markdown' : 1,
" 			\ 'unite' : 1,
" 			\ 'text' : 1,
" 			\ 'vimwiki' : 1,
" 			\ 'pandoc' : 1,
" 			\ 'infolog' : 1,
" 			\ 'mail' : 1,
" 			\ 'mundo': 1,
" 			\ 'fzf': 1,
" 			\ 'ctrlp' : 1
" 			\}

" let g:ycm_error_symbol = '>>'
" let g:ycm_warning_symbol = '>*'

" nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
" nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
" nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

"-------------------- NeoComplete ---------------------
" If in Windows System Using Neocomplete
if(!has('nvim'))
	let g:acp_enableAtStartup=1
	let g:neocomplete#enable_at_startup=1
	let g:neocomplete#enable_smart_case=1
	let g:neocomplete#enable_insert_char_pre=1
	let g:neocomplete#enable_multibyte_completion=1
	let g:neocomplete#sources#syntax#min_keyword_length=3
	let g:neocomplete#lock_buffer_name_pattern='\*ku\*'
	let g:neocomplete#enable_auto_select=1
	let g:neocomplete#enable_auto_delimiter=1
	let g:marching_enable_neocomplete=1
	let g:neocomplete#max_list=16
	let g:neocomplete#max_keyword_width=58
	if !exists('g:neocomplete#keyword_patterns')
		let g:neocomplete#keyword_patterns = {}
	endif
	let g:neocomplete#keyword_patterns['default']='\h\w*'
	inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
	inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
	inoremap <silent><CR> <C-r>=<SID>my_cr_function()<CR>
	
	function! s:my_cr_function()
		"return neocomplete#close_popup() . "\<CR>"
		"For no inserting <CR> key.
		return pumvisible() ? neocomplete#close_popup() : "\<CR>"
	endfunction
	
	" FileType Cheacker
	autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
	autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
	" autocmd FileType javascript setlocal omnifunc=javacriptcomplete#CompleteJS
	autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
	autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

	if !exists('g:neocomplete#sources#omni#input_patterns')
		let g:neocomplete#sources#omni#input_patterns={}
	endif
	let g:neocomplete#ctags_command="ctags"
	let g:neocomplete#sources#omni#input_patterns.c='[^.[:digit:] *\t]\%(\.\|->\)'
	let g:neocomplete#sources#omni#input_patterns.cpp='[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::\w*'

	" Called once right before you start selecting multiple cursors
	function! Multiple_cursors_before()
		echo '- Lock NeoComplete'
		exe 'NeoCompleteLock'
	endfunction

	" Called once only when the multiple selection is canceled (default <Esc>)
	function! Multiple_cursors_after()
		echo '- UnLock NeoComplete'
		exe 'NeoCompleteUnlock'
	endfunction
endif

" UltiSnips Config
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger       = "<Tab>"
let g:UltiSnipsJumpForwardTrigger  = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger = "<leader><Tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Emmet Config
" change <Tab> config , if use [YouCompleteMe]

if(has('win32'))
	" On windows . Shift+Tab can trigger emmet
	let g:user_emmet_expandabbr_key ='<S-Tab>'
else
	" But on Linux. it not trigger easy
	let g:user_emmet_expandabbr_key ='<S-Tab>e'
endif

let g:user_emmet_settings = {
			\ 'php'     : {
			\ 'extends' : 'html',
			\ 'filters' : 'c',
			\ },
			\ 'xml'     : {
			\ 'extends' : 'html',
			\ },
			\ 'haml'    : {
			\ 'extends' : 'html',
			\ },
			\ 'phtml'    : {
			\ 'extends' : 'html',
			\ }
			\}

" GitGutter Setting
let g:gitgutter_sign_column_always = 0
let g:gitgutter_max_signs = 99999

" c.vim Building Config for C/C++ Vim
" let g:C_UseTool_cmake='yes'
" let g:C_UseTool_doxygen = 'yes'
"let  g:C_LocalTemplateFile = $VIM.'/vimfiles/c-support/templates/Templates'

" Like Textmate icons.
" let g:vimfiler_tree_leaf_icon = ' '
" let g:vimfiler_tree_opened_icon = '-'
" let g:vimfiler_tree_closed_icon = '>'
" let g:vimfiler_marked_file_icon = '*'
" Use trashbox.
" Windows only and require latest vimproc.
" let g:unite_kind_file_use_trashbox = 1

" Ack Settings
if executable('ag')
	let g:ackprg = "ag --nocolor --nogroup --column"
elseif executable('ack-grep')
	let g:ackprg = "ack-grep --nocolor --nogroup --column"
elseif executable('ack')
	let g:ackprg = "ack --nocolor --nogroup --column"
endif

" Multip Cursor
" Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Vim incsearch
let g:vim_search_pulse_disable_auto_mappings = 1
let g:incsearch#auto_nohlsearch = 1

" Python snytax configure
let python_self_cls_highlight = 1

" DevIcons Config
" ColorFul NERDTree
let g:NERDTreeRespectWildIgnore=1

let g:NERDTreeDirArrows=0
" let g:webdevicons_enable = 1
" let g:webdevicons_enable_nerdtree = 1
" let g:webdevicons_enable_unite = 1
" let g:webdevicons_enable_vimfiler = 1
" let g:WebDevIconsUnicodeDecorateFileNodes = 1
" let g:WebDevIconsUnicodeDecorateFolderNodes = 1
" let g:WebDevIconsUnicodeDecorateFolderNodesExactMatches = 1
" let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
" let g:webdevicons_conceal_nerdtree_brackets = 1
" let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
" let g:WebDevIconsNerdTreeGitPluginForceVAlign=1

" ========================= Plugin Config End =========================