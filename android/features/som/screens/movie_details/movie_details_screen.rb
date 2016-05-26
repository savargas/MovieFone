class MovieDetailsScreen < Testmunk::Android::Screen

  view :movie_details, {marked: 'movieruntimeinfo_container'}
  view :start_movie, {marked: 'playtrailerbutton'}
  button :back, "* marked:'the_toolbar' child ImageButton"

  def traits
    view('*')
  end
end
