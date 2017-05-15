class CoachingController < ApplicationController
  def home
  end

  def answer
      @ma_question = params[:question]
      if params[:question] == "what time is it?"
        @answer = Time.now.to_s
      elsif params[:question] == "I am going to work right now"
        @answer = "... >< ..."
      elsif params[:question] == "?"
        @answer = "It's a stupid question !"
      elsif params[:question] == "I would love to eat some pizza!"
        @answer = "I don't care, get dressed and go to work!"
      end
  end

  def ask

  end

end
