Then(/^I swipe to (\d*)(?:st|nd|rd|th)? welcome tab$/) do |index|
  @app.welcome_screen.swipe_screen :left
  @app.welcome_screen.sleep(3)
end

Given(/^I skip welcome screen$/) do
  @app.welcome_screen.skip.touch

  begin
    @app.home_screen.going_to_dialog.not_now.touch({timeout:10})
  rescue
    @app.home_screen.await
  ensure
    @app.home_screen.await
  end
end

Then(/^I scroll down to see movie details$/) do
  @app.home_screen.wait_for_rewards_to_disappear
  step "I scroll down"
  sleep 3
end

Then(/^I press X to close rewards screen$/) do
  @app.home_screen.close_rewards.touch
end

Then(/^I press back button with delay$/) do
  @app.movie_details_screen.back.touch
  sleep 4
end

And(/^I press List View$/) do
  step "I press \"List View\""
  sleep 4
end

And(/^I press Grid View$/) do
  step "I press \"Grid View\""
  sleep 4
end

When(/^I press on settings button and wait$/) do
  @app.home_screen.options_button.touch
  sleep 2
end

Then(/^I press My Location$/) do
  step "I press \"My Location\""
  sleep 4
end

Then(/^I press My Theaters$/) do
  step "I press \"My Theaters\""
  sleep 4
end

Then(/^I press mPOINTS Rewards$/) do
  step "I press \"mPLUS Rewards\""
  sleep 4
end

Then(/^I press Settings$/) do
  step "I press \"Settings\""
  sleep 4
end
