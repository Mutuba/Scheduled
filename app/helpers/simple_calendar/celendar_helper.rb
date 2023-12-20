module SimpleCalendar
  module CalendarHelper
    def day_calendar(options = {}, &block)
      raise "day_calendar requires a block" unless block

      number_of_days = options.fetch(:number_of_days, 1)
      calendar = SimpleCalendar::DayCalendar.new(self, options)

      yield calendar
    end
  end
end
