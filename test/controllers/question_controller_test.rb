require 'test_helper'

class QuestionControllerTest < ActionDispatch::IntegrationTest
    test "call the question api with a valid item and valid tenant api_key" do
        get '/api/v1/questions/20?api_key=7e67a9f113a41b0f426a4fbff021e063'
        k = JSON.parse(response.body)
        return assert k['question_id']==20
    end 

    test "call the question api with a valid private item and valid tenant api_key" do
        get '/api/v1/questions/19?api_key=7e67a9f113a41b0f426a4fbff021e063'
        return assert response.status == 403
    end 

    test "call the question api with a valid item and invalid tenant api_key" do
        get '/api/v1/questions/20?api_key=00000000000000000000000000000000'
        return assert response.status == 401
    end 

    test "call the question api with a invalid item and valid tenant api_key" do
        # get '/api/v1/questions/2020202020?api_key=7e67a9f113a41b0f426a4fbff021e063'
        # return assert response.status == 401
    end 

    test "call the question api with a invalid item and invalid tenant api_key" do
        get '/api/v1/questions/2020202020?api_key=00000000000000000000000000000000'
        return assert response.status == 401
    end 

    # get request_count for Tenant(api_key=7e67a9f113a41b0f426a4fbff021e063)    
    # call load with api_key=7e67a9f113a41b0f426a4fbff021e063 10 times
    # check to make sure request_count was incremented
    test "validate the request count for the tenant is working" do
        byebug
        @tenant = Tenant.find_by_api_key('7e67a9f113a41b0f426a4fbff021e063')

        if (@tenant) 
            @tenant.request_count = @tenant.request_count.blank? ? 0 : @tenant.request_count
            previous_count = @tenant.request_count 
        end

        10.times do |x|
            get '/api/v1/questions/20?api_key=7e67a9f113a41b0f426a4fbff021e063'
            puts x
        end

        return assert @tenant.request_count == previous_count + 10
    end 

end
