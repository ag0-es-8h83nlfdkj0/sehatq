module TimeHelper
  TODAY = 'Today'

  def formatted_schedule(schedule)
    from = schedule.from
    to = schedule.until
    day = (from.to_date == Date.current) ? TODAY : from.strftime('%A')
    "#{day} #{from.strftime('%H:%m')} - #{to.strftime('%H:%m')}"
  end
end
