call plug#begin("~/.vim/plugged")

Plug 'neoclide/coc.nvim', {'branch': 'release'}
source ~/.config/nvim/plugins/coc.vim

Plug 'itchyny/lightline.vim'
source ~/.config/nvim/plugins/lightline.vim

Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

Plug 'lilydjwg/colorizer'

Plug 'goolord/alpha-nvim'

Plug 'justinmk/vim-sneak'

Plug 'preservim/nerdtree'

call plug#end()

lua require'alpha'.setup(require'alpha.themes.dashboard'.opts)
