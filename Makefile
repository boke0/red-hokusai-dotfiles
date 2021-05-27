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
