require 'spec_helper'

describe "Deleting todo items" do
  let!(:todo_list) { create(:todo_list) }
  let!(:todo_item) { todo_list.todo_items.create(content: "Milk") }

  before do
    sign_in todo_list.user, password: "P455w0rd!"
  end

  it "is successful" do
    visit_todo_list(todo_list)
    within "#todo_item_#{todo_item.id}" do
      click_link "Delete"
    end
    expect(page).to have_content("Todo list item was deleted.")
    expect(TodoItem.count).to eq(0)
  end
end
