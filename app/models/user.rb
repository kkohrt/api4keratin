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
end
