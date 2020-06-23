class PlaysController < ApplicationController

  def result
    @play = Play.find(params[:id])
  end

  def quests
  	play = Play.find(params[:id])
  	@quests = play.histories.page(params[:page])
    @answers = History.where(play_id: play.id)
  end

  def index
  	@plays = Play.all
  end

  def show
  	@play = Play.find(params[:id])
  end

  def detail
  	@history = History.find(params[:history_id])
  end

  def create
    play = Play.new(score: params[:score])
    play.save

    # デフォルトで登録する質問
    default_questions = Question.where(id: [1,2,3,4,5])
    default_questions.each do |default_question|
      history = History.new(quest: default_question.quest, answer: default_question.answer, play_id: play.id, collect_status: "before_collect")
      history.save
    end

    # ランダムで登録する質問
    questions = Question.where.not(id: [1,2,3,4,5])
  	questions = questions.order("RANDOM()").limit(45)
  	questions.each do |question|
  		history = History.new(quest: question.quest, answer: question.answer, play_id: play.id, collect_status: "before_collect")
  		history.save
  	end
  	redirect_to quests_plays_path(play)
  end

end
