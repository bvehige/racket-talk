class CommentsController < ApplicationController

def index

end

def new

end

def create

end

def show

end

def edit

end

def update

end

private

def comment_params
    params.require(:comment).permit(:content, :review_id)
end

end
