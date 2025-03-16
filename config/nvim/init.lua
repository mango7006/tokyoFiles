-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.filetype.add({
    extension = { rasi = "rasi" },
    pattern = {
        [".*/waybar/config"] = "jsonc",
        [".*/dunst/dunstrc"] = "hyprlang",
        [".*/kitty/*.conf"] = "bash",
        [".*/hypr/.*%.conf"] = "hyprlang",
        [".*/wofi/config"] = "hyprlang",
    },
})
