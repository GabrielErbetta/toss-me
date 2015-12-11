class UrlController < ApplicationController

	def create
		@url = Url.new(url: params[:url], short_url: Url.shorten(params[:url]))
		if @url.save
			@success = true
			render 'info'
		else 
			render 'home'
		end
	end

	def redirect
		@url = Url.find_by(short_url: params[:url])
		if @url
			@url.up_visits
			redirect_to @url.url
		else
			render 'not_found'
		end
	end

	def info
		@url = Url.find_by(short_url: params[:url])
		if @url
			render 'info'
		else
			render 'not_found'
		end
	end

	def url_params
		params.require(:url).permit(:url)
	end

end
