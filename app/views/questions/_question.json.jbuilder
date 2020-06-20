json.extract! question, :id, :quest, :answer, :rate, :undisplay_switch, :created_at, :updated_at
json.url question_url(question, format: :json)
