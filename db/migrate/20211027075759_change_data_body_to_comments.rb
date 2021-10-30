# frozen_string_literal: true

class ChangeDataBodyToComments < ActiveRecord::Migration[6.1]
  def up
    change_column :comments, :body, :text, null: false
  end

  def down
    change_column :comments, :body, :text
  end
end
