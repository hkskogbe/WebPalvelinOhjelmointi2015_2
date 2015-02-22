module RatingAverage
  extend ActiveSupport::Concern

  def average_rating
	if (ratings.empty?)
	  return 0
	else

      ratings.map(&:score).sum.to_f/ratings.count
	end  
  end
end
