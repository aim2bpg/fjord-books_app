# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:Alices_report)

    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit reports_url
    assert_selector 'h1', text: '日報'
  end

  test 'creating a Report' do
    visit reports_url
    click_on '新規作成'

    fill_in 'タイトル', with: 'システムテストをやってみた'
    fill_in '内容', with: '難しかった！'
    click_on '登録する'

    assert_text '日報が作成されました。'
    assert_text 'システムテストをやってみた'
    assert_text '難しかった！'
  end

  test 'updating a Report' do
    visit reports_url
    click_on '編集'

    fill_in 'タイトル', with: 'モデルテストが終わった'
    fill_in '内容', with: 'なかなか難しかったー！'
    click_on '更新'

    assert_text '日報が更新されました。'
    assert_text 'モデルテストが終わった'
    assert_text 'なかなか難しかったー！'
  end

  test 'destroying a Report' do
    visit reports_url
    assert_text 'Alice'
    assert_text 'Railsでテストを書く'

    page.accept_confirm do
      click_on '削除'
    end

    assert_text '日報が削除されました。'
    assert_no_text 'Alice'
    assert_no_text 'Railsでテストを書く'
  end
end