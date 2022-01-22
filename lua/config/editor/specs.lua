require('specs').setup{ 
    show_jumps  = true,
    min_jump = 30,
    popup = {
        delay_ms = 0,
        inc_ms = 8,
        blend = 90,
        width = 8,
        winhl = "PMenu",
        fader = require('specs').pulse_fader,
        resizer = require('specs').slide_resizer,
    },
    ignore_filetypes = {},
    ignore_buftypes = {
        nofile = true,
    },
}

require('specs').show_specs()
