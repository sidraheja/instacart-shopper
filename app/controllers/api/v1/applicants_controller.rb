class Api::V1::ApplicantsController < ApplicationController
	def index
		@values = serializer.serialize
		json_response(JSON.pretty_generate(@values))
	end

	private

	def start_date
		@start_date = params[:start_date].try(:to_date)
	end

	def end_date
		@end_date = params[:end_date].try(:to_date)
	end


  def serializer
    @serializer ||= Serializer.new(start_date, end_date)
  end
end