require 'spec_helper'

describe OmniAuth::Strategies::Ravelry do
  subject :ravelry do
    OmniAuth::Strategies::Ravelry.new nil, @options || { }
  end

  describe '#options' do
    subject(:options) { ravelry.options }
    describe '#name' do
      subject { options.name }
      it { should eq 'ravelry' }
    end
    describe '#client_options' do
      subject(:client_options) { options.client_options }
      describe '#site' do
        subject { client_options.site }
        it { should eq 'https://api.ravelry.com' }
      end
      describe '#authorize_url' do
        subject { client_options.authorize_url }
        it { should eq 'https://www.ravelry.com/oauth/authorize' }
      end
      describe '#request_token_url' do
        subject { client_options.request_token_url }
        it { should eq 'https://www.ravelry.com/oauth/request_token' }
      end
      describe '#access_token_url' do
        subject { client_options.access_token_url }
        it { should eq 'https://www.ravelry.com/oauth/access_token' }
      end
    end
  end
end
