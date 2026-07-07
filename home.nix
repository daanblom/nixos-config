{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/nixos-config/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    nvim = "nvim";
    tmux = "tmux";
  };
in

{
	home.username = "db";
	home.homeDirectory = "/home/db";
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
    bat
    btop
    cargo
    deno
    fastfetch
    file
    fzf
    gcc
    gnumake
    go
    gopls
    lazygit
    neovim
    nil
    nixpkgs-fmt
    nodejs
    oh-my-zsh
    python3
    ripgrep
    stylua
    tree
    tree-sitter
    unzip
    zip
    zsh
	];

programs.git = {
  enable = true;

  settings = {
    user.name = "Daan Blom";
    user.email = "contact@daanblom.com";
    init.defaultBranch = "main";
  };
};

programs.zsh = {
  enable = true;

  autosuggestion.enable = true;
  syntaxHighlighting.enable = true;

  oh-my-zsh = {
    enable = true;
    plugins = [ "git" ];
  };

  shellAliases = {
    ll = "ls -l";
    n = "nvim";
    update = "sudo nixos-rebuild switch --flake ~/nixos-config#nixos";
  };

  history = {
    size = 10000;
    path = "$HOME/.zsh_history";
  };

  setOptions = [
    "HIST_IGNORE_ALL_DUPS"
  ];

  initContent = ''
    if [ -f "$HOME/nixos-config/config/zsh/.zshrc" ]; then
      source "$HOME/nixos-config/config/zsh/.zshrc"
    fi
    '' ;
  };
}
