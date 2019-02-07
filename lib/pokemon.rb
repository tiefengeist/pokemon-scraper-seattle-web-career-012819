class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

   def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

   def self.save(name, type, db_cxn)
    db_cxn.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
   end

   def self.find(id, db_cxn)
     i_choose_you = db_cxn.execute("SELECT * FROM pokemon WHERE id = (?)", id)
     monster = Pokemon.new(id: i_choose_you[0][0], name: i_choose_you[0][1], type: i_choose_you[0][2], hp: i_choose_you[0][3], db: db_cxn)
     return monster
   end

   def alter_hp(new_hp, db_cxn)
     damage = db_cxn.execute("UPDATE pokemon SET hp = #{new_hp} WHERE id = (?)", id)
   end


end
