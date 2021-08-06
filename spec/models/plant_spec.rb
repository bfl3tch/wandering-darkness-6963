require 'rails_helper'

RSpec.describe Plant do
  describe 'relationships' do
    it { should have_many(:harvests) }
    it { should have_many(:plots).through(:harvests) }
  end
end
