map("<Ctrl-u>", "u");
map("<Ctrl-d>", "d");
unmap("u");
unmap("d");

map("H", "S");
map("L", "D");
map("J", "R");
map("K", "E");
unmap("S");
unmap("D");
unmap("R");
unmap("E");

cmap("<Ctrl-j>", "<Tab>");
cmap("<Ctrl-k>", "<Shift-Tab>");
cmap("<Ctrl-l>", "<Ctrl-.>");
cmap("<Ctrl-h>", "<Ctrl-,>");

settings.tabsThreshold = 0;
settings.showModeStatus = true;
settings.focusFirstCandidate = true;

aceVimMap("fd", "<Esc>", "insert");

settings.theme = `
.sk_theme#sk_omnibar {
    background: #3b4252;
    color: #eceff4;
    box-shadow: 0px 2px 10px #3b4252;
}
.sk_theme #sk_omnibar #sk_omnibarSearchArea {
    border-bottom: 1px solid #434c5e;
}
.sk_theme #sk_omnibarSearchArea > input {
    color: #eceff4;
}
.sk_theme #sk_omnibarSearchArea .prompt {
    color: #e5e9f0;
}
.sk_theme .resultPage {
    color: #81a1c1;
}
.sk_theme #sk_omnibarSearchResult > ul > li:nth-child(2n+1) {
    background: #434c5e;
}
.sk_theme #sk_omnibarSearchResult > ul > li.focused {
    background: #4c566a;
}
.sk_theme .annotation {
    color: #81a1c1;
}
.sk_theme .url {
    color: #81a1c1;
}
`;
