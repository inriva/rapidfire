module Rapidfire
  class Attempt < ActiveRecord::Base
    belongs_to :survey
    belongs_to :user, polymorphic: true
    belongs_to :apply
    has_many   :answers, inverse_of: :attempt, autosave: true

    if Rails::VERSION::MAJOR == 3
      attr_accessible :survey, :user, :apply
    end
  end
end
