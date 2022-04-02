class TodoItemsController < ApplicationController
  before_action :set_todo_list

  def create
    @todo_item = @todo_list.todo_items.create(todo_item_params)
    redirect_to @todo_list
  end

  def destroy
    @todo_item = @todo_list.todo_items.find(params[:id])
    @todo_item.destroy ? flash[:success] = "Todo list item was deleted." : flash[:error] = "Todo list item couldn't be deleted."
    redirect_to @todo_list 
  end

  private

    def set_todo_list
      @todo_list = TodoList.find(params[:todo_list_id])
    end

    def todo_item_params
      params[:todo_item].permit(:title)
    end
end
