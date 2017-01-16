class GroupsController < ApplicationController
  before_action :authenticate_user!, :only => [:index]
  def new
  end
  def edit
  end
end