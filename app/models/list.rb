class List < ApplicationRecord

  has_many :tasks, dependent: :destroy
  belongs_to :user
  validates :name, presence: true,
  length: { minimum: 5 },
  format: { with: /\A[a-zA-Z0-9 ]+\z/,
  message: "Please, just letters and numbers are allowed"}

  def self.to_csv(fields = column_names)
     CSV.generate(headers: true) do |csv|
       csv << fields
       all.each do |list|
         csv << list.attributes.values_at(*fields)
       end
     end
   end


end
