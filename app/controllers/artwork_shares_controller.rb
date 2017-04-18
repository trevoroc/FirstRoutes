class ArtworkSharesController < ApplicationController

  def create
    
  end


  def destroy

  end

  private
  def shares_params
    params.require(:artwork_share).permit(:artwork_id, :viewer_id)
  end
end
