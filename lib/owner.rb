require 'pry'

class Owner

  attr_reader :species, :name
  attr_accessor :cats, :dogs

  @@all = []

  def initialize(name)
    @name = name 
    @species = 'human'
    @cats = []
    @dogs = []
    @@all << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.length
  end

  def self.reset_all
    @@all = []
  end

  def buy_cat(cat_name)
    new_cat = Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    new_dog = Dog.new(dog_name, self)
  end

  def walk_dogs
    self.dogs.map { |dog| dog.mood = 'happy'}
  end

  def pets_data_changer(pets, data_type, new_value)
    self.pets.map { |pet| pet.data_type = new_value}
  end

  def feed_cats
    #self.pets_data_changer(cats, mood, 'happy')
    self.cats.map { |cat| cat.mood = 'happy'}
  end

  def sell_pets
   self.cats.map { |cat| cat.owner = nil }
    self.dogs.map { |dog| dog.owner = nil }
    self.cats.map { |cat| cat.mood = 'nervous' }
    self.dogs.map { |dog| dog.mood = 'nervous' }
    self.cats = []
    self.dogs = []
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
  
end

#binding.pry

p 7