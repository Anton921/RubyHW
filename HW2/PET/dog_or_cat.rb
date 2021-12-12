# frozen_string_literal: true

# В цьому файлі я реалізував вибір користувачем собаки чи кота.
require_relative 'main_menu'

module DogOrCat
  include Menu

  def play
    z2 = 1
    while z2 != 3
      puts('Виберіть тваринку')
      puts('Собачка(1)')
      puts('Котик(2)')
      puts('Вийти(3)')
      z2 = gets.chop

      case z2
      when '1'
        p 'Введіть кличку тваринки'
        name = gets.chop
        z2 = start_dog(name)
      when '2'
        p 'Введіть кличку тваринки'
        name = gets.chop
        z2 = start_cat(name)
      when '3'
        puts('Виходжу')
        z2 = 3
      else
        puts('Ви ввели неправельний символ, спробуйте ще')
      end
    end
  end
end
