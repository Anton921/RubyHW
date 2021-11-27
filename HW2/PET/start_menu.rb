# В цьому файлі організоване початкове меню.
require_relative"dog_or_cat"
include Dog_or_Cat

module Start
  def start_end
    z = 1
    while z != 2
      puts('Грати(1)')
      puts('Вийти(2)')
      z1 = gets.chop

      if z1 == '1'
        play
      elsif z1 == '2'
        z = 2
      else
        puts('Ви ввели неправельний символ, спробуйте ще')
      end
    end
  end
end
