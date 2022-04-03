class TodoListsController < ApplicationController
  require 'will_paginate/array'
  before_action :set_todo_list, only: %i[ show edit update destroy ]

  def index
    @todo_lists = TodoList.paginate(page: params[:page], per_page: 5).order(created_at: :desc)
    case
    when params[:sort] == 'time'
      @todo_lists
    when params[:sort] == 'percentage'
      @todo_lists = TodoList.all.sort_by{ |todo_list| todo_list.percent_done }.reverse.paginate(page: params[:page], per_page: 5)
    end
  end

  def show
  end

  def new
    @todo_list = TodoList.new
  end

  def edit
  end

  def create
    @todo_list = TodoList.new(todo_list_params)
      if @todo_list.save
        redirect_to todo_list_url(@todo_list), notice: "Todo list was successfully created" 
      else
        render :new, status: :unprocessable_entity
      end
  end

  def update
    if @todo_list.update(todo_list_params)
      redirect_to todo_list_url(@todo_list), notice: "Todo list was successfully updated" 
    else
      render :edit, status: :unprocessable_entity 
    end
  end

  def destroy
    @todo_list.destroy
    redirect_to todo_lists_url, notice: "Todo list was successfully destroyed"
  end

  private

    def set_todo_list
      @todo_list = TodoList.find(params[:id])
    end

    def todo_list_params
      params.require(:todo_list).permit(:title)
    end
end
