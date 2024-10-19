# app/controllers/todos_controller.rb
class TodosController < ApplicationController
    def new
      @category = Category.find(params[:category_id])
      @todo = @category.todos.build
    end
  
    def create
      @category = Category.find(params[:category_id])
      @todo = @category.todos.build(todo_params)
      if @todo.save
        redirect_to category_path(@category), notice: 'Todo created successfully.'
      else
        render :new
      end
    end
  
    def edit
      @todo = Todo.find(params[:id])
    end
  
    def update
      @todo = Todo.find(params[:id])
      if @todo.update(todo_params)
        redirect_to category_path(@todo.category), notice: 'Todo updated successfully.'
      else
        render :edit
      end
    end
  
    def destroy
      @todo = Todo.find(params[:id])
      @todo.destroy
      redirect_to category_path(@todo.category), notice: 'Todo deleted successfully.'
    end
  
    def toggle_status
      @todo = Todo.find(params[:id])
      @todo.update(completed: !@todo.completed)
      redirect_to category_path(@todo.category)
    end
  
    private
  
    def todo_params
      params.require(:todo).permit(:title, :description, :completed)
    end

    def index
        @todos = Todo.includes(:category).all
      end
      
  end
  