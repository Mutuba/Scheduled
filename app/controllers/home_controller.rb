# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticate_user!

  def index; end

  private

  def office_hours_params
    params.require(:user).permit(:office_hours_start, :office_hours_end)
  end
end
