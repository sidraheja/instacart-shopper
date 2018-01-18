class Serializer
  def initialize(start_date, end_date)
    @applicant_values = Query.new start_date, end_date
  end

  def serialize
    hash = {}
    @applicant_values.values.each do |object|
      monday = object["monday"]
      sunday = object["sunday"]
      key = [monday, sunday].join "-"
      hash[key] = {} if hash[key].nil?
      hash[key][object["workflow_state"]] = object["count"]
    end
    hash
  end
end
