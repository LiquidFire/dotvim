default: plugins

plugins: vimrc vundle
	vim '+BundleInstall' '+qa'

vimrc:
	[ -e ~/.vimrc ] || ln -s ~/.vim/vimrc ~/.vimrc

vundle:
	[ -e ~/.vim/bundles/vundle ] || git submodule init
	git submodule update
