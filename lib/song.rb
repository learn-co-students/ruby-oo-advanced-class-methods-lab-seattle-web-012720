require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create()
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    #@@all << song
    song
  end

  def self.create_by_name(name)
    person = self.new_by_name(name)
    @@all << person
    person
  end

  def self.find_by_name(name)
    @@all.find{|person| person.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|obj| obj.name}
  end

  def self.new_from_filename(file)
    file.slice!".mp3"
    art_name = file.split(" - ")
    song = self.new_by_name(art_name[1])
    song.artist_name = art_name[0]
    @@all << song
    song
    #binding.pry
  end
  
  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    @@all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end

end

#binding.pry