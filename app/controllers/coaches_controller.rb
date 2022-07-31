class CoachesController < ApplicationController
  def index
    check_if_user_owns_person(request, params[:id])
    coaches = Person.find(params[:id]).coaches
    responseArr = coaches.map do |coach|
      generate_coach_response(coach)
    end
    render json: responseArr, status: 200
  end

  def show
    check_if_user_owns_person(request, params[:id])
    person = Person.find(params[:id])
    coach = person.coaches.find(params[:coach_id])
    response = generate_coach_response(coach)
    render json: response, status: 200
  end

  def create
    check_if_user_owns_person(request, params[:person_id])
    coach = Coach.new(coach_params.merge(status: "pending"))
    if (coach.save)
      render json: generate_coach_response(coach), status: 201
    else
      render json: {errors: coach.errors}, response: 422
    end
  end

  def update
    # byebug
    check_if_user_owns_person(request, params[:id])
    person = Person.find(params[:id])
    coach = person.coaches.find(params[:coach_id])
    if (coach.update(coach_params))
      render json: generate_coach_response(coach), status: 200
    else
      render json: {errors: coach.errors}, response: 422
    end
  end

  private
  def coach_params
    params.require(:coach).permit(:team_id, :person_id)
  end

  def generate_coach_response(coach)
    { **coach.attributes.except("person_id", "team_id"), team: coach.team, person: coach.person }
  end
end
