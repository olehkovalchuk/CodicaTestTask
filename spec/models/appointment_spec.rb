# == Schema Information
#
# Table name: appointments
#
#  id             :uuid             not null, primary key
#  recommendation :text             default("")
#  status         :integer          default("open"), not null
#  doctor_id      :uuid             not null
#  patient_id     :uuid             not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require 'rails_helper'

RSpec.describe Appointment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
