require 'rails_helper'

RSpec.describe "thoughts/show", type: :view do
  before(:each) do
    @thought = assign(:thought, Thought.create!(
      title: "Title",
      contents: "MyTextMyTextMyTextMyTextMyText",
      read_time: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
  end
end
