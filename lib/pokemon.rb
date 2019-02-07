class Pokemon
  attr_accessor :id, :name, :type, :db

   def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

   def self.save(name, type, db_cxn)
    db_cxn.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
   end

   def self.find(id, db_cxn)
     i_choose_you = db_cxn.execute("SELECT * FROM pokemon WHERE id = (?)", id)
     monster = Pokemon.new(id: i_choose_you[0][0], name: i_choose_you[0][1], type: i_choose_you[0][2], db: db_cxn)
     return monster
   end


end
