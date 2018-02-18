class Product < ActiveRecord::Base
  belongs_to :menu
  belongs_to :category
end
