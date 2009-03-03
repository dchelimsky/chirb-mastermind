require File.join(File.dirname(__FILE__), "/../spec_helper")

module Mastermind
  describe Game do
    before(:each) do
      @messenger = mock("messenger").as_null_object
      @game = Game.new(@messenger)
    end
    context "starting up" do

      it "should send a welcome message" do
        @messenger.should_receive(:puts).with("Welcome to Mastermind!")
        @game.start(%w[a b c d])
      end

      it "should prompt for the first guess" do
        @messenger.should_receive(:puts).with("Enter guess:")
        @game.start(%w[a b c d])
      end
    end
    
    context "marking a guess" do
      context "with all four colors in the rights spots" do
        it "should mark the guess bbbb" do
          @messenger.should_receive(:puts).with("bbbb")
          @game.start(%w[r g y c])
          @game.guess(%w[r g y c])
        end
      end
      context "with all four colors, two in the right spot" do
        it "marks the guess bbww" do
          @messenger.should_receive(:puts).with('bbww')
          @game.start(%w[r g y c])
          @game.guess(%w[r g c y])
        end
      end
      context "with all four colors, only one in right spot" do
        it "marks the guess bwww" do
          @messenger.should_receive(:puts).with('bwww')
          @game.start(%w[r g y c])
          @game.guess(%w[y r g c])
        end
      end
      
      context "with two colors in the right spot, one of those in the wrong spot" do
        it "marks the guess bbb" do
          @messenger.should_receive(:puts).with('bbb')
          @game.start(%w[r g y c])
          @game.guess(%w[r g y y])
        end
      end
      
    end
  end
end
