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
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
