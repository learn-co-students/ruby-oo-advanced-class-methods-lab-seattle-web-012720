require "pry"

class Song
  attr_accessor :name, :artist_name

  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.name = @name
    song.artist_name = @artist_name
    @@all << song
    song
  end

  def self.new_by_name(requested_name)
    song = self.new
    song.name = requested_name
    song.artist_name = @artist_name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.artist_name = @artist_name
    @@all << song
    song
  end

  def self.find_by_name(name)
    all.find { |song_info| song_info.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    all.sort_by{ |song| song.name }
  end

  def self.new_from_filename(filename) #"Taylor Swift - Blank Space.mp3"
    temp_array = filename.split(/[-.]/)
    artist_name = temp_array[0].strip
    name = temp_array[1].strip
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    temp_array = filename.split(/[-.]/)
    artist_name = temp_array[0].strip
    name = temp_array[1].strip
    song = self.new
    song.name = name
    song.artist_name = artist_name
    @@all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
