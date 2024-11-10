{ config, pkgs, ... }:

  let
    lock-false = {
      Value = false;
      Status = "locked";
    };
    lock-true = {
      Value = true;
      Status = "locked";
    };
  in
{
    programs = {
        firefox = {
            enable = true;
            languagePacks = [ "en-US" ];
            policies = {
                DisableTelemetry = true;
                DisableFirefoxStudies = true;
                EnableTrackingProtection = {
                    Value= true;
                    Locked = true;
                    Cryptomining = true;
                    Fingerprinting = true;
                };
                DisablePocket = true;
                DisableFirefoxAccounts = true;
                DisableAccounts = true;
                DisableFirefoxScreenshots = true;
                OverrideFirstRunPage = "";
                OverridePostUpdatePage = "";
                DontCheckDefaultBrowser = true;
                DisplayBookmarksToolbar = "newtab";
                DisplayMenuBar = "default-off"; 
                SearchBar = "unified"; 
                ExtensionSettings = {
                    "uBlock0@raymondhill.net" = {
                        install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
                        installation_mode = "force_installed";
                    };
                };
            }; 
            preferences = { 
                "browser.contentblocking.category" = true;
                "extensions.pocket.enabled" = false;
                "extensions.screenshots.disabled" = true;
                "browser.topsites.contile.enabled" = false;
                "browser.formfill.enable" = false;
                "browser.search.suggest.enabled" = false;
                "browser.search.suggest.enabled.private" = false;
                "browser.urlbar.suggest.searches" = false;
                "browser.urlbar.showSearchSuggestionsFirst" = false;
                "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
                "browser.newtabpage.activity-stream.feeds.snippets" = false;
                "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
                "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = false;
                "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = false;
                "browser.newtabpage.activity-stream.section.highlights.includeVisited" = false;
                "browser.newtabpage.activity-stream.showSponsored" = false;
                "browser.newtabpage.activity-stream.system.showSponsored" = false;
                "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
            };
        };
    };
}
