class User < ApplicationRecord
  has_secure_password

  validates :email, :username, presence: true, uniqueness: { case_sensitive: false }
  validates :email, format: { with: /\A[a-zA-Z0-9.!\#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*\z/ }

  def self.find_by_login usr_parms
    conditions = usr_parms.dup
    login = conditions.to_s
    where(['id = :value OR lower(username) = :value OR lower(email) = :value', { value: login.strip.downcase }]).first
  end
end
