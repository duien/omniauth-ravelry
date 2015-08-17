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
    end
  end
end
