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
        binding.pry
        @results = handle_results(@questionnaire, params[:question])
    end

    def handle_results(questionnare, questionnaire_results_hash)
        return false unless questionnaire_results_hash
    end

    def validation_results(questionnaire, questionnaire_results_hash)
        return false unless questionnaire_results_hash
        questionnaire_hash = questionnaire_results_hash.to_unsafe_h
        question_ids_array = questionnaire.question_ids
        question_hash_ids_array = questionnaire_hash.keys.map(&:to_i)
        question_ids_array == question_hash_ids_array
    end
end