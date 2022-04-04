require 'rails_helper'
RSpec.describe "TodoLists", type: :request do
  let!(:user) { create(:user, email: 'bios111@gmail.com', password: '12345678', password_confirmation: '12345678') }
  let!(:todo_list) { create(:todo_list) }

  before(:each) do
    login_as("bios111@gmail.com", "12345678")
  end

  it "get index" do
    binding.pry
    get todo_lists_path
    expect(response).to be_successful
  end

  it "get show" do
    get todo_list_path(todo_list)
    expect(response).to be_successful
  end

  describe "#create" do
    it "new todo_list" do
      get new_todo_list_path
      expect(response).to render_template(:new)
    end

    it "creates a todo_list" do
      post todo_lists_path, params: { todo_list: { title: "Some deal" } }
      expect(response).to redirect_to todo_lists_path
      follow_redirect!
      expect(response).to render_template(:index)
    end

    it "doesn't creates a todo_list" do
      post todo_lists_path, params: { todo_list: { title: "" } }
      expect(response).to render_template(:new)
    end
  end

  describe "#update" do
    it "edit a todo_list" do
      get edit_todo_list_path(todo_list)
      expect(response).to render_template(:edit)
    end

    it "updates a todo_list" do
      put todo_list_path(todo_list), params: { todo_list: { title: "Some deal" } }
      expect(response).to redirect_to action: "show"
      follow_redirect!
      expect(response).to render_template(:show)
    end

    it "doesn't updates a todo_list" do
      get edit_todo_list_path(todo_list)
      expect(response).to render_template(:edit)
      put todo_list_path(todo_list), params: { todo_list: { title: "" } }
      expect(response).to render_template(:edit)
    end
  end

  it "deletes a todo_list" do
    expect {
        delete todo_list_path(todo_list)
      }.to change{TodoList.count}.by(-1)
    expect(response).to redirect_to action: "index"
    follow_redirect!
    expect(response).to render_template(:index)
  end
end
