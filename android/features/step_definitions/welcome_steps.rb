When(/^I swipe the screen to the left$/) do
  @app.welcome_screen.swipe_screen :left
  @app.welcome_screen.sleep(3)
end