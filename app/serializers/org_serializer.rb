class OrgSerializer < ActiveModel::Serializer
  attributes :id, :name, :bio
  has_many :products, serializer: ProductSerializer
end
