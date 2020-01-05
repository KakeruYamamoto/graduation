class Labeling < ApplicationRecord
  belongs_to :event, optional: true
  belongs_to :label, optional: true
end
