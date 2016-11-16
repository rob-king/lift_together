class Campaign < ApplicationRecord
    validates :end_date, :goal_amount, presence:true
    validates :description, length: {minimum: 30}, presence: true
    validates :name, :organization, length: {minimum: 3}, presence: true
    belongs_to :user
    has_many :pledges, dependent: :destroy
    after_find :check_expired

    


    def expired?
      self.end_date < Time.now
    end

    private

    def check_expired
      if self.end_date < Time.now
        self.expired = true
      end
    end
end
