DOTFILES_EXCLUDES	:= .git .gitignore .gitmodules . ..;
DOTFILES_TARGET	:= $(wildcard .config/??* .fonts/??*)
DOTFILES_DIR	:= $(DIR)
DOTFILES_FILES	:= $(filter-out $(DOTFILES_EXCLUDES), $(DOTFILES_TARGET))

deploy:
	@$(foreach val, $(DOTFILES_FILES), echo $(val);)
	@$(foreach val, $(DOTFILES_FILES), rm -rf $(HOME)/$(val);)
	@$(foreach val, $(DOTFILES_FILES), ln -sfv $(abspath $(val)) $(HOME)/$(val);)

init:
	@$(foreach val, $(wildcard ./etc/init/*.sh), bash $(val))
	mkdir -p $(HOME)/.config/alacritty
	mkdir -p $(HOME)/.config/bspwm
	mkdir -p $(HOME)/.config/sxhkd
	mkdir -p $(HOME)/.config/gtk-2.0
	mkdir -p $(HOME)/.config/gtk-3.0
	mkdir -p $(HOME)/.config/gtk-4.0
	mkdir -p $(HOME)/.config/feh
	mkdir -p $(HOME)/.config/polybar
	mkdir -p $(HOME)/.config/rofi
	mkdir -p $(HOME)/.config/compton
	mkdir -p $(HOME)/.fonts
