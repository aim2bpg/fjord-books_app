# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable?' do
    alice = users(:Alice)
    bob = users(:Bob)
    report = reports(:Alices_report)

    assert report.editable?(alice)
    assert_not report.editable?(bob)
  end

  test '#created_on' do
    report = reports(:Alices_report)

    assert report.created_on.today?
  end
end
