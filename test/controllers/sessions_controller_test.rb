require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:salut)
  end

# Vérifie si un User se connecte en entrant les bonnes informations
  test "thou shall connect yourself if thou hast wisely chosen ID" do
    get login_path
    post login_path, params: { session: { email: @user.email,
                                          password: 'password' } }
    assert is_logged_in?
  end

# Vérifie si un User ne se connecte pas avec un mauvais email
  test "thou shall not connect yourself if thou hast made a mistake in the email" do
    get login_path
    post login_path, params: { session: { email: "not the good email",
                                          password: 'password' } }
    assert_not is_logged_in?
  end

# Vérifie si un User ne se connecte pas avec un mauvais password
  test "thou shall not connect yourself if thou hast made a mistake in the password" do
    get login_path
    post login_path, params: { session: { email: @user.email,
                                          password: 'not the good password' } }
    assert_not is_logged_in?
  end

end
