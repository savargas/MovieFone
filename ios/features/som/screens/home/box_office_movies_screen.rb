class BoxOfficeMoviesScreen < Testmunk::IOS::Screen

  button :list_view, {marked: 'List View'}
  button :grid_view, {marked: 'Grid View'}
  button :coming_soon, {marked: 'Coming Soon'}
  button :top_box_office, {marked: 'Top Box Office'}

  def traits
    view({marked: 'BOX OFFICE MOVIES'})
  end

  def await
    super
    sleep(5) # for all posters
  end
end