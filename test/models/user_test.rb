require 'test_helper'

class UserTest < ActiveSupport::TestCase

# Un User doit avoir un prénom
  test "Thou, User, shall haveth a first_name" do
    user = User.new(first_name:"", last_name:"salut", email:"salut@salut.com", password:"abcdefg" )
    assert_not user.save
  end

# Un User ne peut pas avoir que des espaces en prénom
  test "Thou, User, shall not haveth only spaces in first_name" do
    user = User.new(first_name:"       ", last_name:"salut", email:"salut@salut.com", password:"abcdefg" )
    assert_not user.save
  end

# Un User ne peut pas avoir d'email déjà utilisé
  test "Thou, User, shall not haveth an email already used by another User" do
    User.create(first_name:"salut", last_name:"salut", email:"salut@salut.com", password:"abcdefg")
    user = User.new(first_name:"salut", last_name:"salut", email:"salut@salut.com", password:"abcdefg")
    assert_not user.save
  end

end
