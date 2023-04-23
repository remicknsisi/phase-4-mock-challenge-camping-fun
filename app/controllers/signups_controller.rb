class SignupsController < ApplicationController

    def create
        signup = Signup.new(signup_params)
        if signup.valid?
            signup.save
            render json: signup.activity, only: [:id, :name, :difficulty], status: :created
        else
            render json: { errors: signup.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private

    def signup_params
        params.permit(:time, :activity_id, :camper_id)
    end

end
