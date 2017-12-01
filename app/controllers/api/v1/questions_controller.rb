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
                @tenant = Tenant.find_by(api_key: params[:api_key])
                if (@tenant) 
                    @tenant.increment_counter
                else
                    head :unauthorized
                    return
                end
            end

        end
    end
end
