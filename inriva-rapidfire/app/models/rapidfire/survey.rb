module Rapidfire
  class Survey < ActiveRecord::Base
    has_many  :questions
    has_many :jobs
    validates :name, :presence => true

    if Rails::VERSION::MAJOR == 3
      attr_accessible :name, :weight
    end
  end
end
