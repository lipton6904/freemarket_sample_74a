class Categorie < ApplicationRecord
  has_many :items
  has_ancestry
  belongs_to :parent, class_name: :categorie
  has_many :children, class_name: :categorie, foreign_key: :parent_id
end
