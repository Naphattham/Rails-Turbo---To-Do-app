class Category < ApplicationRecord
    # has_many :todos, dependent: :destroy
    validates :name, presence: true
  end
  
  # app/models/todo.rb
  class Todo < ApplicationRecord
    belongs_to :category
    validates :title, presence: true
  end