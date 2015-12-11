class Url < ActiveRecord::Base
	validates :url, :format => URI::regexp(%w(http https))

	def up_visits
		self.accesses += 1
		self.save
	end

	class << self

		def shorten(url)
			alphabet = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']
			
			begin
				shorter_url = String.new
				for i in 0..5
					shorter_url << alphabet[rand(36)]
				end
			end until !Url.exists?(short_url: shorter_url)

			return shorter_url
		end
	end
end
