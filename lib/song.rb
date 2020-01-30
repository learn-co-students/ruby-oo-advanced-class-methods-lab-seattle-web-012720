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
    self.all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name 
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name 
    self.all << song
    song
  end

  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(string)
    song = self.new
    data = string.split('.mp3')
    artist, name = data[0].split(' - ')
    song.artist_name = artist
    song.name = name
    song
  end

  def self.create_from_filename(string)
    song = self.new_from_filename(string)
    self.all << song
  end

  def self.destroy_all 
    self.all.clear
  end

end
