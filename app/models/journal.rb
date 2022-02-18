class Journal < ApplicationRecord

  belongs_to :user, :optional => true
  belongs_to :category

  validates :title, presence: true
  validates :content, presence: true, length: {minimum: 10}
  
end
