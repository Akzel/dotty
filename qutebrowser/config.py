import os

config.load_autoconfig()

mpv_script = os.path.expanduser("~/.config/qutebrowser/mpv-handler.sh")

config.bind("<y><o>", "yank inline [[{url}][{title}]]")
# config.bind('V', 'hint links spawn mpv {hint-url}')
config.bind('<Ctrl-j>', 'completion-item-focus --history next', mode="command")
config.bind('<Ctrl-k>', 'completion-item-focus --history prev', mode="command")
config.bind('V', f'hint links spawn --output-messages bash {mpv_script} {{hint-url}}')
c.editor.command = [
    "kitty",
    "-e",
    "nvim",
    "-f",
    "{file}",
    "-c",
    "normal {line}G{column0}1",
]

