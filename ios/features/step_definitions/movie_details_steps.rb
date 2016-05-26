Then(/^I should see movie details$/) do
  @app.movie_details_screen.await
end

When(/^I start the trailer$/) do
  @app.movie_details_screen.play.touch
end

Then(/^I press back button$/) do
  @app.movie_details_screen.back.touch
end

Then(/^I press X button to close trailer$/) do
  @app.movie_details_screen.close_trailer.touch
end

Then(/^I scroll down to see (?:movie|page)? details$/) do
  5.times { @app.movie_details_screen.swipe_screen(:up, {:vertical => {:dy => 500}}) }
end