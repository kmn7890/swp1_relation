class TimelineController < ApplicationController
    before_action :authenticate_user!, except: :index

    def index 
        @blogs = Blog.all.reverse  
    end
    
    def write
        Blog.create(user_id: current_user.id, content: params[:naeyong])
        redirect_to :root
    end

    def comment
        Comment.create(user_id: current_user.id, blog_id: params[:blog_id], msg: params[:comment])
    redirect_to :root   
    end
    
    def bypeople
        @users = User.all
    end
    
    def delete_content
        dc = Blog.find(params[:id])
        dc.destroy
        redirect_to :root
    end
    
    def delete_msg
        dm = Comment.find(params[:id])
        dm.destroy
        redirect_to :root
    end

    def edit_content
        @edit_content = Blog.find(params[:id])
    end
    
    def edit_msg
        @edit_msg = Comment.find(params[:id])


    end
    

end
