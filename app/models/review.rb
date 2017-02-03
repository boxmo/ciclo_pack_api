# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  product_id :integer
#  rate       :integer
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :user, presence: true
  validates :product, presence: true
  validates :rate, presence: true
  validates :body, presence: true

  validates :rate, numericality: { less_than_or_equal_to: 10 }
end
