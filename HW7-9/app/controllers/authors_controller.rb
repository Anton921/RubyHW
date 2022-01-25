class AuthorsController < ApplicationController
    
    def new
        @author = Author.new
    end

    def edit
    end

    def create
        @author = Author.new(author_params)
        if @author.save
            session[:author_id] = @author.id
            redirect_to root_url, notice: "Thank you for signing up!"
        else
            render "new"
        end
    end

    def show
      @author = Author.find(session[:author_id])
    end

    private
    def author_params
        params.require(:author).permit(:first_name, :last_name, :gender, :birthday, :email, :password, :password_confirmation)
    end
end