class User < ActiveRecord::Base
# Implementa los métodos y validaciones de tu modelo aquí. 
  
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "%{value} is not valid"}
  validates :age, numericality: { :greater_than  => 18}
  #validates :phone_only_numbers, length: { maximun: 10} Incorrecto, ni corre :(
  validate :phone_only_numbers

  def name
    "#{first_name} #{last_name}"
  end

  def age
    t = Time.now 
    t = t.year.to_f
    age = t.to_i - birthday.year
  end

  def phone_only_numbers
    phone_digits = phone.gsub(/[^0-9]/, "")
    if phone_digits.length < 10
      errors.add(:phone, "Tel no puede ser menor de 10 digitos") #errors es un objeto
    end
  end

end#class User
