class Query

  def initialize(starting, ending)
    @start_date = starting
    @end_date = ending
    @date_manage = DateManage.new @start_date, @end_date
  end

  def values
    ActiveRecord::Base.connection.execute sql_statement
  end

  def first_day
    "DATE_TRUNC('week', created_at)::date"
  end

  def last_day
    "(#{first_day} + '6 days'::interval)::date"
  end

  def range
    @date_manage.manage
  end

  def format_date(date)
    date.strftime "%Y-%m-%d"
  end

  def case_statement
    date_array = []
    range.each_with_index do |array, index|
      date_array << %{
        WHEN created_at >= '#{format_date array[0]}'
         AND created_at < '#{format_date array[1] + 1.day}' THEN #{index + 1}
      }
    end
    %{
      CASE
      #{date_array.join(" ")}
      END
    }
  end

  def sql_statement
    %{
      SELECT
        #{first_day} AS monday,
        #{last_day} AS sunday,
        workflow_state,
        COUNT(*) as count,
        #{case_statement}
      FROM Applicants
      WHERE created_at >= '#{format_date @start_date}'
        AND created_at <= '#{format_date @end_date}'
      GROUP BY
        #{first_day},
        #{last_day},
        workflow_state,
        #{case_statement}
      ;
    }
  end
end