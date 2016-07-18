require 'uri'

class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :long_url, presence: true, format: {with: URI.regexp}
	validates :shortened_url, uniqueness: true
	def self.shorten
		((('a'..'z').to_a + (0..9).to_a)*3).shuffle[0,5.to_i].join
	end
end
