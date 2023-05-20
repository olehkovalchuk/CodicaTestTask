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
class Admin < User

  before_create :set_role

  private

  def set_role
    self.role = 'admin'
  end
end
