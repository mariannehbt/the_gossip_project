class PrivateMessage < ApplicationRecord
  belongs_to :sender, class_name: "User"
  has_many :table_intermédiaire
  has_many :recipient, class_name: "User", through: :table_intermédiaire
end

