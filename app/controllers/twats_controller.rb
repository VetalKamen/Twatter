class TwatsController < ApplicationController

  before_action :set_twat, only: %i[show edit update destroy like retwat]
  before_action :authenticate_user!, except: %i[index show]

  def retwat
    if @twat.retwatted?(current_user)
      redirect_to root_path, alert: 'Your\'ve already retwatted this from your account!'
    else
      original_twat = Twat.find(params[:id])

      @retwat = Twat.new(
        user_id: current_user.id,
        twat: "#{original_twat.twat}. Retwatted from:>> #{original_twat.user.username} <<",
        original_twat_id: original_twat.id
      )
      Retwat.create(
        user_id: current_user.id,
        twat_id: original_twat.id
      )
      if @retwat.save
        redirect_to root_path, alert: 'Retwatted!'
      else
        redirect_to root_path, alert: 'Can not retwatt'
      end
    end
  end

  def like
    if @twat.liked?(current_user)
      Like.all.find_by(user_id: current_user.id, twat_id: @twat.id).destroy
    else
      Like.create(user_id: current_user.id, twat_id: @twat.id)
    end
    redirect_to twats_url
  end

  # GET /twats or /twats.json
  def index
    @twats = Twat.all.order('created_at DESC')
    @twat = Twat.new
  end

  # GET /twats/1 or /twats/1.json
  def show; end

  # GET /twats/new
  def new
    @twat = current_user.twats.build
  end

  # GET /twats/1/edit
  def edit; end

  # POST /twats or /twats.json
  def create
    @twat = current_user.twats.build(twat_params)

    respond_to do |format|
      if @twat.save
        format.html { redirect_to root_path, notice: 'Twat was successfully created.' }
        format.json { render :show, status: :created, location: @twat }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @twat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /twats/1 or /twats/1.json
  def update
    respond_to do |format|
      if @twat.update(twat_params)
        format.html { redirect_to @twat, notice: 'Twat was successfully updated.' }
        format.json { render :show, status: :ok, location: @twat }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @twat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /twats/1 or /twats/1.json
  def destroy
    @twat.destroy
    Retwat.all.find_by(user_id: current_user.id, twat_id: @twat.original_twat_id).destroy
    respond_to do |format|
      format.html { redirect_to twats_url, notice: 'Twat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_twat
    @twat = Twat.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def twat_params
    params.require(:twat).permit(:twat)
  end
end
