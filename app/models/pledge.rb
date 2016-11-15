class Pledge < ApplicationRecord
  validates :amount, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 5 }
  belongs_to :campaign
  belongs_to :user
end
