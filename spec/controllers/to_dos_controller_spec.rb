require 'rails_helper'

RSpec.describe ToDosController, type: :controller do



  describe "GET #edit" do
    it "should show to-dos title and body" do
      todo = Todo.create(
        to_dos: "title1",
        comments:  "body1"
      )
      get :edit, params: {id: todo.id}
      expect(assigns(:todo)).to eq todo
      expect(assigns(:todo)).to be_instance_of(Todo)
    end
  end

  describe "PUT #update " do
    it "should "
  end

end