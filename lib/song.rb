require 'pry'

class Song
  attr_accessor :name, :artist_name, :song
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
   song = self.new
   @@all << song
   song
 end

  def self.new_by_name(name)
    #using the create method above
    #create - creates a new instance
    new_song = create
    new_song.name = name
    new_song
    # song = self.new
    # song.name = name
  end

  def self.create_by_name(name)
    new_song = new_by_name(name)
    new_song.save
    # @@all << new_song - same thing.
    new_song
  end

  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name)
      find_by_name(name)
    else
      create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.uniq.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(file_name)
    data = file_name.split(" - ")
    artist_name = data[0]
    song_name = data[1].chomp(".mp3")
    song = Song.new
    song.name = song_name
    song.artist_name = artist_name
    song.save
    song


    #       name = data[0]
    #       song = data[1].chomp(".mp3")
    # this_song = find_or_create_by_name(song)
    #
    # this_song.artist_name = name
  end

  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    self.all << song
  end


  def self.destroy_all
    self.all.clear
  end
