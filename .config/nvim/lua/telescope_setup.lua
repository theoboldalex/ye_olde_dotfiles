require('telescope')
    .setup {
        defaults = {
            file_ignore_patterns = {
                "node%_modules/.*",
                "vendor/",
                ".git/",
                ".idea/",
            }
        },
        pickers = {
            find_files = {
                theme = "dropdown",
                previewer = false,
                hidden = true,
                no_ignore = true,
            },
            buffers = {
                theme = "dropdown",
                previewer = false,
            },
            live_grep = {
                theme = "dropdown",
                hidden = true,
                no_ignore = true
            },
            help_tags = {
                theme = "dropdown"
            }
        }
    }
