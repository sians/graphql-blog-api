module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false
    field :first_name, String, null: false
    field :username, String, null: false
    field :password, String, null: false
    field :post, Types::PostType, null: false
    # field :authentication_token, String, null: false
  end
end
