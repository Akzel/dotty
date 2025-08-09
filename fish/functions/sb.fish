function sb --wraps='sudo systemctl restart bluetooth' --description 'alias sb=sudo systemctl restart bluetooth'
  sudo systemctl restart bluetooth $argv
        
end
