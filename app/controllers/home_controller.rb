class HomeController < ApplicationController
  def index
    @groups = Group.all
    @externals = External.all
  end

  def show; end
end
