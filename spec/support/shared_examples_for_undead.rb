shared_examples_for 'the undead' do
	it 'does not have a pulse' do
		subject. pulse.should == false
	end
end

shared_examples_for 'let the undead' do
	it 'does not have a pulse' do
		undead. pulse.should == false
	end
end

shared_examples_for 'let the undead var' do |undead|
	it 'does not have a pulse' do
		undead. pulse.should == false
	end
end