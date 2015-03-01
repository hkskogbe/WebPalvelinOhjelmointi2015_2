class Beer < ActiveRecord::Base
  include RatingAverage

  belongs_to :style
  belongs_to :brewery, touch: true
  has_many :ratings, dependent: :destroy
  has_many :raters, -> { uniq }, through: :ratings, source: :user

  validates :name, presence: true
  validates :style, presence: true


  def self.top(n)
    self.all.sort_by{ |b|- b.average_rating }.first(n)
  end

  def to_s
    "#{name} #{brewery.name}"
  end
end
