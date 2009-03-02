def messages_should_include(message)
  @messenger.string.split("\n").should include(message)
end

Given /^I am not yet playing$/ do
end

Given /^the secret code is (. . . .)$/ do |code|
  @messenger = StringIO.new
  @game = Mastermind::Game.new(@messenger)
  @game.start(code.split)
end

When /^I guess (. . . .)$/ do |code|
  @game.guess(code.split)
end

When /^I start a new game$/ do
  @messenger = StringIO.new
  game = Mastermind::Game.new(@messenger)
  game.start
end

When /^I break the code on on the (\d+.*) guess$/ do |guess_count|
  @messenger = StringIO.new
  game = Mastermind::Game.new(@messenger)
  game.start(%w[r g y c])
  (guess_count.to_i - 1).times do
    game.guess(%w[r g y b])
  end
  game.guess(%w[r g y c])
end

Then /^I should see the message "(.*)"$/ do |message|
  messages_should_include(message)
end

Then /^the mark should be (.*)$/ do |mark|
  messages_should_include(mark)
end

Then /^the game should be over$/ do
  @game.should be_over
end
