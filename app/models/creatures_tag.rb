class CreaturesTag < ActiveRecord::Base
  belongs_to :creature
  belongs_to :tag
end
