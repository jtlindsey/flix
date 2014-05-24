class Characterization < ActiveRecord::Base
  belongs_to :movie
  belongs_to :genre
end
