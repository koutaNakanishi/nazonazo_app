class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
	include SessionsHelper#せしょんの実装をコントローラやビューにいっぱい書く必要がある
#それをincludeする:
end
