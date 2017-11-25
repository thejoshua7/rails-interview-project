module Api
    module V1
        class QuestionsController < ApplicationController
            before_action :restrict_access

            def index
                @questions = Question.where("private = 'false'").order('created_at DESC');
            end

            def show
                @question = Question.find(params[:id])
                if (@question.private == true)
                    head :forbidden 
                end
            end

            private 
            def restrict_access
                api_key = Tenant.find_by_api_key(params[:api_key])
                head :unauthorized unless api_key
            end

        end
    end
end
