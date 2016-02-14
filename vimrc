" /etc/vim/vimrc ou ~/.vimrc
" Fichier de configuration de Vim
" Formation Debian GNU/Linux par Alexis de Lattre
" http://formation-debian.via.ecp.fr/

" ':help options.txt' ou ':help nom_du_paramètre' dans Vim
" pour avoir de l'aide sur les paramètres de ce fichier de configuration

"Pathogen setting
set nocp
filetype off
execute pathogen#infect()
filetype plugin indent on

" Avertissement par flash (visual bell) plutôt que par beep
set vb

" Active la coloration syntaxique
syntax on
" Définit le jeu de couleurs utilisé
" Les jeux de couleur disponibles sont les fichiers avec l'extension .vim
" dans le répertoire /usr/share/vim/vimcurrent/colors/
set background=dark
colorscheme solarized

" Affiche la position du curseur 'ligne,colonne'
set ruler
" Affiche une barre de status en bas de l'écran
set laststatus=2
" Contenu de la barre de status
set statusline=%<%f%h%m%r%=%l,%c\ %P

" Largeur maxi du texte inséré
" '72' permet de wrapper automatiquement à 72 caractères
" '0' désactive la fonction
set textwidth=0

" Wrappe à 72 caractères avec la touche '#'
map # gwap
" Wrappe et justifie à 72 caractères avec la touche '@'
map @ {v}! par 72j

" Ne pas assurer la compatibilité avec l'ancien Vi
set nocompatible 
"Options générale 
set encoding=utf-8 
set scrolloff=3 
set autoindent 
set showmode 
set hidden 
set wildmenu 
" Affice la ligne sur laquelle est situé le curseur différemment
set cursorline 
set ttyfast 
set ruler 
set laststatus=2 "
"Demande à Vim de créer <FILENAME>.un~ dès qu'un fichier est édité, pour que la
"fonction undo fonctionne même après une fermeture/réouverture du fichier. 
set undofile

" Nombre de colonnes (inutile, voire gênant)
"set columns=80
" Nombre de commandes dans l'historique
set history=50
" Options du fichier ~/.viminfo
set viminfo='20,\"50
" Active la touche Backspace
set backspace=2
" Autorise le passage d'une ligne à l'autre avec les flèches gauche et droite
set whichwrap=<,>,[,]
" Garde toujours une ligne visible à l'écran au dessus du curseur
set scrolloff=1
" Affiche les commandes dans la barre de status
set showcmd
" Essaye de garder le curseur dans la même colonne quand on change de ligne
set nostartofline
" Option de la complétion automatique
set wildmode=list:full
" Par défaut, ne garde pas l'indentation de la ligne précédente
" quand on commence une nouvelle ligne
set noautoindent
" Options d'indentation pour un fichier C
set cinoptions=(0
"Prenvents a security exploit
set modelines=0

" xterm-debian est un terminal couleur
if &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
    set t_Co=16
    set t_Sf=[3%dm
    set t_Sb=[4%dm
endif

" Décommentez les 2 lignes suivantes si vous voulez avoir les tabulations et
" les espaces marqués en caractères bleus
"set list
"set listchars=tab:>-,trail:-

" Les recherches ne sont pas 'case sensitives'
set ignorecase

" Le découpage des folders se base sur l'indentation
set foldmethod=indent
" 12 niveaux d'indentation par défaut pour les folders
set foldlevel=12


" Décommentez la ligne suivante si vous voulez afficher les numéros de ligne
set number

" Tabulation settings
" Spécifie la largeur du caractère Tab
set tabstop=4
" Détermine le nombre d'espace à insérer ou supprimer lorsque la commande d'intentation est utilisée en mode NORMAL
set shiftwidth=4
" Détermine le nombre d'espace devant être inséré
set softtabstop=4
" Si activé, remplace le carèste Tab par le nombre correspondant d'espace
set expandtab

" Leader Key
let mapleader = ","

" Searching/moving options

" Corrige un défaut de vim qui exige un \v avant chaque recherche.
nnoremap / /\v
vnoremap / /\v
" Case-sensitive intelligence : si on cherche une chaine de petit caractère,
"la recherceh sera non sensible, à la casse ; si la chaîne contient des 
"majuscules, la recherche sera alors sensibles à la casse.
set ignorecase
set smartcase

set gdefault
"Search au fur et à mesure de la frappe
set incsearch
"Affiche la paire de parenthèses
set showmatch
"Affiche le mot recherché en surbrillance
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

"Options pour la gestion des longues lignes
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

" Options concernant les caractère invisible
" Active les caractères invisibles
set list
nmap <leader>l :set list!<CR>
set listchars=tab:»\ ,eol:¬ 

" Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" New vim user settings
nnoremap <up> <nop>
nnoremap <left> <nop>
nnoremap <down> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <left> <nop>
inoremap <down> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" Désactivation de l'aide
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Active la sauvegarde lors de chaque perte du focus
au FocusLost * :wa

" Supprime tous les espaces blancs de fin de lignes
nnoremap <leader>W :%s/\//<cr>:let @/=''<CR>

" Raccourci pour Ack
"nnoremap <leader> a :Ack

" Reselectionne le texte venant d'etre coller
"nnormap <leader>v V`]

" Modifie la touche pour sortir du mode INSERTION
inoremap jj <ESC>

" Gestion de l'affichage et navigation entre plusieurs fenêtre

" Ouverture d'une nouvelle fenêtre
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Gestion des copier-coller depuis clipboard
vnoremap  <leader>y "+y
vnoremap  <leader>p <Esc>:set paste<CR>gv"+p:set nopaste<CR>
nnoremap <leader>p :set paste<CR>"+p:set nopaste<CR>
