
vnoremap <F7> : <c-u>call PrefixVisualMyCSS()<cr>
nnoremap <F7> : <c-u>call PrefixMyCSS()<cr>
vnoremap <F8> : <c-u>call PrefixVisualMyCSSFromConfig()<cr>
nnoremap <F8> : <c-u>call PrefixMyCSSFromConfig()<cr>

command! Prefix call PrefixMyCSS()
command! PrefixDefault call PrefixMyCSSFromConfig()

if !exists('g:autoprefixer_default_rules')
	let g:autoprefixer_default_rules = '-b "> 5%"'
endif

if !exists('g:autoprefixer_on_save')
	let g:autoprefixer_on_save = 0
endif


" Global Functions
function! PrefixVisualMyCSS()
    echo "Add CSS vendor prefixes to visually selected block of code"
    silent exec s:createAutoprefixerCommand("'<,'>", s:inputAutoprefixerOptions())
endfunction

function! PrefixMyCSS()
    echo "Add vendor prefixes to CSS rules"
    silent exec s:createAutoprefixerCommand("%", s:inputAutoprefixerOptions())
endfunction

function! PrefixMyCSSFromConfig()
    echo "Adding prefixes to CSS rules based on Default Rules"
    silent exec s:createAutoprefixerCommand("%", g:autoprefixer_default_rules)
endfunction

function! PrefixVisualMyCSSFromConfig()
    echo "Adding prefixes to CSS rules based on Default Rules"
    silent exec s:createAutoprefixerCommand("'<,'>", g:autoprefixer_default_rules)
endfunction

" Local Functions
function s:createAutoprefixerCommand(scope, rules) 
    return a:scope . "! postcss --use autoprefixer " . escape(a:rules, "%")
endfunction

function s:inputAutoprefixerOptions()
    echo "Hit ENTER or you can add Autoprefixer CLI Options"
    call inputsave()
    let Options = input("Enter options:")
    call inputrestore()
        return expand(Options)
endfunction

" automatic commands
augroup autoprefixer
    if g:autoprefixer_on_save
        autocmd BufWritePre * 
            \ if &filetype == "css" || &filetype == "scss" |
                \ let currentLine = line(".") |
                \ let currentCol = col(".") |
                \ silent call PrefixMyCSSFromConfig() |
                \ silent call cursor(currentLine, currentCol) |
            \ endif
    endif
augroup END
