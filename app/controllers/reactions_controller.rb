class ReactionsController < ApplicationController
  before_action :set_reaction, only: %i[ destroy ]

  def create
    @reaction = Reaction.new(reaction_params)

    respond_to do |format|
      if @reaction.save
        format.html { redirect_to reaction_url(@reaction), notice: "Reaction was successfully created." }
        format.json { render :show, status: :created, location: @reaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reaction.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @reaction.destroy!

    respond_to do |format|
      format.html { redirect_to reactions_url, notice: "Reaction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reaction
      @reaction = Reaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reaction_params
      params.require(:reaction).permit(:user_id, :post_id)
    end
end
