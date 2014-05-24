class User < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_movies, through: :favorites, source: :movie

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, format: /\A\S+@\S+\z/
  validates :email, uniqueness: {case_sensitive: false}
  validates :password, length: {minimum: 8, allow_blank: true}
  validates :username, uniqueness: {case_sensitive: false}, format: /\A[A-Z0-9]+\z/i

  scope :by_name, -> { order(:name) }
  scope :non_admin, -> { by_name.where(admin: false) }

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    user && user.authenticate(password)
  end
end
