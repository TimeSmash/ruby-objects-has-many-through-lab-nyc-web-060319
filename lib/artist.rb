require 'pry'

class Artist

    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def genres
        
    end

    def songs
        #songs that have artist 
        Song.all.select do |song| #Look thru all song_objs, and...
            song.artist == self #Return new_arr of song_objs whose @artist(obj) == artist_instance 
        end
    end

    def new_song(name, genre)
        Song.new(name, self, genre)
    end

    def genres #through songs
        #Kira-miki.genres should include pop
        self.songs.map do |artist_songs| #go thru all artist song_objs
            artist_songs.genre    
            # binding.pry 
        end
    end
end

binding.pry