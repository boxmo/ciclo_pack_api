class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :rate, :body, :created_at
  belongs_to :user, serializer: UserSerializer
  belongs_to :product, serializer: ProductSerializer
end
