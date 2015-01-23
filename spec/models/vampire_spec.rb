require 'rails_helper'

RSpec.describe Vampire, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
  	describe Vampire do
		it "should not have pulse" do
			vampire=Vampire.new
			vampire.pulse.should==false
		end
  	end
 	describe Vampire do
		it_behaves_like 'the undead'
  	end
  	describe Vampire do
		it_behaves_like 'let the undead' do
			let(:undead) { Vampire.new }
		end
	end
	describe Vampire do
		it_behaves_like 'let the undead var', Vampire.new
	end
end
