require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name="",artist_name="")
    @name = name
    @artist_name = artist_name
    @@all << self
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    Song.new
  end

  def self.new_by_name(name)
    Song.new(name)
  end

  def self.create_by_name(name)
    Song.new(name)
  end

  def self.find_by_name(name)
    # binding.pry
    @@all.detect{|song|song.name == name}
  end

  def self.find_or_create_by_name(name)
    found = find_by_name(name)
    found ? found : self.create_by_name(name)
  end

  def self.alphabetical
    # binding.pry
    sorted_names=@@all.each.map{|song|song.name}.sort
    sorted_names.map{|song|self.find_by_name(song)}
  end

  def self.new_from_filename(file)
    file_name=file.split(/(?: - | ?+.mp3)/)
    Song.new(file_name[1],file_name[0])
  end

  def self.create_from_filename(file)
    self.new_from_filename(file)
  end

  def self.destroy_all
    @@all =[]
  end
  



end
