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
