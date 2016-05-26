When(/^I open Settings$/) do
  @app.home_screen.settings.touch
  @app.settings_screen.await
end

Then(/^I press My Location$/) do
  @app.settings_screen.my_location.touch
end

Then(/^I press My Theaters$/) do
  @app.settings_screen.my_theaters.touch
end

Then(/^I press View mPOINTS$/) do
  @app.settings_screen.view_points.touch
end

Then(/^I press Send Feedback$/) do
  @app.settings_screen.send_feedback.touch
end

Then(/^I press Legal$/) do
  @app.settings_screen.legal.touch
end

Then(/^I press More Apps By AOL$/) do
  @app.settings_screen.more_apps.touch
end

And(/^I press Cancel$/) do
  @app.settings_screen.cancel.touch
end