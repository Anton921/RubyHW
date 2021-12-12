# frozen_string_literal: true

# В цьому файлі реалізовано меню в двох виглядах(перший для роботи з собакою, другий для кота).
require_relative 'pet'

module Menu
  def start_dog(name)
    a = Dog.new(name)

    p("Ось всі показники вашого улюбленця #{name}")
    a.all_info

    z = 1
    while z != 3
      p '----------------------------------------------------'
      p 'Дати м\'ясо(1)'
      p 'Дати сухого корму(2)'
      p 'Дати кісточку(3)'
      p 'Покласти спати(4)'
      p 'Вигуляти(5)'
      p 'Прогулятися з іншими домашніми тваринами(6)'
      p 'Погратися м\'ячиком(7)'
      p 'Пгратися з паличкою(8)'
      p 'Погладити(9)'
      p 'Купити нову іграку(10)'
      p 'Пропустити годину(11)'
      p 'Переглянути стан(12)'
      p 'Вийти(13)'
      p 'help(14)'
      p '----------------------------------------------------'

      z1 = gets.chop
      case z1
      when '1'
        a.feed_meat
      when '2'
        a.feed_dry_food
      when '3'
        a.feed_bonne
      when '4'
        a.sleep
      when '5'
        a.walk
      when '6'
        a.walk_to_club
      when '7'
        a.play_ball
      when '8'
        a.play_branch
      when '9'
        a.pet
      when '10'
        a.new_toy
      when '11'
        a.pass
      when '12'
        a.all_info
      when '13'
        puts('Виходжу')
        z = 3
      when '14'
        a.help
      else
        p 'Ви ввели неправельний символ, спробуйте ще'
      end
    end
  end

  def start_cat(name)
    a = Cat.new(name)

    p("Ось всі показники вашого улюбленця #{name}")
    a.all_info

    z = 1
    while z != 3
      p '----------------------------------------------------'
      p 'Дати м\'ясо(1)'
      p 'Дати сухого корму(2)'
      p 'Дати рибку(3)'
      p 'Покласти спати(4)'
      p 'Вигуляти(5)'
      p 'Прогулятися з іншими домашніми тваринами(6)'
      p 'Погратися м\'ячиком(7)'
      p 'Пгратися паличкою з мотузкою(8)'
      p 'Погладити(9)'
      p 'Купити нову іграку(10)'
      p 'Пропустити годину(11)'
      p 'Переглянути стан(12)'
      p 'Вийти(13)'
      p 'help(14)'
      p '----------------------------------------------------'

      z1 = gets.chop
      case z1
      when '1'
        a.feed_meat
      when '2'
        a.feed_dry_food
      when '3'
        a.feed_fish
      when '4'
        a.sleep
      when '5'
        a.walk
      when '6'
        a.walk_to_club
      when '7'
        a.play_ball
      when '8'
        a.play_branch
      when '9'
        a.pet
      when '10'
        a.new_toy
      when '11'
        a.pass
      when '12'
        a.all_info
      when '13'
        puts('Виходжу')
        z = 3
      when '14'
        a.help
      else
        p 'Ви ввели неправельний символ, спробуйте ще'
      end
    end
  end
end
