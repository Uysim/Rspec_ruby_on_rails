require 'rails_helper'

RSpec.describe Zombie, :type => :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "Zombie is invalid without a name" do
  	zombie=Zombie.new
  	expect(zombie).to be_invalid
  end
  it "Zombie is matchs Ash Clone " do
  	zombie=Zombie.new(name: "Ash Clone 1")
  	expect(zombie.name).to match(/Ash Clone \d/)
  end
  it "Include Tweeet" do
  	tweet1=Tweet.new(status: "Uuuuuuuhhh")
  	tweet2=Tweet.new(status: "Arrrrg")
  	zombie=Zombie.new(name: "Ash", tweets: [tweet1,tweet2])
  	zombie.save
  	expect(zombie.tweets).to include(tweet1)
  	expect(zombie.tweets).to include(tweet2)
  	expect(zombie.reload.tweets.count).to eq(2)
  end

  it "Have two weapon" do
  	zombie = Zombie.new(name: "Ash")
  	zombie.save
  	expect(zombie.weapons.count).to eq(2)
  end

  it "Change the number of Zombie" do
  	zombie=Zombie.new(name:"Ash")
  	expect{zombie.save}.to change{Zombie.count}.by(1)
  end

  it "Raise Error when save without name" do
  	zombie=Zombie.new
  	expect { zombie.save! }.to raise_error(ActiveRecord::RecordInvalid)
  end
end

describe Zombie do
	subject(:zombie) { Zombie.new }
	it "Repond to name" do
		expect(subject).to respond_to(:name)	
	end
	it "Repond to name" do
		should respond_to(:name)	
	end
end

describe Zombie do
	context "Wiht vegan reference" do
		subject{ Zombie.create!(name: "Ash",vegetarian: true) }
		its(:craving) {should eq "vegan brains"}
		
	end
end

describe Zombie do
	subject(:zombie) { Zombie.new(name: "Ash", weapons:[weapon], tweets:[Tweet.new(status:"Axe"),Tweet.new(status:"Gun")]) }
	let(:weapon) { Weapon.new(name: "Axe") }
	it { should respond_to(:name) }
	its(:name){ should eq "Ash" }
	its(:weapons) { should include(weapon) }
	its(:brain) { should be_nil }
	its('tweets.size') { should eq(2) }
	it "Zombie Swing" do
		zombie.swing(weapon).should ==true
	end
end

describe Zombie do
	let(:zombie) { Zombie.create }
	subject{ zombie }
	its(:name) { should be_nil }
end
describe Zombie do
	it "Has No Name" do
		@zombie=Zombie.create
		@zombie.name.should be_nil
	end
	it "Craving Brain" do
		@zombie=Zombie.create
		@zombie.should be_craving_brains
	end
	it 'should not be hungry after eating brains' do
		@zombie = Zombie.create
		@zombie.hungry.should==true
		@zombie.eat(:brains)
		@zombie.hungry.should==false	
	end
end

describe Zombie do
	let(:zombie) { Zombie.create }
	subject { zombie }
	it 'has no name' do
		zombie.name.should be_nil
	end
	it 'craves brains' do
		zombie.should be_craving_brains
	end
	it 'should not be hungry after eating brains' do
		zombie.hungry.should==true
		zombie.eat(:brains)
		zombie.hungry.should==false
	end
end

describe Zombie do
	let(:zombie) { Zombie.create }
	subject { zombie }
	its(:name) { should be_nil }
	it { zombie.should be_craving_brains }
	it 'should not be hungry after eating brains' do
		zombie.hungry.should==true
		zombie.eat(:brains)
		zombie.hungry.should==false
	end
end

describe Zombie do
	let(:zombie) { Zombie.create }
	subject { zombie }
	its(:name) { should be_nil }
	it { zombie.should be_craving_brains }
	it 'should not be hungry after eating brains' do
		zombie.hungry.should==true
		zombie.eat(:brains)
		zombie.hungry.should==false
	end
end

describe Zombie do
	let(:zombie) { Zombie.new }
	before{zombie.hungry!}
	it 'is hungry' do
			zombie.should be_hungry
	end
	it 'craves brains' do
			zombie.should be_craving_brains
	end
	context "With vegan brain" do
		before{zombie.vegetarian==true}
		it 'still craves brain' do
		end
		it 'craves vegan brains' do
		end
	end
end

describe Zombie do
	it "should not have pulse" do
		zombie=Zombie.new
		zombie.pulse.should==false
	end
end

describe Zombie do
	it_behaves_like 'the undead'
end

describe Zombie do
	it_behaves_like 'let the undead' do
		let(:undead) { Zombie.new }
	end
end

describe Zombie do
	it_behaves_like 'let the undead var', Zombie.new
end

describe Zombie do
	context "Decapitate" do
		let(:zombie) { Zombie.create }
		it "it should call method slice" do
			# it should call method slice to run
			zombie.weapons.first.should_receive(:slice)
			zombie.decapitate
		end
		it "set status to dead again" do
			# it comment the method slice
			zombie.weapons.first.stub(:slice)
			zombie.decapitate
			zombie.status.should=="dead again"
		end
	end
end

# describe Zombie, focus:true do
# 	let(:zombie) { Zombie.create }
# 	it "Calls Zoogle.graveyard_locator" do
# 		Zoogle.should_receive(:graveyard_locator).with(zombie.graveyard)
# 		zombie.geolocate
# 	end
# end

describe Zombie do
	let(:zombie) { Zombie.create }
	it "Calls Zoogle.graveyard_locator and return" do
		Zoogle.should_receive(:graveyard_locator).with(zombie.graveyard).and_return({latitude:2,longitude:3})
		zombie.geolocate
	end

	it "Calls Zoogle.graveyard_locator and return 2 3" do
		Zoogle.should_receive(:graveyard_locator).with(zombie.graveyard).and_return({latitude:2,longitude:3})
		zombie.geolocate.should=="2,3"
	end

	it "returns properly formatted lat, long", focus: true do
		loc={latitude:2,longitude:3}
		Zoogle.stub(:graveyard_locator).and_return(loc)
		zombie.geolocate_with_object.should=="2,3"
	end
end