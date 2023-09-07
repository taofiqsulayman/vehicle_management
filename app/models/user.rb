class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable

  enum role: { admin: 'admin', regular: 'regular' }

  has_many :vehicles

  validates :email, presence: true, uniqueness: true

  def admin?
    role == 'admin'
  end

  def regular?
    role == 'regular'
  end
end
