new:
	stow --adopt -t /Users/adam/.config/nvim/lua/custom nvim

sync: 
	cd ~/.dotfiles && cp -r ~/.config/nvim/lua/custom/* nvim
