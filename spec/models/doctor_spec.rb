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
require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe 'phone validation' do
    let(:phone_number) { '+38(097)111-22-33' }
    let(:doctor) { build(:doctor, phone: phone_number) }
    context "with valid params" do
      it { expect(doctor).to be_valid }

      it "creates a valid phone" do
        expect(doctor.phone).to eq(phone_number)
      end
      it { should allow_value("+38(097)555-55-55").for(:phone) }
    end
    context "with invalid params" do
      let(:phone_number) { '(097)111-22-33' }
      
      it { expect(doctor).not_to be_valid }
      it { should_not allow_value("+41(097)111-22-33").for(:phone) }
      it { should_not allow_value("+38(097)111 22 33").for(:phone) }
      it { should_not allow_value("+38(997)111-22-33").for(:phone) }
      it { should_not allow_value("phone").for(:phone) }
    end
  end

  describe 'phone uniqueness' do
    let(:category) { create(:category, :therapist) }
    let(:phone_number_1) { '+38(097)111-22-33' }
    let(:phone_number_2) { '+38(097)222-33-44' }
    let(:first_doctor) { build(:doctor, phone: phone_number_1, category: category) }
    let(:second_doctor) { build(:doctor, phone: phone_number_2, category: category) }

    before { create(:doctor, phone: phone_number_1, category: category) }

    it { expect(first_doctor).not_to be_valid }
    it { expect(second_doctor).to be_valid }
  end
end
