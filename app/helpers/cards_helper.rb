# frozen_string_literal: true

module CardsHelper
  ## redefined simple url helpers for nested cards
  def edit_card_path(card)
    edit_board_card_path(card.board, card)
  end

  def cards_path(board)
    board_cards_path(board)
  end

  def status_options(selected_status)
    options_for_select(Card.valid_status.map { |x| [x, x] }, selected_status)
  end

  def status_color(status)
    {
      'backlog' => 'bg-info',
      'todo' => 'bg-warning',
      'working_on' => 'bg-danger',
      'done' => 'bg-success'
    }[status]
  end
end
