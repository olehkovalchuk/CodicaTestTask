# == Schema Information
#
# Table name: users
#
#  id                     :uuid             not null, primary key
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string           not null
#  phone                  :string           not null
#  role                   :integer          not null
#  type                   :string           default("Patient"), not null
#  category_id            :uuid
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :phone, uniqueness: true
  validates :name, presence: true

  enum :role, { admin: 0, doctor: 1, patient: 2 }

  def email_required?
    false
  end
  
  def will_save_change_to_email?
    false
  end
end
