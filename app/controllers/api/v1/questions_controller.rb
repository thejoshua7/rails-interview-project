module Api
    module V1
        class QuestionsController < ApplicationController
            def index
                questions = Question.order('created_at DESC');
                render json: {status: 'SUCCESS', message:'Loaded questions', data:questions},status: :ok
            end

            def show
                question = Question.find(params[:id])
                render json: {status: 'SUCCESS', message:'Loaded question', data:question},status: :ok                
            end

        end
    end
end
