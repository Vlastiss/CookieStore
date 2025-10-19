class CookiesController < ApplicationController
  def index
    @cookies = Cookie.all
  end

  def show
    @cookie = Cookie.find(params[:id])
  end
end
