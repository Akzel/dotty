function kitty_scrollback_edit_command_buffer
  set --local --export VISUAL '/home/axel/.local/share/nvim/lazy/kitty-scrollback.nvim/scripts/edit_command_line.sh'
  edit_command_buffer
  commandline ''
end
bind --mode default \ee kitty_scrollback_edit_command_buffer
bind --mode default \ev kitty_scrollback_edit_command_buffer
bind --mode visual \ee kitty_scrollback_edit_command_buffer
bind --mode visual \ev kitty_scrollback_edit_command_buffer
bind --mode insert \ee kitty_scrollback_edit_command_buffer
bind --mode insert \ev kitty_scrollback_edit_command_buffer
