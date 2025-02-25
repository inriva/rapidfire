module Rapidfire
  class SurveysController < Rapidfire::ApplicationController
    before_filter :authenticate_administrator!, except: :index

    def index
      @surveys = Survey.all
    end

    def new
      @survey = Survey.new
    end

    def edit
      @survey = Survey.find(params[:id])
    end

    def create
      @survey = Survey.new(survey_params)
      if @survey.save
        respond_to do |format|
          format.html { redirect_to surveys_path }
          format.js
        end
      else
        respond_to do |format|
          format.html { render :new }
          format.js
        end
      end
    end

    def update
      @survey = Survey.find(params[:id])

      respond_to do |format|
        if @survey.update(params[:survey])
          format.html { redirect_to survey_questions_path(@survey), notice: 'Survey was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @survey.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @survey = Survey.find(params[:id])
      @survey.destroy

      respond_to do |format|
        format.html { redirect_to surveys_path }
        format.js
      end
    end

    def results
      @survey = Survey.find(params[:id])
      @survey_results =
        SurveyResults.new(survey: @survey).extract

      respond_to do |format|
        format.json { render json: @survey_results, root: false }
        format.html
        format.js
      end
    end

    private

    def survey_params
      if Rails::VERSION::MAJOR >= 4
        params.require(:survey).permit(:name)
      else
        params[:survey]
      end
    end
  end
end
