require 'rails_helper'

RSpec.describe "thoughts/edit", type: :view do
  before(:each) do
    @thought = assign(:thought, Thought.create!(
      title: "MyString",
      contents: "MyText",
      read_time: 1
    ))
  end

  it "renders the edit thought form" do
    render

    assert_select "form[action=?][method=?]", thought_path(@thought), "post" do

      assert_select "input[name=?]", "thought[title]"

      assert_select "textarea[name=?]", "thought[contents]"

      assert_select "input[name=?]", "thought[read_time]"
    end
  end
end
