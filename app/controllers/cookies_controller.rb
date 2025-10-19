class CookiesController < ApplicationController
  def index
    @cookies = Cookie.all
  end

  def show
  end
end
