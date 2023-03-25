class GroupsController < ApplicationController
  
    def index
       @groups = Group.where(author_id: current_user.id)
      
       
  
       

    end

    def new
        @group = Group.new
    end

    def create
        @group = Group.new(group_params)
        @group.author_id = current_user.id
        

        if @group.save
          flash[:notice] = 'Category created successfully!'
          redirect_to groups_path
        else
          flash[:alert] = "Some thing went wrong!"
          render :new, status: :unprocessable_entity
        end
    end

    def group_params
      params.require(:group).permit(:name, :icon)
    end


end
