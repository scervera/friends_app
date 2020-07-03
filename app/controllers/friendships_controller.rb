class FriendshipsController < ApplicationController
  before_action :set_friendship, only: [:show, :edit, :update, :destroy]

  def create
  	## NEED to come back to this. Must check to make sure friendship doesn't exist before creating it.
	  @friendship = current_user.friendships.build(:friend_id => params[:friend_id], :friendship_confirmed => false)
	  if !@friendship.valid?
	  	  flash[:alert] = "Friendship already exists. Select a different one."
	      redirect_to root_url
	  elsif @friendship.save
	      flash[:notice] = "Added friend."
	      redirect_to root_url
	  else
	      flash[:alert] = "Unable to add friend."
	      redirect_to root_url
	  end
  end

  def update
    respond_to do |format|
      @friendship.update(friendship_params)
        format.html { redirect_to root_url, notice: 'Friendship was accepted.' }
        format.json { render :show, status: :ok, location: @friendship }
      # else
      #   format.html { render :edit }
      #   format.json { render json: @opportunity.errors, status: :unprocessable_entity }
      # end
    end
  end

  # def accept
	 #  @friendship = current_user.friendships.build(:friendship_confirmed => true)
	 #  if @friendship.save
	 #      flash[:notice] = "Friend confirmed."
	 #      redirect_to root_url
	 #  else
	 #      flash[:error] = "Unable to confirm friend."
	 #      redirect_to root_url
	 #  end
  # end


  def destroy
      @friendship = current_user.friendships.find(params[:id])
      @friendship.destroy
      flash[:notice] = "Removed friendship."
      redirect_to root_url
  end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_friendship
      @friendship = Friendship.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def friendship_params
      params.require(:friendship).permit(:friend_id, :user_id, :friendship_confirmed)
    end
end
