Maid.rules do

  watch '~/Downloads' do
    rule 'Once they are finished downloading, move all files from Downloads to Desktop' do
      move downloading?('~/Downloads/*'), '~/Desktop'
    end

    rule 'Fallback for Chrome for the rule above' do
      move dir_safe('~/Downloads/*'), '~/Desktop'
    end
  end
  
end
