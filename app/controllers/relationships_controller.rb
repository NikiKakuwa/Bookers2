class RelationshipsController < ApplicationController
    before_action :set_user
    def create
        user = User.find(params[:relationship][:follow_id])
        following = current_user.follow(user)
        if following.save
            flash[:success] = 'You have followed the user!'
            redirect_to user
        else
            flash.now[:alert] = 'Your attempt of following this user has failed!'
            redirect_to user
        end
    end

    def destroy
        user = User.find(params[:relationship][:follow_id])
        following = current_user.unfollow(user)
        if following.destroy
            flash[:success] = 'You have unfollowed this user!'
            redirect_to user
        else
            flash.now[:alert] = 'You have failed unfollowing the user'
            redirect_to user
        end
    end

    private

    def set_user
        user = User.find(params[:relationship][:follow_id])
    end

end