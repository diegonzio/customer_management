class Client < ApplicationRecord
  belongs_to :position
  belongs_to :software
  belongs_to :estate
end
