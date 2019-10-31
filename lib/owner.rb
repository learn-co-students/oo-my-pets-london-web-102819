require "pry"

class Owner
  attr_reader :name, :species

  @@all = []
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
   return "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end
 
  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|d| d.owner == self}
  end

  def buy_cat(cat_name)
    Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def walk_dogs
    dogs.map {|d| d.mood = "happy"}
  end

  def feed_cats
    cats.map {|c| c.mood = "happy"}
  end

  def pets
    #binding.pry
    dogs + cats
  end

  def sell_pets
    pets.each do |p| 
      p.mood = "nervous" 
      p.owner = nil
    end
  end

  def list_pets
    total_dogs = dogs.length
    total_cats = cats.length
    #binding.pry
    return "I have #{total_dogs} dog(s), and #{total_cats} cat(s)."
  end

end

