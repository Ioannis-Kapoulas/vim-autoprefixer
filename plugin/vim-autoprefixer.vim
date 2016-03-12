
vnoremap <F7> : <c-u>call PrefixVisualMyCSS()<cr>
nnoremap <F7> : <c-u>call PrefixMyCSS()<cr>
command! Prefix call PrefixMyCSS()

function! PrefixVisualMyCSS()
    echo "Add CSS vendor prefixes to visually selected block of code"
    echo "Hit ENTER or you can add Autoprefixer CLI Options"
    call inputsave()
    let Options = input('Enter options:')
    call inputrestore()
        silent exec "'<,'>! postcss --use autoprefixer " . escape(expand(Options), '%')
endfunction

function! PrefixMyCSS()
    echo "Add vendor prefixes to CSS rules"
    echo "Hit ENTER or you can add Autoprefixer CLI Options"
    call inputsave()
    let Options = input('Enter options:')
    call inputrestore()
        silent exec "%! postcss --use autoprefixer " . escape(expand(Options), '%')
endfunction
