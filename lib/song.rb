require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
    self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name=(name)
    song
  end

  def self.create_by_name(name)
    @name = name
    song = self.new_by_name(name)
    song.save
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if !self.find_by_name(name)
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file)
    song_data = file.split(' - ')
    artist_name = song_data[0]
    name = song_data[1].delete_suffix('.mp3')
    new = self.new_by_name(name)
    new.artist_name= (artist_name)
    new
  end


  def self.create_from_filename(file)
    song_data = self.new_from_filename(file)
    song_data.save
  end
  
  def self.destroy_all
    self.all.clear
  end

end
