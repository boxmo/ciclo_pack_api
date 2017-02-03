class ProductSerializer < ActiveModel::Serializer
  attributes :id, :sku,
             :name, :recycle_rate,
             :logistics_rate, :avg_rate

  belongs_to :org, serializer: OrgSerializer
  has_many :reviews, serializer: ReviewSerializer

  def avg_rate
    object.avg_rate
  end
end
