# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test '#following?' do
    alice = users(:Alice)
    bob = users(:Bob)

    assert_not alice.following?(bob)
    Relationship.create!(follower: alice, following: bob)
    assert alice.following?(bob)
  end

  test '#followed_by?' do
    alice = users(:Alice)
    bob = users(:Bob)

    assert_not bob.followed_by?(alice)
    Relationship.create!(follower: alice, following: bob)
    assert bob.followed_by?(alice)
  end

  test '#follow' do
    alice = users(:Alice)
    bob = users(:Bob)

    assert_not alice.following?(bob)
    alice.follow(bob)
    assert alice.following?(bob)
  end

  test '#unfollow' do
    alice = users(:Alice)
    bob = users(:Bob)

    Relationship.create!(follower: alice, following: bob)
    assert alice.following?(bob)
    alice.unfollow(bob)
    assert_not alice.following?(bob)
  end

  test '#name_or_email' do
    alice = users(:Alice)

    alice.name = ''
    assert_equal 'alice@example.com', alice.name_or_email
    alice.name = 'Alice'
    assert_equal 'Alice', alice.name_or_email
  end
end
