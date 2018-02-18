class Title < ApplicationRecord
  belongs_to :color
  belongs_to :client
  belongs_to :user
  belongs_to :stage
end
