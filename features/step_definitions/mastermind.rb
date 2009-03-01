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

Then /^the game should say "(.*)"$/ do |message|
  @messenger.string.split("\n").should include(message)
end

Then /^the mark should be (.*)$/ do |mark|
  @messenger.string.split("\n").should include(mark)
end
