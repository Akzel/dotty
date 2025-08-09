function ws --wraps='wpctl status' --wraps='wpctl status -k' --description 'alias ws=wpctl status -k'
  wpctl status -k $argv
        
end
