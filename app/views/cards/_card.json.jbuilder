# frozen_string_literal: true

json.extract! card, :id, :title, :description, :status, :board_id, :created_at, :updated_at
json.url card_url(card, format: :json)
