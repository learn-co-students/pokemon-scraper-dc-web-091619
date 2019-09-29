require "pry"

class Pokemon
    attr_accessor :id, :name, :type, :db

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type 
        @db = db 
    end

    def self.save(pokemon_name, pokemon_type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", pokemon_name, pokemon_type);
    end

    def self.find(pokemon_id, db)
        pokemon_found = db.execute("SELECT * FROM pokemon WHERE id = ?", pokemon_id);
        pokemon = pokemon_found.flatten
     
        Pokemon.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], db: db);
    end
end
