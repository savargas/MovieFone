class SettingsScreen < Testmunk::IOS::Screen
  button :cancel, {marked: 'Cancel'}
  button :my_location, {marked: 'My Location'}
  button :my_theaters, {marked: 'My Theaters'}
  button :view_points, {marked: 'View mPLUS'}
  button :send_feedback, {marked: 'Send Feedback'}
  button :legal, {marked: 'Legal'}
  button :more_apps, {marked: 'More Apps By AOL'}

  def traits
    my_location
  end
end