class Owner


attr_reader :name, :species 

@@all = []
@@count = 0


      def initialize(name)  
          @name = name
          @species = "human"
          @@all << self
          @@count += 1
      end

      def say_species
          "I am a #{@species}."
      end 

      def self.all 
          @@all 
      end 

    def self.count
          @@count 
    end 

    def self.reset_all
         @@count = 0
    end

    def cats 
        Cat.all.select{ |cat| cat.owner == self}
    end 

    def dogs
      Dog.all.select{ |dog| dog.owner == self}
    end 


    def buy_cat(cat_name)
      cat = Cat.new(cat_name, self)
    end 

    def buy_dog(dog_name)
      dog = Dog.new(dog_name, self)
    end 

    def walk_dogs
      dogs.map{|dog| dog.mood = 'happy'}
    end

    def feed_cats
      cats.map{|cat| cat.mood = 'happy'}
    end 

    def sell_pets
      (cats + dogs).each do |pet|
        pet.owner = nil
        pet.mood = 'nervous'
      end
    

    def list_pets
      "I have #{dogs.count} dog(s), and #{cats.count} cat(s)." 
    end

    end 
end
