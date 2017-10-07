###### 2017-10-07

vim-plug
-------------------

The [vim-plug](https://github.com/junegunn/vim-plug) plugin manages vim plugins! Installation:
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Next, add the following to the end of `~/.vimrc`:
```
" [vim-plug](https://github.com/junegunn/vim-plug)
" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Initialize plugin system
call plug#end()
```

Now let's edit `~/.vimrc` to install the [NERDTree](https://github.com/scrooloose/nerdtree) plugin:
```
" [vim-plug](https://github.com/junegunn/vim-plug)
" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'scrooose/nerdtree'

" Initialize plugin system
call plug#end()

```

Now start vim hit `ESC` and type `:PlugInstall`. That will install the NERDTree plugin. Hit `q` to exit the vim-plug pane.
