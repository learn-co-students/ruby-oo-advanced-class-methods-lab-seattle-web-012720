require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.create_by_name(name)
    song = Song.create
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.select {|song| return song if song.name == name}
      nil
  end

  def self.find_or_create_by_name(name)
    song = Song.find_by_name(name)
    if song
      return song
    else
      Song.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}.uniq
  end
  
  def self.new_from_filename(file)
    array = file.to_s.split('-')
    new_array = array.map{|string| string.delete_suffix('.mp3').strip}
    song = Song.find_or_create_by_name(new_array[1])
    # binding.pry
    song.artist_name = array[0].strip
    song.save
    song
  end

  def self.create_from_filename(file)
    Song.new_from_filename(file)
  end

  def self.destroy_all
    @@all = [ ]
  end

  def save
    self.class.all << self
  end

end
