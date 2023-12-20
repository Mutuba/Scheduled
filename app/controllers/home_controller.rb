class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def office_hours
    @user = current_user

    respond_to do |format|
      format.html { redirect_to root_path }
      format.turbo_stream do
        if @user.update(office_hours_params)
          render turbo_stream: turbo_stream.replace('modal-frame', partial: 'shared/modal')
        else
          render turbo_stream: turbo_stream.replace('modal-frame', partial: 'shared/modal_error')
        end
      end
      format.json do
        if @user.update(office_hours_params)
          render json: { message: "Office hours saved successfully." }
        else
          render json: { message: "Error saving office hours." }, status: :unprocessable_entity
        end
      end
    end
  end

  private

  def office_hours_params 
    params.require(:user).permit(:office_hours_start, :office_hours_end)
  end
end
