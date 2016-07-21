class IndexShortUrl < ActiveRecord::Migration
	def change
		add_index :urls, :shortened_url
	end
end
