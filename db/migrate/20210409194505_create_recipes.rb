class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.numeric :calories
      t.string :cautions, array:true
      t.string :cuisineType, array:true
      t.string :dietLabels, array:true
      t.json :digest, array:true
      t.string :dishType, array:true
      t.string :healthLabels, array:true
      t.string :image
      t.string :ingredientLines, array:true
      t.json :ingredients, array:true
      t.string :label
      t.string :meanType, array:true
      t.string :shareAs
      t.string :source
      t.json :totalDaily
      t.json :totalNutrients
      t.integer :totalTime
      t.numeric :totalWeight
      t.string :uri
      t.string :url
      t.integer :yield

      t.timestamps
    end
  end
end
