class PlaysController < ApplicationController

  def quests
  	play = Play.find(params[:id])
  	@quests = play.histories
  end

  def index
  	@plays = Play.all
  end

  def show
  	@play = Play.find(params[:id])
  end

  def create
    @play = Play.new(score: params[:score])
    @play.save
  	@questions = Question.order("RANDOM()").limit(50)
  	@questions.each do |question|
  		@history = History.new(quest: question.quest, answer: question.answer, play_id: @play.id)
  		@history.save
  	end
  	redirect_to quests_plays_path(@play)
  end

  def update
  	play = Play.find(params[:id])
  	collects = play.histories.where(collect_status: "collect")
  	score = collects.count
  	play.update(score: score)
  	redirect_to quests_plays_path
  end
end
