{
  pkgs,
  pkgs-unstable,
  dot,
  username,
  ...
}:
{
  home.username = username;
  home.homeDirectory = "/home/" + username;

  home.stateVersion = "25.11";

  home.packages =
    with pkgs;
    [
      anyrun
      bat
      bottom
      curl
      delta
      direnv
      dot
      fd
      fish
      git
      helix
      lsd
      nerd-fonts.fira-code
      nil
      nixfmt
      ripgrep
      sd
      sqruff
      starship
      strace
      taplo
      tldr
      wezterm
      wget
      zoxide
    ]
    ++ (with pkgs-unstable; [
      noctalia-shell
    ]);

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
