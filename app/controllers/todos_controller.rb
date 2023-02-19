class TodosController < ApplicationController
  def index
    @todo = Todo.new
    # @todos = Todo.all //↓↓
    # @todos = Todo.rank(:row_order).all
    # @todos = Todo.sorted
    @todos = Todo.all
  end

  def create
    @todo = Todo.new(todo_rank_params)
    if @todo.save
      redirect_to todos_path, notice: "You have created book successfully."
    else
      @todo = Todo.rank(:row_order).all
      render 'index'
    end
  end

  def sort
    todo = Todo.find(params[:todo_id])
    todo.update(todo_rank_params)
    render body: nil
  end


  private

  def todo_params
    params.require(:todo).permit(:title, :body)
  end

  def todo_rank_params
    params.require(:todo).permit(:title, :body, :row_order_position)
  end
end
