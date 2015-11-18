Maid.rules do

  watch '~/Downloads' do
    rule 'Move all files in `~/Downloads` to `~/Desktop` except `.download`s' do
      dir('~/Downloads/*').each do |path|
        unless File.extname( path ) == '.download' then
          move( dir(path), '~/Desktop' )
        end
      end
    end
  end

end
