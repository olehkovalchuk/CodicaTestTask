# == Schema Information
#
# Table name: categories
#
#  id         :uuid             not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Category < ApplicationRecord
  has_many :doctors, dependent: :restrict_with_exception

  validates :name, presence: true, length: {maximum: 255}
  validates_uniqueness_of :name
end
