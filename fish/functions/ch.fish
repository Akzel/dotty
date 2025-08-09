function ch --wraps='cargo clean && cargo check' --description 'alias ch=cargo clean && cargo check'
  cargo clean && cargo check $argv
        
end
