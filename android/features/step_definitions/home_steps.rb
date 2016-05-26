When(/^I select In Theaters tab$/) do
  @app.home_screen.in_theaters.touch
end

Then(/^I should see movie posters$/) do
  @app.home_screen.wait_for_rewards_to_disappear
  @app.home_screen.posters_grid.await
end

When(/^I press on (\d*)(?:st|nd|rd|th)? poster$/) do |index|
  @app.home_screen.posters(index.to_i).touch
end

Then(/^I should see movie details$/) do
  @app.movie_details_screen.movie_details.await
end

When(/^I start the trailer$/) do
  @app.movie_details_screen.start_movie.touch
end

Then(/^I press back button$/) do
  @app.movie_details_screen.back.touch
end

When(/^I search for "([^"]*)"$/) do |search_term|
  @app.home_screen.search_button.touch
  @app.home_screen.search.insert_text(search_term)
end

Then(/^I should see "([^"]*)" result$/) do |search_term|
  @app.home_screen.search_results(search_term).await
end

When(/^I press "([^"]*)" result$/) do |text|
  @app.home_screen.search_results(text).touch
end

When(/^I select See More in theaters$/) do
  sleep 15
  @app.home_screen.touch_see_more
end

When(/^I press on settings button$/) do
  @app.home_screen.options_button.touch
end

When(/^I press back button on My location screen$/) do
  @app.home_screen.back_from_my_location_button.touch
end

When(/^I press back button on My Theaters screen$/) do
  @app.home_screen.back_from_my_theaters_button.touch
end