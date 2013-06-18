require "test_helper"
require "bomb_bomb"
require "minitest/mock"

describe "BombBomb API method calls samples" do
  before do
    @email         = "guille@fivestreet.com"
    @pw            = "12345"
    @bomb          = BombBomb::API.new(@email, @pw)

    #Fake Response
    FakeResponse   = Struct.new(:body)
    @response      = FakeResponse.new("{}")
    @mock          = MiniTest::Mock.new
    @mock.expect :body, @response.body
  end

  it "checks if login is valid" do

    Net::HTTP.stub(:post_form, @mock) do
      @bomb.is_valid_login
    end

    assert @mock.verify
  end

  it "gets all lists" do
    Net::HTTP.stub(:post_form, @mock) do
      @bomb.get_lists
    end

    assert @mock.verify
  end

  it "gets contacts of a list" do
    Net::HTTP.stub(:post_form, @mock) do
      @bomb.get_list_contacts( :list_id => "idtolist")
    end

    assert @mock.verify
  end

end
