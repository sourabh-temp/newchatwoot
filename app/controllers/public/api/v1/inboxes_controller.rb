class Public::Api::V1::InboxesController < PublicController
  before_action :set_inbox_channel, except: [:update_channelkey, :get_channelKey]
  before_action :set_contact_inbox, except: [:update_channelkey, :get_channelKey]
  before_action :set_conversation, except: [:update_channelkey, :get_channelKey]

  def show
    @inbox_channel = ::Channel::Api.find_by!(identifier: params[:id])
  end

  def update_channelkey
    channel = Inbox.find(params[:inbox_id]).channel
    if channel.update(phone_number: params[:phone_number], account_sid: params[:account_sid], auth_token: params[:auth_token])
      render json: { success: true }
    else
      render json: { success: false, errors: channel.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def get_channelKey
    inbox = Inbox.find_by(id: params[:inbox_id])
    return render json: { error: 'Inbox not found' }, status: :not_found unless inbox

    channel = inbox.channel
    return render json: { error: 'Channel not found' }, status: :not_found unless channel

    render json: {
      phone_number: channel&.phone_number || '',
      account_sid: channel&.account_sid || '',
      auth_token: channel&.auth_token || ''
    }
  end

  private

  def set_inbox_channel
    return if params[:inbox_id].blank?

    @inbox_channel = ::Channel::Api.find_by!(identifier: params[:inbox_id])
  end

  def set_contact_inbox
    return if params[:contact_id].blank?

    @contact_inbox = @inbox_channel.inbox.contact_inboxes.find_by!(source_id: params[:contact_id])
  end

  def set_conversation
    return if params[:conversation_id].blank?

    @conversation = @contact_inbox.contact.conversations.find_by!(display_id: params[:conversation_id])
  end
end
