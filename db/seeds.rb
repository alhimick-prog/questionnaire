Questionnaire.destroy_all
Question.destroy_all
Answer.destroy_all

5.times do
  questionnaire = Questionnaire.create!(name:Faker::Lorem.sentence(word_count: 1, supplemental: false, random_words_to_add: 2),
                                        description:Faker::Lorem.sentence(word_count: 3, supplemental: false, random_words_to_add: 7))
    rand(3..10).times do
      question = Question.create!(text:Faker::Lorem.question(word_count: 3, supplemental: false, random_words_to_add: 2),
                                  questionnaire_id: questionnaire.id)
        
      number = rand(3..5)
      correct_numb = rand(1..number)
      number.times do |iteration|
        answer = Answer.create!(text:Faker::Lorem.sentence(word_count: 1, supplemental: false, random_words_to_add: 2),
                                is_correct: iteration == correct_numb,
                                question_id: question.id)
      end
    end
end
