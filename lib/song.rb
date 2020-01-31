
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
    new = self.new
    @@all << new
    new
  end

  def self.new_by_name(name)
    new = self.new
    new.name = name
    #@@all << new
    new
  end

  def self.create_by_name(name)
    new = self.new
    new.name = name
    @@all << new
    new
  end

  def self.find_by_name(name)
    self.all.find{|p| p.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|obj| obj.name[0]}
  end

  def self.new_from_filename(name)
    name.slice!(".mp3")
    test = name.split(" - ")
    new = self.create_by_name(test[1])
    new.artist_name = test[0]
    @@all << new
    new
  end

  def self.create_from_filename(name)
    name.slice!(".mp3")
    test = name.split(" - ")
    new = self.create_by_name(test[1])
    new.artist_name = test[0]
    @@all << new
    new
  end

  def self.destroy_all
    @@all = []
  end

end
