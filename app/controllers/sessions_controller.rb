class SessionsController < ApplicationController

    def home
    end

    def destroy
        session.clear
        redirect_to root_path
    end

    def create
        #find user - not creating or updatinf user, don't need instance variable 
        user = User.find_by(email: params[:user][:email])
        #check if find the user AND passowrd valid
        if user && user.authenticate(params[:user][:pass])
        #set the session
        session[:user_id] = user.id
        redirect_to user_path(user) #/users/#{user.if}
        #else redirect to login vs. rendering so nothing prepopulats and form clears completely and does give any info about what part was wrong 
        flash[:massage] = "Oops, looks like your login info is incorrect. Please try again."
        redirect_to "/login"
    end
end
