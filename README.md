This is a NeoVim theme created using lush, forked from [arctic.nvim](https://github.com/rockyzhang24/arctic.nvim) version 1. This theme aims to mostly mimic Visual Studio Code.

# Showcase

![Transparent Float](https://github.com/user-attachments/assets/1658a8bc-f660-404b-aa8e-1f8af8e438d2)

# Usage
## Transparency
Transparency support is not yet stable. But, the current usage is as follows:

```lua
  transparent = {
    normal = "none" | "tree" | "code" | "all", -- Transparency on focused
    blurred = "none" | "tree" | "code" | "all", -- Transparency on unfocused
    float = true|false, -- Transparency on floating windows
    color = "NONE", -- Background color if the terminal (i.e. kitty) makes it become transparent with a background image. Very recommended.
  },
```

Enjoy!
