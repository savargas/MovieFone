class HomeScreen < Testmunk::Android::Screen

  class GoingToDialog < Testmunk::Android::View
    button :not_now, {marked:'Not now'}

    def initialize(driver)
      super driver, {marked:'Not now'}
    end
  end

  view :posters_grid, {marked: 'rv_grid_movies'}
  button :search_button, {marked: 'action_search'}
  field :search, {marked: 'rl_search_container'}
  button :options_button, {marked: 'More options'}
  button :back_from_my_location_button, {marked: 'Cancel'}
  button :back_from_my_theaters_button, "* id:'backbutton'"
  button :close_rewards, "android.widget.ImageButton"
  button :in_theaters, {marked: 'In Theaters'}

  def traits
    in_theaters
  end

  def posters(i)
    view("* marked:'iv_movie_poster_grid' index:#{i}")
  end

  def search_results(title)
    view("* marked:'tv_title_search' text:'#{title}'")
  end

  def touch_see_more
    q = "* id:'see_more_from_home'"
    driver.send(:touch,(q)) if find_if_exist(q)

  end

  def find_if_exist(m_query)
    query_result = query(m_query)
    current_screen_state = query('*')
    prev_screen_state = []
    while (query_result.empty? and (current_screen_state != prev_screen_state))
      prev_screen_state = current_screen_state
      step 'I scroll down'
      current_screen_state = query('*')
      query_result = query(m_query)
    end
    query(m_query)
  end

  def wait_for_rewards_to_disappear
    wait_for(15){(query("webView css:'*'"))==[]} rescue 0
  end

  def wait_for(timeout = 10, &block)
    @result=nil
    end_time = Time.now.to_i + timeout
      until Time.now.to_i > end_time
        begin
          @result = yield
          return @result if @result
        rescue
          nil
        end
      end
      if @result == nil || @result == false
        raise "Timeout exceeded, block not succeeded"
      elsif @result == true
        return true
      end
  end


  def going_to_dialog
    GoingToDialog.new(@driver)
  end
end
