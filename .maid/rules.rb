Maid.rules do

  watch '/Users/benjamin/Downloads' do
    rule 'Move all files in Downloads to Desktop' do
      move(dir('~/Downloads/*'), '~/Desktop')
    end
  end

end
