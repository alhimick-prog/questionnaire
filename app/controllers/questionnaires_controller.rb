class QuestionnairesController < ApplicationController
  def index
    @questionnaires = Questionnaire.all
  end

  def show
    @questionnaire = Questionnaire.find(params[:id])
  end

  def results
    @questionnaire = Questionnaire.find(params[:id])
    @valid = validation_results(@questionnaire, params[:question])
    if @valid == true
      @results = handle_results(@questionnaire, params[:question])
    else
      @results = nil
    end
  end

  def handle_results(questionnaire, questionnaire_results_hash)
    number_of_questions = questionnaire.question_ids.count()
    questionnaire_hash = questionnaire_results_hash.to_unsafe_h
    number_of_correct_answers = questionnaire_hash.answers.where(id: questionnaire_hash.value).map(&:is_correct).count(true)
    binding.pry
  end

  def validation_results(questionnaire, questionnaire_results_hash)
    return false unless questionnaire_results_hash
    questionnaire_hash = questionnaire_results_hash.to_unsafe_h
    question_ids_array = questionnaire.question_ids
    question_hash_ids_array = questionnaire_hash.keys.map(&:to_i)
    question_numbers_array = questionnaire.answers.where(id: questionnaire_hash.values).map(&:question_id)
    question_ids_array == question_hash_ids_array && question_ids_array == question_numbers_array
  end
end