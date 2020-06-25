class User < ApplicationRecord
  before_create :set_uid
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  include GraphqlDevise::Concerns::Model

  has_many :posts
  has_many :comments

  enum role: { user: 0, admin: 1, superuser: 2 }

  # def valid_for_authentication?
  #   auth_available && super
  # end

  private

  def set_uid
    self.uid = self.email
  end
end
