{
  description = "Nix Flake Templates for Various Developing Environment";
  outputs = {self}: {
    templates = rec {
      trivial = {
        path = ./trivial;
        description = "A very basic flake";
      };

      python-venv = {
        path = ./python-venv;
        description = "A simple python template supported by devenv";
      };

      python-debugger = {
        path = ./python-debugger;
        description = "A simple python template with debuggy installed";
      };

    };
    
    defaultTemplate = self.templates.trivial;
  };
}
