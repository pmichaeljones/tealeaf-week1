# find music files in music folder
# create array of files
# shuffle array
# output into .m3u file

def shuffle(array)
shuffled_music = []
  while array.length != 0
    array_index_length = array.length
    rando_song = array.fetch(rand(array_index_length))
    shuffled_music << rando_song
    array.delete(rando_song)
  end
  shuffled_music
end


Dir.chdir("/Users/patrickjones/Music") #changes directory to the music folder

music_file_array = shuffle(Dir['**/*.{mp3,MP3}']) #searches for all MP3s


Dir.chdir("/Users/patrickjones/Projects/Tealeaf/Week1")

filename = "Patrick's Jams.m3u"

File.open filename, 'w' do |f|
  music_file_array.each do |x|
    f.write(x + "\n")
  end
end


