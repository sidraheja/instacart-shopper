class DateManage

  def initialize(start_date, end_date)
    @start_date = start_date
    @end_date = end_date
  end

  def manage
    starting = @start_date.beginning_of_week
    ending = @end_date.end_of_week
    (starting..ending).step(7).each_with_object([]) do |date, array|
      array << [date.beginning_of_week, date.end_of_week]
    end
  end
end