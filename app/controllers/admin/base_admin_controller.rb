class Admin::BaseAdminController < ApplicationController
    http_basic_authenticate_with name: ENV["ADMIN_AUTH_NAME"], password: ENV["ADMIN_AUTH_PW"]
end
