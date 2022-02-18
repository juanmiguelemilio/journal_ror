class TodoList < ApplicationRecord
  
  belongs_to :user, :optional => true
  has_many :todo_items
  

  validates :title, presence: true
  validates :description, presence: true, length: {minimum: 5}

end
