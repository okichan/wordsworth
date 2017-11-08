class Question < ApplicationRecord
  belongs_to :user
  has_many :answers
  validates :title, presence: true
  validates :text, presence: true, length: { minimum: 20 }
  validates :user, presence: true
  validate :language

  def language
    if lang_from.empty?
      self.errors[:base] << "'From' can't be blank"
    end
    if lang_to.empty?
      self.errors[:base] << "'To' can't be blank"
    end
  end

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
