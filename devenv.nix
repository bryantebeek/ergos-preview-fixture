{ pkgs, ... }:
{
  # A static site served on loopback, which Ergos may open as a preview.
  processes.web.exec = "${pkgs.python3}/bin/python3 -m http.server 8080 --bind 127.0.0.1 --directory site";

  env.ERGOS_WORKSPACE_CONTRACT = builtins.toJSON {
    previews = [
      { name = "web"; port = 8080; readinessPath = "/"; }
    ];
  };
}
