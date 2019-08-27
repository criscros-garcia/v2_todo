class List < ApplicationRecord

  has_many :tasks, dependent: :destroy
  belongs_to :user
  validates :name, presence: true, length: { minimum: 5 }

  def self.to_csv(fields = column_names)
     CSV.generate(headers: true) do |csv|
       csv << fields
       all.each do |list|
         csv << list.attributes.values_at(*fields)
       end
     end
   end


end
