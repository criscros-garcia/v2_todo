class Task < ApplicationRecord
  belongs_to :list

  validates :description, presence: true, format: { with: /\A[a-zA-Z0-9 ]+\z/, message: "Please, just letters and numbers are allowed" }, length: { minimum: 5 }

  def self.to_csv(fields = column_names)
     CSV.generate(headers: true) do |csv|
       csv << fields
       all.each do |task|
         csv << task.attributes.values_at(*fields)
       end
     end
   end
end
