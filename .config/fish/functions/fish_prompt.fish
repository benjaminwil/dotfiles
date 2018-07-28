function fish_prompt
  echo
  set_color blue; current_dir
  set_color white; git_prompt
  set_color blue; prompt_character
end


function current_dir
  printf (echo "$PWD " | sed -e "s|$HOME|~|")
end

function prompt_character
  printf "\n⌓ "
end
