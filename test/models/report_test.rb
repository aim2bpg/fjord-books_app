# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable?' do
    alice = users(:alice)
    bob = users(:Bob)
    report = reports(:alices_report)

    assert report.editable?(alice)
    assert_not report.editable?(bob)
  end

  test '#created_on' do
    report = reports(:alices_report)

    assert_equal Date.today, report.created_on
  end
end
