module Mutations
  module Users
    # class Login < Mutations::BaseMutation
    #   argument :email, String, required: true
    #   argument :password, String, required: true

    #   field :token, String, null: true
    #   field :user, Types::UserType, null: true

    #   def resolve(email:, password:)
    #             binding.pry

    #     user = User.find_for_database_athentication(email: email)
    #     if user.present?
    #       if user.valid_password?(password)
    #         context[:current_user] = user
    #       else
    #         GraphQL::ExecutionError.new("Incorrect Email or Password")
    #       end
    #       GraphQL::ExecutionError.new("User is not registered")
    #     end
    #   end
    # end


    # class Login < GraphqlDevise::Mutations::Login
    #   field :user, Types::UserType, null: true

    #   def resolve(email:, password:)
    #     original_payload = super do |user|
    #       binding.pry
    #       user.reload
    #     end

    #     original_payload.merge(user: original_payload[:authenticatable])
    #   end
    # end
  end
end
