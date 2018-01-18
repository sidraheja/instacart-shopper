class Applicant < ActiveRecord::Base
	WORKFLOW_STATES_ARRAY = [
    "applied",
    "quiz_started",
    "quiz_completed",
    "onboarding_requested",
    "onboarding_completed",
    "hired"
  ].freeze
end