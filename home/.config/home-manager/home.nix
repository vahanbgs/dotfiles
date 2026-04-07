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
      age
      anyrun
      bat
      biome
      bottom
      caligula
      curl
      delta
      direnv
      dot
      fd
      fish
      ghostty
      git
      go
      helix
      jujutsu
      lsd
      nerd-fonts.fira-code
      nil
      nixfmt
      ripgrep
      sd
      sops
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
