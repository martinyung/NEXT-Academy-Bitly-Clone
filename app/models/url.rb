class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	def self.shorten
		((('a'..'z').to_a + (0..9).to_a)*3).shuffle[0,5.to_i].join
	end
end
