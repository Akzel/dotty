function ssb --wraps='sudo systemctl start bluetooth' --description 'alias ssb=sudo systemctl start bluetooth'
  sudo systemctl start bluetooth $argv
        
end
