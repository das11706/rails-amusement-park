class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides
#   validates :password, presence: true
#   validates :tickets, comparison: { greater_than_or_equal_to: '4'}

  def mood
    if !admin
      if happiness > nausea 
        "happy"
      else
        "sad"
      end
    end
  end

end
