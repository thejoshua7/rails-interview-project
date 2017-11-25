class DashboardController < ApplicationController
    def home
        @tenants = Tenant.all.order('request_count DESC NULLS LAST, name ASC');
        @users = User.all
        @questions = Question.all
        @answers = Answer.all
    end
end
