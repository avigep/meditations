require 'rails_helper'

RSpec.describe "thoughts/index", type: :view do
  let(:user) { FactoryBot.create :user }

  before(:each) do
    assign(:thoughts, [
      Thought.create!(
        title: "Title",
        contents: "MyTextMyTextMyTextMyTextMyTextMyText",
        read_time: 2
      ),
      Thought.create!(
        title: "Title",
        contents: "MyTextMyTextMyTextMyTextMyTextMyText",
        read_time: 2
      )
    ])
    allow(view).to receive(:current_user).and_return(user)
    allow(view).to receive_messages(:will_paginate => nil)
  end

  it "renders a list of thoughts" do
    render
    assert_select "h4", text: "Title".to_s, count: 2
    assert_select "p", text: "MyTextMyTextMyTextMyTextMyTextMyText".to_s, count: 2
  end
end
