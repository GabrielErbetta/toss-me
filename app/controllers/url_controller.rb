class UrlController < ApplicationController

	def create
		url = params[:url]
		@url = Url.new(url: params[:url], short_url: Url.shorten(params[:url]))
		if @url.save
			render 'show'
		else 
			render 'home'
		end
	end

	def show
		@url = Url.find_by(short_url: params[:url])
		redirect_to @url.url
	end

	def url_params
		params.require(:url).permit(:url)
	end

end
