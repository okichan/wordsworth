class Question < ApplicationRecord
  belongs_to :user
  has_many :answers
  validates :title, presence: true
  validates :text, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 1 }

   LANG_OPTIONS = [ "Arabic", 
   "Cantonese", 
   "Danish", 
   "Dutch", 
   "English", 
   "French", 
   "German", 
   "Greek", 
   "Hindi", 
   "Indonesian", 
   "Italian", 
   "Japanese", 
   "Korean", 
   "Mandarin", 
   "Norwegian", 
   "Polish", 
   "Portuguese", 
   "Russian", 
   "Spanish", 
   "Swedish", 
   "Thai", 
   "Turkish", 
   "Vietnamese"]
  
  
  
end
