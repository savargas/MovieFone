class HomeScreen < Testmunk::IOS::Screen

  class InTheaters < Testmunk::IOS::View
    button :see_more, "* marked:'IN THEATERS' parent MVFCollectionView descendant * marked:'SEE MORE'"

    def initialize(driver)
      super driver, "* marked:'IN THEATERS'"
    end
  end

  class Featured < Testmunk::IOS::View

    def initialize(driver)
      super driver, "* marked:'TOP NEWS'"
    end
  end

  class AtHome < Testmunk::IOS::View

    def initialize(driver)
      super driver, "* marked:'NEW ON NETFLIX'"
    end
  end

  button :not_now, {marked:'Not now'}
  button :settings, {marked:'NavigationBarIconSettings'}
  field :search, "UISearchBarTextField"
  button :in_theaters_tab, "* marked:'In Theaters' index:0"
  button :at_home_tab, "* marked:'At Home' index:0"
  button :search_icon, "* marked:'NavigationBarIconSearch' index:0"
  button :watch_list_icon, "* marked:'NavigationBarIconWatchlist' index:0"

  def traits
    settings
  end

  def posters(i)
    if device_family_iphone?
      view("MVFImageCollectionViewCell index:#{i}")
    else
      view("UICollectionViewCell index:#{i}")
    end
  end

  def search_results(title)
    view({marked:title})
  end

  def in_theaters
    InTheaters.new(@driver)
  end

  def featured_screen
    Featured.new(@driver)
  end

  def at_home_screen
    AtHome.new(@driver)
  end

end