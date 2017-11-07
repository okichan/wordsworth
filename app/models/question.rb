class Question < ApplicationRecord
  belongs_to :user
  has_many :answers
  validates :title, presence: true
  validates :text, presence: true
  validates :user, presence: true
  validates :lang_from, presence: true
  validates :lang_to, presence: true
  # validates :price, numericality: { greater_than_or_equal_to: 1 }

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
  
   def self.search(search) #ここでのself.はUser.を意味する
    if search
      where(['lang_from LIKE ?', "%#{search}%"]) #検索とnameの部分一致を表示。User.は省略
    else
      all #全て表示。User.は省略
    end
  end
  
end
