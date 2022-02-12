class Category < ApplicationRecord

  has_many :journals, :dependent => :destroy
  
end
