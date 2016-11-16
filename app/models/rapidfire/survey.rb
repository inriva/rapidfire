module Rapidfire
  class Survey < ActiveRecord::Base
    has_many  :questions
    belongs_to :job
    validates :name, :presence => true

    if Rails::VERSION::MAJOR == 3
      attr_accessible :name
    end
  end
end
