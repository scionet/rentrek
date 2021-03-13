class PagesController < ApplicationController
  skip_after_action :verify_policy_scoped, only: :home
  def home
    if current_user.present?
      @user = current_user
      authorize @user
    end
    @categories = Category.all
    @equipment = Equipment.all
  end
end
