inputs:
final: prev: {
  whitesur-icon-theme = prev.whitesur-icon-theme.override {
    alternativeIcons = true;
    boldPanelIcons = true;
  };
}