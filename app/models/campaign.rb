class Campaign < ApplicationRecord
    validates :name, :organization, :description, :end_date, :goal_amount, presence:true
    belongs_to :user
end
