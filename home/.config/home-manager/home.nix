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

  home.stateVersion = "26.05";

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
      eza
      fd
      fish
      font-awesome
      ghostty
      git
      go
      helix
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
      tinymist
      tldr
      typstyle
      wezterm
      wget
      yt-dlp
      zoxide
    ]
    ++ (with pkgs-unstable; [
      jujutsu
      noctalia-shell
    ]);

  fonts.fontconfig.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
