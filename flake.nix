{
  description = "Nix Flake Templates for Various Developing Environment";
  outputs = {self}: {
    templates = rec {
      python = {
        path = ./python;
        description = "A simple python template supported by devenv";
      };
    };
    defaultTemplate = self.templates.python;
  };
}
