module EventsHelper
  def format_time_field(time)
    time.strftime("%I:%M %p") unless time.blank?
  end

  def print_event_date
    s_date = @event.start_date.strftime("%b %d")
    e_date = @event.end_date.strftime("%b %d")
    s_time = @event.start_time.strftime("%I:%M%p")
    e_time = @event.end_time.strftime("%I:%M%p")

    if @event.start_date == @event.end_date
      return " #{s_date} from #{s_time} to #{e_time}"
    else
      return "#{s_date} - #{s_time} to #{e_date} - #{e_time}"
    end
  end

  def print_attendee_count
    if @event.etype == '0'

    elsif @event.users.count == 0
      return ('<div class="event-extra-card"><p>'+
              '<i class="fa fa-user fa-fw fa-2x pull-left"></i>'+
              'No one registered yet. Be the first to register!'+
              '</p></div>').html_safe
    else
      return ('<div class="event-extra-card"><p>'+
              '<i class="fa fa-user fa-fw fa-2x pull-left"></i>'+
              "#{@event.users.count} people attending"+
              '</p></div>').html_safe
    end
  end

  def print_ticket_details
    if @event.etype == '2'
      return ('<div class="event-extra event-extra-ticket">'+
              simple_format(@event.ticket_details)+
              '</div>').html_safe
    end
  end

  def print_fb_link
    if @event.fb_link.present?
      return ('<div class="event-extra-card"><p>'+
              '<a href="'+
              @event.fb_link+
              '"><i class="fa fa-facebook fa-fw fa-2x pull-left"></i>'+
              'Facebook Event</a>'+
              '</p></div>').html_safe
    end
  end

  def print_organizer_desc
    if @event.organizer_desc.present?
      return ('<div class="event-desc">'+
              '<p>Organized by '+
              @event.organizer_title+
              '</p><p>'+
              simple_format(@event.organizer_desc)+
              '</p></div>').html_safe
    end
  end

  def print_organizer_tel
    if @event.telephone_visible
      return ('<div class="event-extra-card"><p>'+
              '<i class="fa fa-phone fa-fw fa-2x pull-left"></i>'+
              'Contact organizer '+
              @event.organizer_tel+
              '</p></div>').html_safe
    end
  end
end
