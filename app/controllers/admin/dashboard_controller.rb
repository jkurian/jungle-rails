class Admin::DashboardController < Admin::BaseAdminController
  before_filter :authorize
  def show
  end
end
