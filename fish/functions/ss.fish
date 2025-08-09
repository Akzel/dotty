function ss
    wd (ws | rg '\[vol:' | fzf | string replace -r '^[^0-9]*' '' | string split '.' | head -n1 | string trim)
end
