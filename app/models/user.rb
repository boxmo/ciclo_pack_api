# == Schema Information
#
# Table name: users
#
#  id       :integer          not null, primary key
#  name     :string
#  nickname :string
#  image    :string
#  email    :string
#  password :string
#

class User < ActiveRecord::Base
  # Include default devise modules.
  # devise :database_authenticatable, :registerable,
  #         :recoverable, :rememberable, :trackable, :validatable,
  #         :confirmable, :omniauthable
  # include DeviseTokenAuth::Concerns::User

  has_many :reviews

  validates :email, uniqueness: true, presence: true
  validates :password, length: 8..30, presence: true
  validates :name, presence: true

end
