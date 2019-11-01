require "pry"
class Owner
  @@all = [ ]
  attr_reader :species, :name

  def initialize (name)
    @name = name
    save
  end

  def species 
    @species = "human"
  end

  def say_species 
    "I am a human."
  end

  def save
    @@all<<self
  end

  def self.all 
    @@all
  end

  def self.count
    @@all.size
  end
  
  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select{|cat| cat.owner ==self}
  end

  def dogs
    Dog.all.select{|dog| dog.owner ==self}
  end

  def buy_cat(name)
    cat = Cat.new(name, self)
  end

  def buy_dog(name)
    dog = Dog.new(name, self)
  end

  def walk_dogs
     self.dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.each{|cat| cat.mood = "happy"}
  end
  
  def sell_pets

    self.cats.each{|cat| cat.mood = "nervous"}
    self.dogs.each{|dog| dog.mood = "nervous"}

    self.cats.each{|cat| cat.owner = nil}
    self.dogs.each{|dog| dog.owner = nil}
  end

  def list_pets
    "I have #{self.dogs.length} dog(s), and #{self.cats.length} cat(s)."
    
  end

end