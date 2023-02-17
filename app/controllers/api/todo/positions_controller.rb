class Api::Todo::PositionsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def update
    todo = Todo.find_by!(position: params[:from].to_i + 1) # 0から始まるので+1する
    todo.update!(position: params[:to].to_i + 1) # 0から始まるので+1する
    head :ok
  end
end
