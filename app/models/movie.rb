class Movie < ActiveRecord::Base


  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :fans, through: :favorites, source: :user
  has_many :characterizations, dependent: :destroy
  has_many :genres, through: :characterizations

  has_attached_file :image, styles: {
      small: "90x133>"
  }

  validates :title, presence: true, uniqueness: true

  validates :slug, presence: true, uniqueness: true

  validates :title, :released_on, :duration, presence: true
  
  validates :description, length: { minimum: 25 }
  
  validates :total_gross, numericality: { greater_than_or_equal_to: 0 }

  validates_attachment :image,
                       :content_type => { :content_type => ['image/jpeg', 'image/png', 'image/gif'] },
                       :size => { :less_than => 1.megabyte }


  RATINGS = %w(G PG PG-13 R NC-17)

  validates :rating, inclusion: { in: RATINGS }

  scope :released, -> { where("released_on <= ?", Time.now).order(released_on: :desc) }
  scope :hits, -> { released.where('total_gross >= 300000000').order(total_gross: :desc) }
  scope :flops, -> { released.where('total_gross < 10000000').order(total_gross: :asc) }
  scope :upcoming, -> { where('released_on > ?', Time.now).order(released_on: :asc) }
  scope :rated, -> (rating){ released.where(rating: rating) }
  scope :recent, -> (max=5){ released.limit(max) }

  before_validation :generate_slug

  def to_param
    slug
  end

  def generate_slug
    self.slug ||= title.parameterize if title
  end

  def self.recently_added
    order('created_at desc').limit(3)
  end
  
  def flop?
    total_gross.blank? || total_gross < 50000000
  end

  def average_stars
    reviews.average(:stars)
  end
end
