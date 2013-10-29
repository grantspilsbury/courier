class ChargifyController < ApplicationController
  before_filter :get_user, :only => [:endpoints]

  def endpoints
    event = params[:event]
    state = params[:payload][:subscription][:state]
    chargify_subscription_id = params[:payload][:subscription][:id].to_i

      case event
        when 'subscription_state_change'
          case state
            when 'canceled'
                  @user.subscription.update_attributes(:status, 'canceled')
            when 'active'
                  @user.subscription.update_attributes(:status, 'active')
            else
              puts params[:event]
            end
        when 'signup_success'
            @user.create_subscription!(:status, 'active', chargify_subscription_id: chargify_subscription_id)
        else
          puts params[:event]
      end
    render :text => "", :status => 200
  end

  private

      def get_user
        @user = User.find_by_obfuscated_id(params[:payload][:subscription][:customer][:reference])
      end

end