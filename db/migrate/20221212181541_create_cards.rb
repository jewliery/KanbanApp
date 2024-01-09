# frozen_string_literal: true

class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.string :title
      t.string :description
      t.string :status
      t.references :board, null: false, foreign_key: true

      t.timestamps
    end
  end
end
