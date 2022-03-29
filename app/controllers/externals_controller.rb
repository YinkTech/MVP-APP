class ExternalsController < ApplicationController
  before_action :set_external, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]
  before_action :correct_user, only: %i[edit update destroy]

  # GET /externals or /externals.json
  def index
    @externals = External.all
  end

  # GET /externals/1 or /externals/1.json
  def show; end

  # GET /externals/new
  def new
    # @external = External.new
    @external = current_user.externals.build
  end

  # GET /externals/1/edit
  def edit; end

  # POST /externals or /externals.json
  def create
    # @external = External.new(external_params)
    @external = current_user.externals.build(external_params)

    respond_to do |format|
      if @external.save
        format.html { redirect_to external_url(@external), notice: 'External was successfully created.' }
        format.json { render :show, status: :created, location: @external }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @external.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /externals/1 or /externals/1.json
  def update
    respond_to do |format|
      if @external.update(external_params)
        format.html { redirect_to external_url(@external), notice: 'External was successfully updated.' }
        format.json { render :show, status: :ok, location: @external }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @external.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /externals/1 or /externals/1.json
  def destroy
    @external.destroy

    respond_to do |format|
      format.html { redirect_to externals_url, notice: 'External was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def correct_user
    @external = current_user.externals.find_by(id: params[:id])
    redirect_to externals_path, notice: 'Not Authorized to Edit this Transactions' if @external.nil?
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_external
    @external = External.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def external_params
    params.require(:external).permit(:company_name, :product_name, :quantity, :amount, :user_id)
  end
end
