require "test_helper"
require "bomb_bomb"
require "curb"
require "minitest/mock"

describe "BombBomb API method calls samples" do

  before do
    @email         = "guille@fivestreet.com"
    @pw            = "12345"
    @bomb          = BombBomb::API.new(@email, @pw)

    #Fake Response
    FakeResponse   = Struct.new(:body_str)
    @response      = FakeResponse.new("{}")
    @mock          = MiniTest::Mock.new
    @mock.expect :body_str, @response.body_str
  end

  it "checks if login is valid" do

    Curl.stub(:post, @mock) do
      @bomb.is_valid_login
    end

    assert @mock.verify
  end

  it "gets all lists" do
    Curl.stub(:post, @mock) do
      @bomb.get_lists
    end

    assert @mock.verify
  end

  it "gets contacts of a list" do
    Curl.stub(:post, @mock) do
      @bomb.get_list_contacts( :list_id => "idtolist")
    end

    assert @mock.verify
  end

end
