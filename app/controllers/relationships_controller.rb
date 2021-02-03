class RelationshipsController < ApplicationController
   before_action :set_user

  def create
    
  end

  def destroy
    if following.destroy
      redirect_to users_path
    else
      redirect_to users_path
    end
  end

  private
  def set_user
    @user = User.find params[:follow_id]
  end

