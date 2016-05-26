class WelcomeScreen  < Testmunk::IOS::Screen
  view :hello, {marked:'Hello and welcome to'}
  button :next, {marked:'IntroArrowRight'}
  button :done, {marked:'DONE'}
  view :rewards, "* UIWebBrowserView"
  button :close_intro, "* text:'✕'"
  button :close_rewards_banner, "* css:'#later_button'"

  def traits
    hello
  end

end