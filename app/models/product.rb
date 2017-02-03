# == Schema Information
#
# Table name: products
#
#  id             :integer          not null, primary key
#  name           :string
#  org_id         :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  sku            :string
#  recycle_rate   :integer
#  logistics_rate :integer
#  image          :string
#

class Product < ApplicationRecord
  belongs_to :org
  has_many :reviews

  validates :name, presence: true
  validates :sku, presence: true
  validates :recycle_rate, presence: true
  validates :logistics_rate, presence: true

  def avg_rate
    sum = avg_user_rate_sum + recycle_rate + logistics_rate
    return 0 if sum.zero?
    return (sum.to_f / 3).round(2)
  end

  def avg_user_rate_sum
    sum = reviews.map(&:rate).sum
    return 0 if sum.zero?
    return (sum.to_f / reviews.count).round(2)
  end
end
