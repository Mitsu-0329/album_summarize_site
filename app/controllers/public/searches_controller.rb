class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

	def search
		@post = Post.new
		@model = params[:model]
		@content = params[:content]
		@method = params[:method]
		if @model == 'user'
			@records = User.search_for(@content, @method)
		else
			@records = Post.search_for(@content, @method)
		end
	end
end
