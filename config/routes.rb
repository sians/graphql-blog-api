Rails.application.routes.draw do
  # mount_graphql_devise_for 'User',
  # at: 'auth',
  # authenticatable_type: Types::UserType,
  # operations: {
  #   login: Mutations::Users::LoginMutation,
  #   # sign_up: Mutations::Users::SignUp
  # # }, additional_mutations: {
  # #   register_confirmed_user: Mutations::Users::RegisterConfirfmedUser
  # }

  mount_graphql_devise_for 'User', at: 'auth'

  post "/graphql", to: "graphql#execute"
  devise_for :users

end
