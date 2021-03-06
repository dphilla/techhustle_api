require 'net/http'

class SessionsController < ApplicationController


  def create
    code = params["code"]
    uri = URI("https://www.linkedin.com/oauth/v2/accessToken?grant_type=authorization_code&code=#{code}&client_id=#{ENV["LINKEDIN_CLIENT_ID"]}&client_secret=#{ENV["LINKEDIN_CLIENT_SECRET"]}&redirect_uri=https://powerful-stream-11261.herokuapp.com/auth/linkedin/callback")
    resp = Net::HTTP.post_form(uri, {})
    parsed_resp = JSON.parse(resp.body)

    access_token = parsed_resp["access_token"]
    user_info_uri = URI("api.linkedin.com")
    linked_user_info = Net::HTTP.get(URI("https://api.linkedin.com/v1/people/~:(id,summary,positions,picture-url)?format=json&oauth2_access_token=#{access_token}")) #this request will need to be done from front end service with access token
    parsed = JSON.parse(linked_user_info)

    current_user = User.login_from_linked_in(parsed)
    CurrentUser.set_current_user(current_user.id)
  end

  def destroy
    current_user_id = User.find(params["id"]).id
    user = CurrentUser.find_by(current_user: current_user_id)
    user.destroy
  end

end
