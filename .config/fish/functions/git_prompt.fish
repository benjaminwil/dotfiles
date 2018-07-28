function git_prompt

  set -l git (git rev-parse --git-dir ^/dev/null)

  if ls $git > /dev/null 2>&1

    set -l rebase_status ""
    set -l branch_info ""
    set -l status_color "normal"
    
    if ls $git/rebase > /dev/null 2>&1
      
      set branch_info (git symbolic-ref --short HEAD ^/dev/null)
  
      if ls $git/rebase/rebasing > /dev/null 2>&1 
        set rebase_status "rebasing"
      else if ls $git/rebase/applying > /dev/null 2>&1
        set rebase_status "applying"
      else
        set rebase_status "rebasing"
      end

    else if ls $git/rebase-merge/interactive > /dev/null 2>&1 

      set branch_info (cat "$git/rebase-merge/stopped-sha")
      set rebase_status "rebasing"

    else if ls $git/rebase-merge > /dev/null 2>&1

      set branch_info (cat "$git/rebase-merge/head-name")
      set rebase_status "rebase-merging"
      set status_color "red"

    else if ls $git/MERGE_HEAD > /dev/null 2>&1

      set branch_info (git symbolic-ref --short HEAD ^/dev/null)
      set rebase_status "merging"
      set status_color "red"

    else

      if ls $git/BISECT_LOG > /dev/null 2>&1
        set rebase_status "bissecting"
        set status_color "red"
      end

      set -q branch_info (git describe --exact-match HEAD ^/dev/null)
      set branch_info (git symbolic-ref --short HEAD ^/dev/null)

    end

    if not test $argv
        set_color $status_color
        set argv "%s"
    end
    
    if test $rebase_status
      set separator " "
    else
      set separator ""
    end

    printf $argv "$rebase_status$separator$branch_info" ^/dev/null
  end
end
