require_relative '../../spec_helper'

module Bustle
  describe 'Activity' do
    let(:described_class) { Activity }

    it_behaves_like 'model'
  end
end
