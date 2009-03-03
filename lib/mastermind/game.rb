module Mastermind
  class Game
    def initialize(messenger)
      @messenger = messenger
    end
    
    def start(secret_code)
      @secret_code = secret_code
      @messenger.puts "Welcome to Mastermind!"
      @messenger.puts "Enter guess:"
    end
    
    def guess(guess)
      result = []
      remainder = []
      
      guess.each_with_index do |color, index|
        if color == @secret_code[index]
          result << "b"
        elsif @secret_code.include?(color)
          result << "w"
        end
      end
      puts result.sort.join("")
      @messenger.puts result.sort.join("")
    end
  end
end