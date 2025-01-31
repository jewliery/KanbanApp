# frozen_string_literal: true

class CardsController < ApplicationController
  before_action :set_board
  before_action :set_card, only: %i[show edit update destroy]

  # GET /cards
  # GET /cards.json
  def index
    @cards = @board.cards
  end

  # GET /cards/1
  # GET /cards/1.json
  def show; end

  # GET /cards/new
  def new
    @card = Card.new(board_id: @board.id)
  end

  # GET /cards/1/edit
  def edit; end

  # POST /cards
  # POST /cards.json
  def create
    @card = @board.cards.build(card_params)
    respond_to do |format|
      if @card.save
        format.html { redirect_to board_path(@card.board), notice: 'Card was successfully created.' }
        format.json { render :show, status: :created, location: @card }
      else
        format.html { render :new }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cards/1
  # PATCH/PUT /cards/1.json
  def update
    respond_to do |format|
      if @card.update(card_params)
        format.html { redirect_to board_path(@card.board), notice: 'Card was successfully updated.' }
        format.json { render :show, status: :ok, location: @card }
      else
        format.html { render :edit }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1
  # DELETE /cards/1.json
  def destroy
    @card.destroy
    respond_to do |format|
      format.html { redirect_to board_cards_url(@board), notice: 'Card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_board
    @board = Board.find(params[:board_id])
  end

  def set_card
    @card = @board.cards.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def card_params
    params.require(:card).permit(:title, :status, :description)
  end
end
