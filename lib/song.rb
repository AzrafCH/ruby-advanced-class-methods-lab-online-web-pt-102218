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
   song.save
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
   song.save 
   song 
 end 
 
  def self.find_by_name(name)
   song = self.new 
   @@all.find do |song| 
      song.name == name
    end 
  end 
  
  def self.find_or_create_by_name(name) 
    self.find_by_name(name) || self.create_by_name(name)
  end 
  
  def self.alphabetical 
    @@all.sort_by do |word|
      word.name
    end 
  end 
  
  def self.new_from_filename(mp3_formatted_file)
    song = self.new 
    song.name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[1] 
    song.artist_name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[0]
    song
  end

  end 
  
  def self.create_from_filename
     c = self.new 
    c.name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[1] 
    c.artist_name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[0]
    c.save
    c
  end 
  
  def self.destroy_all
    @@all.clear
  end 
end 
   
 

