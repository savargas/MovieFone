Then(/^I swipe to (\d*)(?:st|nd|rd|th)? welcome tab$/) do |index|
  @app.welcome_screen.next.touch
  sleep 1
end

When(/^I press Done button$/) do
  @app.welcome_screen.done.touch
end