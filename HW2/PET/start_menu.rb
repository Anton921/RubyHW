# frozen_string_literal: true

# В цьому файлі організоване початкове меню.
require_relative 'dog_or_cat'

module Start
  include DogOrCat

  def start_end
    z = 1
    while z != 2
      puts('Грати(1)')
      puts('Вийти(2)')
      z1 = gets.chop

      case z1
      when '1'
        play
      when '2'
        z = 2
      else
        puts('Ви ввели неправельний символ, спробуйте ще')
      end
    end
  end
end
