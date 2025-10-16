local function add_hash_to_word()
  local word = vim.fn.expand("<cword>")
  if word == "" then
    vim.notify("No word under cursor", vim.log.levels.WARN)
    return
  end
  local random_bytes = vim.loop.random(4)
  local hex_string = ""

  for i = 1, #random_bytes do
    hex_string = hex_string .. string.format("%02x", string.byte(random_bytes, i))
  end

  local new_word = word .. "#" .. hex_string
  vim.cmd("normal! ciw" .. new_word)
end

local map = function(keys, func, desc, mode)
  mode = mode or "n"
  vim.keymap.set(mode, keys, func, { desc = "My remaps: " .. desc })
end

map("<leader>#", add_hash_to_word, "Add hash to current word")
map("<C-d>", "<C-d>zz", "Go way up")
map("<C-u>", "<C-u>zz", "Go way down")
map("n", "nzzzv", "Next search pattern")
map("N", "Nzzzv", "Prev search pattern")
map("<A-c>", "<cmd>:bd<CR>", "Close cur buffer")
map("/", '"fy/\\V<C-R>f<CR>', "Find selected words", "v")
map("J", ":m '>+1<CR>gv=gv", "Move line down", "v")
map("K", ":m '<-2<CR>gv=gv", "Move line up", "v")
-- terminal
map("<leader>t", "<cmd>:term<CR>", "Open terminal")
map("<Esc>t", "<C-\\><C-n>", "Exit terminal mode", "t")
-- quick fix list
map("<M-j>", "<cmd>cnext<CR>", "Next from quick fix list")
map("<M-k>", "<cmd>cprev<CR>", "Prev from quick fix list")
-- source or launch lua
map("<leader>so", "<cmd>source %<CR>", "Sourse file")
map("<leader>x", ":.lua<CR>", "Execute cur lua line")
map("<leader>x", ":lua<CR>", "Execute cur visual selection", "v")
-- yank to clipboard
map("<leader>y", [["+y]], "Yank object to clipboard", { "n", "v" })
map("<leader>Y", [["+Y]], "Yank line to clipboard")
map("<Esc>", "<cmd>nohlsearch<CR>", "Clear highlight search in normalmode")
