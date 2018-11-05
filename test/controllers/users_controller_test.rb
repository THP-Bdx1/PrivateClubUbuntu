require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:salut)
    @user2 = users(:bye)
  end

#Vérifie si les entrées invalides au cours de la création d'utilisateur renvoient sur la même page :

# first_name ne doit pas être vide
  test "Thou shall not haveth an empty first_name" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { first_name: "", last_name:"salut", email: "foo@bar.yes", password: "foobar", password_confirmation: "foobar" } }
    end
    assert_template 'users/new'
  end

# first_name ne doit pas être fait seulement d'espaces
  test "Thou shall not haveth a first_name full of spaces" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { first_name: "      ", last_name:"salut", email: "foo@bar.yes", password: "foobar", password_confirmation: "foobar" } }
    end
    assert_template 'users/new'
  end

# last_name ne doit pas être vide
  test "Thou shall not haveth an empty last_name" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { first_name: "salut", last_name:"", email: "foo@bar.yes", password: "foobar", password_confirmation: "foobar" } }
    end
    assert_template 'users/new'
  end

# last_name ne doit pas être fait seulement d'espaces
  test "Thou shall not haveth a last_name full of spaces" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { first_name: "salut", last_name:"      ", email: "foo@bar.yes", password: "foobar", password_confirmation: "foobar" } }
    end
    assert_template 'users/new'
  end

# email ne doit pas avoir déjà été utilisé
  test "Thou shall not haveth the same email than another user" do
    get signup_path
    post users_path, params: { user: { first_name: "salut", last_name:"salut", email: "foo@bar.yes", password: "foobar", password_confirmation: "foobar" } }
    assert_redirected_to '/'
    get logout_path
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { first_name: "bonjour", last_name:"bonjour", email: "foo@bar.yes", password: "foobar", password_confirmation: "foobar" } }
    end
    assert_template 'users/new'
  end


# show page ne doit pas être accessible si non connecté
  test "Thou shall not access to the show page if thou art not logged in" do
    get '/users/1'
    assert_redirected_to '/login'
  end

# show page accessible si connecté
  test "Thou shall access to the show page if thou art logged in" do
    get login_path
       post login_path, params: { session: { email:    @user.email,
                                             password: 'password' } }
    get "/users/1"
    assert_template "show"
  end

# impossible d'accéder au show page d'un autre user
  test "Thou shall not access to the show page of another user" do
    get login_path
       post login_path, params: { session: { email:    @user.email,
                                             password: 'password' } }
    get '/users/2'
    assert_redirected_to '/'
  end

# le formulaire edit renvoie une erreur si une entrée est invalide
test "Thou shall not edit your profile with false information" do
  get login_path
     post login_path, params: { session: { email:    @user.email,
                                           password: 'password' } }
  get '/users/1/edit'
      update, params: { user: { first_name: "", last_name:"salut", email: "foo@bar.yes", password: "foobar", password_confirmation: "foobar" } }
  assert_redirected_to 'users/1/edit'

end

# tenter d'accéder à edit sans être connecté renvoie au login
# test "Thou shall not edit anything without being connected" do
#
# end

# tenter d'accéder à un autre edit que le sien renvoie à la home
# test "Thou shall not edit a profile that does not belong to you"
#
# end

end
