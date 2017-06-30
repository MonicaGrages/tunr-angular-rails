class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  # We could use JSON web tokens here too, which is a popular option
  protect_from_forgery unless: -> { request.format.json? }
end
