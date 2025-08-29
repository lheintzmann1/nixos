{ lib }:

{
  default = {
    id = 0;
    isDefault = true;
    settings = {
      "font.name.serif.x-western" = "Times New Roman";
      "font.name.sans-serif.x-western" = "Times New Roman";
      "font.default.x-western" = "serif";
      "font.size.variable.x-western" = 16;

      "font.name.monospace.x-western" = "JetBrainsMono Nerd Font";

      "browser.newtabpage.activity-stream.feeds.system.topsites" = true;
      "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
      "extensions.pocket.enabled" = false;
    };

    extraConfig =
      let userJs = ./user.js; in
      lib.optionalString (builtins.pathExists userJs) (builtins.readFile userJs);

    userChrome =
      let uc = ./chrome/userChrome.css; in
      lib.optionalString (builtins.pathExists uc) (builtins.readFile uc);

    userContent =
      let ucont = ./chrome/userContent.css; in
      lib.optionalString (builtins.pathExists ucont) (builtins.readFile ucont);
  };
}


