{
  pkgs,
  dot,
  username,
  ...
}:
{
  home.username = username;
  home.homeDirectory = "/home/" + username;

  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    bat
    curl
    delta
    direnv
    dot
    fd
    fish
    git
    helix
    nerd-fonts.fira-code
    nil
    nixfmt
    ripgrep
    sd
    starship
    taplo
    tldr
    tree
    wezterm
    wget
    zoxide
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
