class Admin::BaseAdminController < ApplicationController
    before_filter :authorize
    http_basic_authenticate_with name: ENV["ADMIN_AUTH_NAME"], password: ENV["ADMIN_AUTH_PW"]
end
