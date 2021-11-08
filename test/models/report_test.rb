# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable?' do
    alice = users(:alice)
    bob = users(:bob)
    report = reports(:alices_report)

    assert report.editable?(alice)
    assert_not report.editable?(bob)
  end

  test '#created_on' do
    report = reports(:alices_report)

    assert Date.parse(report.created_on.to_s)
    report.created_at = '2021-13-32'
    assert_raises(NoMethodError) do
      Date.parse(report.created_on.to_s)
    end
  end
end
