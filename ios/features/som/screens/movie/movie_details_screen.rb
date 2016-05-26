class MovieDetailsScreen < Testmunk::IOS::Screen
  button :play, {marked:'TrailerIconPlayLarge'}
  button :back, {marked:'NavigationBarIconBack'}
  button :close_trailer, "* marked:'CloseNormal' index:0"


  def traits
    play
  end

  def await
    super
    sleep(3)
  end
end