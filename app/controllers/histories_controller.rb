class HistoriesController < ApplicationController

	def update
	    history = History.find(params[:id])
	    history.update(collect_status: params[:collect_status])
	  	play = Play.find(params[:play_id])
	  	collects = play.histories.where(collect_status: "collected")
	  	score = collects.count*2
	  	play.update(score: score)
	  	redirect_back(fallback_location: root_path)
	end
end
