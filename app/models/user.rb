# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  auth_uid   :string
#  email      :string
#  first_name :string
#  last_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  validates :email, format: URI::MailTo::EMAIL_REGEXP, uniqueness: true
  validates :first_name, :last_name, presence: true

  before_create :authorize_new_user

  def authorize_new_user
    return unless new_record?
    Rails.logger.info "Creating login for #{email}"
    self.auth_uid = Keratin.authn.import(username: email, password: 'SuperSecret', locked: false).to_s
  end
end
