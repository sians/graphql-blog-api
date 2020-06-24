module Types
  class PostType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: true
    field :published, GraphQL::Types::ISO8601DateTime, null: true
    field :status, Integer, null: true
    field :user, Types::UserType, null: false
    field :content, String, null: true
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
