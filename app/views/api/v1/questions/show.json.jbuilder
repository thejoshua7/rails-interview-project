if @question.present? 
    #json.is_private @question.private
    json.question_id @question.id
    json.question_name @question.title
    json.asker_id @question.user.id
    json.asker @question.user.name
    json.answers @question.answers do |answer|
        json.answer_id answer.id
        json.answer answer.body
        json.answerer answer.user.name
        json.answerer_id answer.user.id
    end
end
