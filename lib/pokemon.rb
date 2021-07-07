class Pokemon
    attr_accessor :id, :name, :type, :db
    @@all = []
    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
        @@all << self
    end
    def self.save(name, type, db)
        sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
        db.execute(sql, name, type)
    end
    def self.find(id, db)
        sql = "SELECT * FROM pokemon WHERE id = ?"
        found_pokemon = db.execute(sql, id).flatten
        # binding.pry
        new_pokemon = Pokemon.new(id: found_pokemon[0], name: found_pokemon[1], type: found_pokemon[2], db: db)
        new_pokemon
    end
end
