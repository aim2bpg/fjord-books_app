# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:cherry_book)

    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit books_url
    assert_selector 'h1', text: '本'
  end

  test 'creating a Book' do
    visit books_url
    click_on '新規作成'

    fill_in 'タイトル', with: 'Ruby超入門'
    fill_in 'メモ', with: 'すごくわかりやすい！！'
    fill_in '著者', with: 'igaiga'
    click_on '登録する'

    assert_text '本が作成されました。'
    assert_text 'Ruby超入門'
    assert_text 'すごくわかりやすい！！'
    assert_text 'igaiga'
  end

  test 'updating a Book' do
    visit books_url
    click_on '編集'

    fill_in 'タイトル', with: '独習RubyonRails'
    fill_in 'メモ', with: 'わかりやすい！！'
    fill_in '著者', with: '小餅良介'
    click_on '更新'

    assert_text '本が更新されました。'
    assert_text '独習RubyonRails'
    assert_text 'わかりやすい！！'
    assert_text '小餅良介'
  end

  test 'destroying a Book' do
    visit books_url
    assert_text 'プロを目指す人のためのRuby入門'

    page.accept_confirm do
      click_on '削除'
    end

    assert_text '本が削除されました。'
    assert_no_text 'プロを目指す人のためのRuby入門'
  end
end
