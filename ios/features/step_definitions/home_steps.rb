def goto_home
  @app.welcome_screen.close_intro.touch rescue 0
  @app.welcome_screen.rewards.await({timeout: 5}) rescue 0
  @app.welcome_screen.close_rewards_banner.await({timeout: 5}) rescue 0
  sleep 1
  @app.welcome_screen.close_rewards_banner.touch rescue 0
  begin
    sleep 1 if @app.welcome_screen.close_rewards_banner.exists?
    @app.home_screen.not_now.await({timeout: 10})
    @app.home_screen.sleep(3) # needed before touch?
    @app.home_screen.not_now.touch
  rescue
    @app.home_screen.await
  ensure
    @app.home_screen.await
  end
end

Given(/^I am on the Home screen$/) do
  goto_home
end

Given(/^I skip welcome screen$/) do
  goto_home
end

Then(/^I should see Going to The Movies dialog$/) do
  @app.home_screen.not_now.await
end

Then(/^I should see movie posters$/) do
  @app.home_screen.posters(1).await
end

When(/^I press on (\d*)(?:st|nd|rd|th)? poster$/) do |i|
  @app.home_screen.posters(i.to_i).touch rescue 0
  sleep 2
  (@app.home_screen.posters(i.to_i).touch rescue 0) if device_family_iphone?
end

When(/^I select See More in theaters$/) do
  @app.home_screen.in_theaters.see_more.touch
  @app.box_office_movies_screen.await
end

And(/^I select List View$/) do
  @app.box_office_movies_screen.list_view.touch
  @app.box_office_movies_screen.sleep(5)
end

And(/^I select Grid View$/) do
  @app.box_office_movies_screen.grid_view.touch
  @app.box_office_movies_screen.sleep(5)
end

Then(/^I select Coming Soon$/) do
  @app.box_office_movies_screen.coming_soon.touch
end

Then(/^I select Top Box Office$/) do
  @app.box_office_movies_screen.top_box_office.touch
end

When(/^I search for movie "([^"]*)"$/) do |search_term|
  @app.home_screen.search_icon.touch if device_family_iphone?
  @app.home_screen.search.insert_text(search_term)
  tap_keyboard_action_key
  sleep 1
end

Then(/^I should see "([^"]*)" result$/) do |search_term|
  @app.home_screen.search_results(search_term).await
end

Then (/^I press In Theaters tab$/) do
  @app.home_screen.in_theaters_tab.touch
end

Then (/^I should see In Theaters screen$/) do
  @app.home_screen.in_theaters.await
end

Then (/^I press At Home tab$/) do
  @app.home_screen.at_home_tab.touch
end

Then (/^I should see Featured screen$/) do
  @app.home_screen.featured_screen.await
end

Then (/^I should see At Home screen$/) do
  @app.home_screen.at_home_screen.await
end


Then(/^I press Watch List icon$/) do
  @app.home_screen.watch_list_icon.touch
  sleep 1
end