require 'rails_helper'

RSpec.describe CryptocurrenciesController, type: :controller do

  context 'index' do
    subject(:action) { get 'index' }
    it { expect(subject) }
  end
end
