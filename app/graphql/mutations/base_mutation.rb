module Mutations
  class BaseMutation < GraphQL::Schema::Mutation

    # def resolve(**args)
    #   authorize_user
    # end

    protected

    def authent_user
      return true if context[:current_user].present?

      raise Graphql::ExecutionError, "User not signed in"
    end
  end
end
