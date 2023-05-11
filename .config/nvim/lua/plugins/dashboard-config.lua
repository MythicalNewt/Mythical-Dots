local db = require('dashboard')
  -- linux
 -- db.preview_command = 'ueberzug'
 -- db.preview_file_path = home .. '/.config/nvim/kgradient.png'
 -- db.preview_file_height = 11
 -- db.preview_file_width = 70
db.custom_header = {
[[       _                                       _             ]],
[[    __| | ___  ___ __ _ _   _       _ ____   _(_)_ __ ___    ]],
[[   / _` |/ _ \/ __/ _` | | | |_____| '_ \ \ / / | '_ ` _ \   ]],
[[  | (_| |  __/ (_| (_| | |_| |_____| | | \ V /| | | | | | |  ]],
[[   \__,_|\___|\___\__,_|\__, |     |_| |_|\_/ |_|_| |_| |_|  ]],
[[                        |___/                                ]],
}
db.custom_center = {
    --{icon = '  ',
    --desc = 'Recently latest session                  ',
    --shortcut = 'SPC s l',
    --action ='SessionLoad'},
    --{icon = '  ',
    --desc = 'Recently opened files                   ',
    --action =  'DashboardFindHistory',
    --shortcut = 'SPC f h'},
    {icon = '  ',
    desc = 'Find  File                              ',
    action = 'Telescope find_files find_command=rg,--hidden,--files',
    shortcut = 'SPC f f'},
    --{icon = '  ',
    --desc ='File Browser                            ',
    --action =  'Telescope file_browser',
    --shortcut = 'SPC f b'},
    {icon = '  ',
    desc = 'Find  word                              ',
    action = 'Telescope live_grep',
    shortcut = 'SPC f w'},
    --{icon = '  ',
    --desc = 'Open Personal dotfiles                  ',
    --action = 'Telescope dotfiles path=' .. home ..'/.dotfiles',
    --shortcut = 'SPC f d'},
}
