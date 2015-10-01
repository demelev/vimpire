@echo off
set project_dir=%1
mkdir %project_dir%"/.vim"
cp %VIM%/vimfiles/ProjectSettings/* %project_dir%"/.vim/"

touch %project_dir%/%2/_vimroot
