# frozen_string_literal: true

module EventsHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm' || action_name == 'create'
      confirm_events_path
    elsif action_name == 'edit'
      event_path
    end
  end
end
