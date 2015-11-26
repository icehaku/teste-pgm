class Post < ActiveRecord::Base
	belongs_to :user

	validates_length_of :content, maximum: 500, message: "nao pode ser maior que 500 caracteres."
	validates_presence_of :content, message: "nao pode ser vazia."
	validate :user_present?

	def user_present?
		if user_id.present? or nome.present?
			return true
		else
			errors[:nome] << "nao pode ser vazio ou Logue-se!"
			return false
		end
	end

	def guest?
		if user_id.present?
			return false
		else
			return true
		end
	end

	def autor
		if self.guest?
			return nome
		else
			return User.find(user_id).nome
		end
	end
end
