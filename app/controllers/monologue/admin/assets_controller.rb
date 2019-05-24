class Monologue::Admin::AssetsController < Monologue::Admin::BaseController

  def create
    @asset = Monologue::Asset.new(
      file_name: params[:file].original_filename,
      file: params[:file])
    @asset.user = monologue_current_user
    if @asset.save
      render json: { link: Rails.application.routes.url_helpers.rails_blob_path(@asset.file, only_path: true) }, status: :ok
    else
      render json: { errors: @asset.errors.full_messages }, status: 422
    end
  end

end
