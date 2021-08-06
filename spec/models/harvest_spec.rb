require 'rails_helper'

RSpec.describe Harvest do
  describe 'relationships' do
    it { should belong_to(:plot) }
    it { should belong_to(:plant) }
  end
end
