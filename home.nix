{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    qtile = "qtile";
    nvim = "nvim";
  };
in 

{
	home.username = "db";
	home.homeDirectory = "/home/db";
	programs.git.enable = true;
	home.stateVersion = "26.05";
	programs.bash = {
		enable = true;
	};

  xdg.configFile = builtins.mapAttrs
    (name: subpath: {
      source = create_symlink "${dotfiles}/${subpath}";
      recursive = true;
     })
    configs; 

	home.packages = with pkgs; [
    zip
    unzip
		neovim
		ripgrep
		nil
		nixpkgs-fmt
		nodejs
		gcc
		gnumake
    gopls
    fzf
    go
    deno
    stylua
    zsh
    tree
    zsh
    oh-my-zsh
  	tree-sitter
	];

programs.zsh = {
  enable = true;

  enableAutosuggestions = true;
  syntaxHighlighting.enable = true;

   oh-my-zsh = {
   enable = true;
   plugins = [ "git" ];
 };

  shellAliases = {
    ll = "ls -l";
    n = "nvim";
    update = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#nixos-vm";
  };

  history = {
    size = 10000;
    path = "$HOME/.zsh_history";
  };

  setOptions = [
    "HIST_IGNORE_ALL_DUPS"
  ];
  };
}
