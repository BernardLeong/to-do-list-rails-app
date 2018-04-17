def sortable(column, title = nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction} 
  end





class ToDosController < ApplicationController
    helper_method :sort_column, :sort_direction
    
    def index
        if params[:search]
            @todos = Todo.search(params[:search])
        else
            @todos = Todo.all
            respond_to do |format|
                format.json { render json: @todos}
                format.html
            end
        end
    end

    def ascending_order_title
        @ascend = Todo.all.order(to_dos: :asc)
    end

    def ascending_order_comments
        @desend = Todo.all.order(comments: :asc)
    end

    def new
        @todo = Todo.new
    end

    def create
        byebug
        @todo = Todo.new(to_dos_params)  #if to_dos_params is not placed, permissible edit is false
        if @todo.save
            redirect_to to_dos_path
        else
            render :new
        end

    end


    def destroy
        @todo = Todo.find(params[:id]).destroy
        redirect_to to_dos_path
    end



    def show
        @todo = Todo.find(params[:id])
    end

    def edit
        @todo = Todo.find(params[:id])
    end

    def update
        @todo = Todo.find(params[:id]) 
        if @todo.update(to_dos_params)
            redirect_to to_dos_path
        else
            render :edit
        end
    end

    private

    def sort_column
        Todo.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end
    
    def to_dos_params
        params.require(:todo).permit(:to_dos , :comments)
    end


end
