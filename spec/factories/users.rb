# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  auth_uid   :string
#  email      :string
#  first_name :string
#  last_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :user do
    first_name { "MyString" }
    last_name { "MyString" }
    email { "MyString" }
    auth_uid { "MyString" }
  end
end
