# frozen_string_literal: true

class Card < ApplicationRecord
  belongs_to :board

  @@valid_status = %w[backlog todo working_on done]

  validates  :title,    length: { minimum: 3 }
  validates  :status,   inclusion: { in: @@valid_status }

  def self.valid_status
    @@valid_status
  end

  def next_status
    current_index = @@valid_status.index(status)
    return nil if current_index == @@valid_status.length - 1

    @@valid_status[current_index + 1]
  end

  def prev_status
    current_index = @@valid_status.index(status)
    return nil if current_index.zero?

    @@valid_status[current_index - 1]
  end
end
