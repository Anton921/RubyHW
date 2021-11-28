# В цьому файлі я реалізував вибір користувачем собаки чи кота.
require_relative 'main_menu'
include Menu

module DogOrCat
  def play
    z2 = 1
    while z2 != 3
      puts('Виберіть тваринку')
      puts('Собачка(1)')
      puts('Котик(2)')
      puts('Вийти(3)')
      z2 = gets.chomp

      if z2 == '1'
        p 'Введіть кличку тваринки'
        name = gets.chomp
        start_dog(1, name)
      elsif z2 == '2'
        p 'Введіть кличку тваринки'
        name = gets.chomp
        start_cat(2, name)
      elsif z2 == '3'
        puts('Виходжу')
        z2 = 3
      else
        puts('Ви ввели неправельний символ, спробуйте ще')
      end
    end
  end
end

# Названия переменных должны быть читабельными. Например, если тебе нужно в переменную сохранить своих пользователей,
# то переменная должна называться не 'u', '@u' - а 'users' или'@users'. Поправь это во всем своем коде
