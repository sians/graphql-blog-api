module Types
  class CommentType < Types::BaseObject
    field :id, ID, null: false
    field :user, Types::UserType, null: false
    field :post, Types::PostType, null: false
    field :text, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
