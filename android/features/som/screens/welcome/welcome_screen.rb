class WelcomeScreen  < Testmunk::Android::Screen
  view :hello, {marked:'Hello and welcome to'}
  button :skip, {marked:'skip'}

  def traits
    [hello, skip]
  end
end