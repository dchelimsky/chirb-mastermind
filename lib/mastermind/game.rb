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
      
      # b_cnt = 0
      # guess.each_with_index do |c, i|
      #   b_cnt += 1 if c == @secret_code[i]
      # end
      # over_cnt = 0
      #   s = @secret_code.dup
      # guess.sort.each_with_index do |c, i|
      #   s[i] = nil
      #   over_cnt += 1 if s.include?(c)
      #   s.uniq!
      # end
      # puts b_cnt
      # puts  over_cnt
      # puts guess.sort.inspect
      # puts @secret_code.sort.inspect
      # 
      # puts(("b" * b_cnt) + ("w" * (over_cnt-b_cnt)))
      # @messenger.puts(("b" * b_cnt) + ("w" * (over_cnt-b_cnt)))
      
      # result = []
      # remainder = []
   
      # count = Hash.new(0)
      # guess.each {|g| count[g]= count[g]+1}
      # 
      # guess.each_with_index do |color, index|
      #   if color == @secret_code[index]
      #     result << "b"
      #   elsif @secret_code.include?(color) && count[color] <= 1
      #     result << "w"
      #   end
      # end
      # @messenger.puts result.sort.join("")
      
      # guess, @secret_code
      answer = [nil, nil, nil, nil]
      0.upto(3) do |i|
        if guess[i] == @secret_code[i]
          answer[i] = "b"
        end
      end
      0.upto(3) do |guess_i|
        0.upto(3) do |key_i|
          next if answer[key_i] == "b"
          next if answer[key_i] == "w"
          if guess[guess_i] == @secret_code[key_i]
            answer[key_i] = "w"
          end
        end 
      end
      @messenger.puts answer.compact.sort.join
    end
  end
end