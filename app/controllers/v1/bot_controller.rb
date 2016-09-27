class V1::BotController < ApplicationController

  # GET /bot
  def receive
    if params["hub.mode"] === 'subscribe' && params["hub.verify_token"] == VALIDATION_TOKEN
      logger.info "Validating webhook"
      render json: params["hub.challenge"], status: :success
    else
      logger.info "Failed validation. Make sure the validation tokens match."
      render nothing: true, status: :forbidden
    end
  end

end