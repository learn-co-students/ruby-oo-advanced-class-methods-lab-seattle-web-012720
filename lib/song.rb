require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    @@all << self.new
    @@all[-1]
  end

  def self.new_by_name(name)
   
    song = self.new
    song.name = name
   
    song
  end

  def self.create_by_name(name)
   
    song = self.new
    song.name = name
    @@all << song
    song
  end

def self.find_by_name(name)  
    self.all.find{|song| song.name == name}
end

def self.find_or_create_by_name(name)
  
  if self.find_by_name(name) == nil
    
    self.create_by_name(name)
  else

    self.find_by_name(name)
    
  end
end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.alphabetical
    
    @@all.sort_by {|song| song.name }
  end

 def self.new_from_filename(filename)
  song = self.new

  data_array = filename.split(" - ")
  
  song.artist_name = data_array[0]
  #binding.pry
  mp_three = data_array[1]
  data_array = mp_three.split(".")
  song.name = data_array[0]
  
  song
 end

 def self.create_from_filename(filename)
  song = self.new

  data_array = filename.split(" - ")
  
  song.artist_name = data_array[0]
  #binding.pry
  mp_three = data_array[1]
  data_array = mp_three.split(".")
  song.name = data_array[0]
  @@all << song
  song
 end

def self.destroy_all
  @@all = []
end

end
