class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  validates :password, presence: true
#   validates :tickets, comparison: { greater_than_or_equal_to: '4'}

  def mood
    if self.nausea > self.happiness
      "sad"
    else
      "happy"
    end
  end

end
