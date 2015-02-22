class Style < ActiveRecord::Base
  has_many :beers
  has_many :ratings, through: :beers
  include RatingAverage

  def self.top(n)
    self.all.sort_by{ |b|- b.average_rating }.first(n)
  end

  def to_s
    name
  end
end
