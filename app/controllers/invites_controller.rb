class InvitesController < ApplicationController

  def create
    @invite = Invite.new(invite_params)
    if @invite.save
       @invite.invite_token
    else
       redirect_to root_path, notice: "Something went wrong!"
    end
  end
end
