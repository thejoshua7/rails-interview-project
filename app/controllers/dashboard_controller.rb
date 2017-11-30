class DashboardController < ApplicationController
    def home
        # I could have just used the .count but I wanted the full collection 
        # so I could build out display tables and dynamic links for testing the API
        @tenants = Tenant.all.order('request_count DESC NULLS LAST, name ASC');
        @users = User.all
        @questions = Question.all
        @answers = Answer.all
    end
end
