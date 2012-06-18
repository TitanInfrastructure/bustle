require_relative '../../spec_helper'

module Bustle
  describe 'Publisher' do
    let(:described_class) { Publisher }

    include_context 'app_resources'
    it_behaves_like 'model'
    it_behaves_like 'has_activities'

    it "is able to publish an activity" do
      publisher = Publishers.add post
      publisher.publish({
        :resource => comment,
        :action   => 'reply'
      })
      Activity.to_adapter.get(1).action.should == 'reply'
    end
  end
end
