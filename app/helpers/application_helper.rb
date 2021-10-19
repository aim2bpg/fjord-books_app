# frozen_string_literal: true

module ApplicationHelper
  def flash_message(message, klass)
    tag.div(class: "alert alert-#{klass}") do
      concat tag.button('x', class: 'close', data: { dismiss: 'alert' })
      concat message
    end
  end
end
