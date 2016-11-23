class Campaign < ApplicationRecord
    validates :end_date, :goal_amount, presence:true
    validates :description, length: {minimum: 30}, presence: true
    validates :name, :organization, length: {minimum: 3}, presence: true
    validate :check_future_end_date
    belongs_to :user
    has_many :pledges, dependent: :destroy
    #excellent use of after find! your implementation of this feature is very rails-natural
    after_find :check_expired

    scope :expired, -> { where(expired:true)}
    scope :not_expired, -> { where(expired:false)}

    def expired?
      self.end_date < Time.now
    end

    def future_end_date?
      self.end_date.future?
    end

    private

    def check_expired
      if self.end_date < Time.now
        self.expired = true
      end
    end

    def check_future_end_date
      if not self.future_end_date?
        errors.add(:end_date, "needs to be set in the future")
      end
    end
end
