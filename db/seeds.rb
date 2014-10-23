# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Machine.create(:name => 'JXA-8800', :description => 'Electron probe micro analyzer', :session_prefix => 'jxa88-')
Machine.create(:name => 'Cameca ims 5f', :description => 'Secondary ion mass spectrometer', :session_prefix => '5f-')
Machine.create(:name => 'Cameca ims 1270', :description => 'High resolution secondary ion mass spectrometer', :session_prefix => '1270-')
Machine.create(:name => '6UHP-70', :description => '6-axis compression high-pressure apparatus', :session_prefix => '6hup-')
Machine.create(:name => 'USSA-5000', :description => 'KAWAI-type multi-anvil high-pressure apparatus', :session_prefix => '5K-')
Machine.create(:name => 'USSA-1000', :description => 'KAWAI-type multi-anvil high-pressure apparatus', :session_prefix => '1K-')
