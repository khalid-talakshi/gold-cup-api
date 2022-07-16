class PeopleController < ApplicationController
  def create
    user_id = decode_token(request)["user_id"]
    person = Person.new(person_params.merge(user_id: user_id, status: "pending"))
    if (person.save)
      render json: person, status: 201
    else
      render json: {errors: person.errors}, response: 422
    end
  end

  private

  def person_params
    params.permit(:first_name, :last_name, :middle_name,:city, :province, :country, :email, :birthday, :gender, :phone_number)
  end

  def decode_token(request)
    begin
      token = request.headers['Authorization'].split(' ').last
      decoded_token = JWT.decode(token, ENV['APP_SECRET'], true, algorithm: 'HS256')
      payload = decoded_token[0]
      payload
    rescue JWT::DecodeError
      puts "Invalid token"
    end
  end
end
