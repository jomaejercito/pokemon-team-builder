class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :pokemon_1
      t.string :pokemon_2
      t.string :pokemon_3
      t.string :pokemon_4
      t.string :pokemon_5
      t.string :pokemon_6
      t.integer :user_id
    end
  end
end
