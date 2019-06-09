require 'pry'

class Genre

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all 
    end

    def songs
        Song.all.select {|song| song.genre == self} #look at all Song insts, return ones where @genre == genre_inst
    end

    def genre_songs(genre) #Array of all song_objs with 
        #@genre(str) == genre arg(str)
          Song.all.select do |song|
            song.genre == self.name
          end
        end
      
    def artists_w_genre(genre) #all artists who have songs tagged as genre(str)
        genre_songs(genre).map do |song_w_genre| #all songs w @genre(str) == genre arg(str)
        song_w_genre.artist.name #Just return artist names for all songs tagged as genre_arg by artist
        end.uniq
    end

    def artists #pop.artists should have a1 and a2 objs
        #self = Genre.new 
        songs_w_genre = Song.all.select do |song_obj|
            song_obj.genre == self #return only song objs with genre = Genre.new inst
        end

        songs_w_genre.map do |genretype_song|
            genretype_song.artist
        end
    end

    # def artists #Return all artists that have songs tagged as genre
    #     sa1 = Song.all.select{ |song| song.genre == self.name}
    #     # sa1.select{|s| s.artist} #song_obj @genre = genre_inst.name?
            
    
    #     binding.pry
        
    #     # songs[0].artist
    #     # songs.map(&:artist)

    # end

end