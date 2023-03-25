class EntitiesController < ApplicationController
    def index
        @group = Group.find(params[:group_id])
        @current_user = current_user
        @entities = Entity.where(group_id: @group.id)
    end

    

    def new
        @entity = Entity.new
    end
    
    def create
        @entity = Entity.new(entity_params)
        @entity.author_id = current_user.id
        @entity.group = Group.find(params[:group_id])

        
        if @entity.save
          flash[:notice] = 'entity added successfully!'
          redirect_to group_entities_path
        else
          flash[:alert] = "Couln't add entity!"
          render :new, status: :unprocessable_entity
        end
    end

    def entity_params
        params.require(:entity).permit(:name, :amount)
    end



end
