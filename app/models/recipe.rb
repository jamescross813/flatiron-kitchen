class Recipe < ApplicationRecord
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    validates :name, presence: true

    def ingredients_attributes=(ingredient_attributes)
        ingredient_attributes.values/each do |ing_att|
            ingredient = Ingredient.find_or_create_by(ing_att)
            self.ingredients << ingredient
        end
    end
end
