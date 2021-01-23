require 'rails_helper'

RSpec.describe "thoughts/index", type: :view do
  let(:user) { FactoryBot.create :user }

  before(:each) do
    assign(:thoughts, [
      Thought.create!(
        title: "Title",
        contents: "MyText",
        read_time: 2
      ),
      Thought.create!(
        title: "Title",
        contents: "MyText",
        read_time: 2
      )
    ])
    allow(view).to receive(:current_user).and_return(user)
    allow(view).to receive_messages(:will_paginate => nil)
  end

  it "renders a list of thoughts" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
