function wd --wraps='wpctl set-default' --description 'alias wd=wpctl set-default'
  wpctl set-default $argv
        
end
