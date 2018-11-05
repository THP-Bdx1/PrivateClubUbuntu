require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:salut)
    @user2 = users(:bye)
  end

# La Home Page doit fournir un lien vers le Club Page quand un User est connecté
# et ne doit pas afficher de lien pour login ou s'enregistrer
  test 'Thou shall findeth a link to the club when logged in, and no link to login nor register' do
    get login_path
       post login_path, params: { session: { email:    @user.email,
                                             password: 'password' } }
       assert_redirected_to '/'
       follow_redirect!
       assert_select "a[href=?]", club_path
       assert_select "a[href=?]", login_path, count: 0
       assert_select "a[href=?]", signup_path, count: 0
  end

# La Home Page doit fournir un lien pour login ou s'enregistrer quand il n'y a pas de User connecté
# et ne doit pas afficher de lien pour aller dans le Club Page
  test "Thou shall findeth a link to register or login when logged out" do
    get '/'
      assert_select "a[href=?]", club_path, count: 0
      assert_select "a[href=?]", login_path
      assert_select "a[href=?]", signup_path

  end

# La Navbar doit fournir un lien vers le Club Page quand un User est connecté
# et ne doit pas afficher de lien pour login ou s'enregistrer
  test 'Thou shall findeth a link to the navbar when logged in, and no link to login nor register' do
    get login_path
       post login_path, params: { session: { email:    @user.email,
                                             password: 'password' } }
       assert_redirected_to '/'
       follow_redirect!
       assert_select "a[href=?]", club_path, count: 2
       assert_select "a[href=?]", login_path, count: 0
       assert_select "a[href=?]", signup_path, count: 0
       assert_select "a[href=?]", logout_path
  end

# La Navbar doit fournir un lien pour login ou s'enregistrer quand il n'y a pas de User connecté
# et ne doit pas afficher de lien pour aller dans la Navbar
  test "Thou shall findeth a link to register or login in the navbar when logged out" do
    get '/'
      assert_select "a[href=?]", club_path, count: 0
      assert_select "a[href=?]", login_path, count: 2
      assert_select "a[href=?]", signup_path, count: 2
  end

# La Club Page n'est pas accessible à un utilisateur qui n'est pas connecté
  test "Thou shall not access to the club page if thou art not logged in" do
    get '/club'
      assert_redirected_to '/login'
  end

# La Club Page affiche bien la liste des personnes inscrites sur le site
  test "thou shall see all users on this page" do
    get login_path
       post login_path, params: { session: { email:    @user.email,
                                             password: 'password' } }
    get "/club"
    assert_select "td", @user.email
    assert_select "td", @user2.email
  end

end
