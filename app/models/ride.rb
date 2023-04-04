class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user
#   validates 

  def take_ride
    if !(self.user.tickets >= self.attraction.tickets) && !(self.user.height >= self.attraction.min_height)
     "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif !(self.user.tickets >= self.attraction.tickets)
     "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif !(self.user.height >= self.attraction.min_height) 
     "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      self.user.tickets >= self.attraction.tickets
      new_count = self.user.tickets - self.attraction.tickets
      new_happiness = self.user.happiness + self.attraction.happiness_rating
      new_nausea = self.user.nausea + self.attraction.nausea_rating
      self.user.update(
        :tickets => new_count,
        :happiness => new_happiness,
        :nausea => new_nausea)
      "Thanks for riding the #{attraction.name}!"
    end
  end

end
