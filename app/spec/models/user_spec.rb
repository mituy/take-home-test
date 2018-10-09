require 'rails_helper'

RSpec.describe User, type: :model do

  context 'create_with_omniauth' do
    let(:provider) { 'pv' }
    let(:uid) { 'ud' }
    let(:name) { 'nn' }
    let(:oauth_token) { 'tk' }
    let(:auth) {
                 { 'provider' => provider,
                   'uid' => uid,
                   'info' => {'nickname' => name},
                   'credentials' => {'token' => oauth_token},
                 }
               }

    subject { User.create_with_omniauth(auth) }

    it { expect(subject.provider).to eq provider }
    it { expect(subject.uid).to eq uid }
    it { expect(subject.name).to eq name }
    it { expect(subject.oauth_token).to eq oauth_token }
  end
end
