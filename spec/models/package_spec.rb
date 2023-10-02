require 'rails_helper'

RSpec.describe Package, type: :model do
  describe "associations" do
    it { should have_many(:package_product).dependent(:destroy) }
    it { should have_many(:products).through(:package_product) }
    it { should have_many(:order_packages).dependent(:destroy) }
    it { should have_many(:orders).through(:order_packages) }
  end

  describe "validations" do
    subject { FactoryBot.create(:package) }
    it { should validate_uniqueness_of(:name) }
  end
end
