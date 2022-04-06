class SignupsController < ApplicationController

    def create
        signup = Signup.create!(signup_params)
        render json: signup.activity, status: :created
    rescue ActiveRecord::RecordInvalid=> exception
        render json: {errors: exception.record.errors.full_messages}, status: :unprocessable_entity
    end

    private

    def signup_params
        params.permit(:camper_id, :activity_id, :time)
    end

end
