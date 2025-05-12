class TodosController < ApplicationController
  before_action :require_login
  before_action :set_todo, only: [:show, :edit, :update, :destroy]
  before_action :set_categories, only: [:new, :create, :edit, :update]
  
    def index
      @todos = current_user.todos
    end
  
    def show
    end
  
    def new
      @todo = Todo.new
      @categories = current_user.categories
    end
  
    def create
      @todo = current_user.todos.build(todo_params)
      if @todo.save
        redirect_to todos_path, notice: "ToDo created!"
      else
        render :new
      end
    end
  
    def edit
      @categories = current_user.categories
    end

    def set_categories
      @categories = current_user.categories
    end
  
    def update
      if @todo.update(todo_params)
        redirect_to todo_path(@todo), notice: "ToDo updated!"
      else
        render :edit
      end
    end
  
    def destroy
      @todo.destroy!
      redirect_to todos_path, notice: "ToDo deleted."
    end
  
    def completed
      @todos = current_user.todos.where(completed: true)
    end
  
    private
  
    def set_todo
      @todo = current_user.todos.find(params[:id])
    end
  
    def todo_params
      params.require(:todo).permit(:title, :priority, :completed, :category_id)
    end
end
  
