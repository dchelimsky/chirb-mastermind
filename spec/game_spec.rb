require 'game'

describe Game do
  context "starting up" do
    before(:each) do
      @messenger = mock("messenger").as_null_object
      @game = Game.new(@messenger)
    end

    it "should send a welcome message" do
      @messenger.should_receive(:puts).with("Welcome to Mastermind!")
      @game.start(%w[a b c d])
    end

    it "should prompt for the first guess" do
      @messenger.should_receive(:puts).with("Enter guess:")
      @game.start(%w[a b c d])
    end
  end
end
