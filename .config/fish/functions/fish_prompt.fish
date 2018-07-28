function fish_prompt
  echo ''
  set_color blue
  tilded_current_directory 
  echo "⌓ "
end

function tilded_current_directory 
  echo $PWD|sed -e 's|/private||' -e "s|^$HOME|~|"
end
