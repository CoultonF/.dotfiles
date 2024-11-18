{
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "coulton-toolset";
      paths = [
        alacritty
        neovim
        ripgrep
        lazygit
        fd
        nodejs_22
        starship
        bash-completion
      ];
    };
  };
}
