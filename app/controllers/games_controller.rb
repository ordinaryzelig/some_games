class GamesController < ApplicationController
  RECOMMENDED_COUNT = 4
  PER_PAGE = 15

  before_action :set_game, only: %i[ show edit update destroy ]

  # GET /games or /games.json
  def index
    @total_pages = (Game.count / PER_PAGE.to_f).ceil
    @current_page = (params[:page] || 1).to_i.clamp(1, [@total_pages, 1].max)
    @games = Game.order(:id)
                 .limit(PER_PAGE)
                 .offset((@current_page - 1) * PER_PAGE)
  end

  # GET /games/1 or /games/1.json
  def show
    @recommended = Game.where.not(id: @game.id)
                       .order(Arel.sql("RANDOM()"))
                       .limit(RECOMMENDED_COUNT)
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games or /games.json
  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: "Game was successfully created." }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @game.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /games/1 or /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: "Game was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @game.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /games/1 or /games/1.json
  def destroy
    @game.destroy!

    respond_to do |format|
      format.html { redirect_to games_path, notice: "Game was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def game_params
      params.expect(game: [ :name, :condition, :price_cents ])
    end
end
