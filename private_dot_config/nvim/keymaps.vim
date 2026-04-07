" =========================
" keymaps.vim
" =========================

" ノーマルモードでの Emacs 風行頭・行末移動
nnoremap <C-a> ^
nnoremap <C-e> $

" 挿入モードでの Emacs 風行頭・行末移動
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$

" 挿入モードで jk を Esc に（Insert -> Normal）
inoremap jk <Esc>

" ビジュアルモードでの Emacs 風行頭・行末移動
vnoremap <C-a> ^
vnoremap <C-e> $

" コマンドラインモードでの Emacs 風行頭・行末移動
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

nnoremap <leader>d "_d
nnoremap <leader>c "_c

" Yで現在のカーソルから行末までヤンク
nnoremap Y y$

" 1文字の削除/置換でレジスタを汚さない
nnoremap x "_x
nnoremap s "_s

nnoremap <Leader>* /\C\<<C-r><C-w>\><CR>

" Diffview

