module Mastermind
  class Game
    def initialize(messenger)
      @messenger = messenger
    end
    
    def start
      @messenger.puts "Welcome to Mastermind!"
      @messenger.puts "Enter guess:"
    end
  end
end