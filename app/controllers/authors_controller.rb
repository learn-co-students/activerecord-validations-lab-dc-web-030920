class AuthorsController < ApplicationController
    before_action :set_author, only: [:show, :edit, :update, :destroy]

    def create
        @author = Author.new(author_params)
        if @author.valid?
            @author.save
            redirect_to author_path(@author)
        else
            render :new
        end
    end



    private

    def set_author
        @author = Author.find(params[:id])
    end

    def author_params
        params.require(:author).permit(:name, :phone_number)
    end

end