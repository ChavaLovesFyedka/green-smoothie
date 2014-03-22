class CreateAilmentRecipes < ActiveRecord::Migration
  def change
    create_table :ailment_recipes do |t|
      t.integer :recipe_id
      t.integer :ailment_id

      t.timestamps
    end
  end
end
