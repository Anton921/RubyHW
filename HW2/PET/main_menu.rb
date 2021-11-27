# В цьому файлі реалізовано меню в двох виглядах(перший для роботи з собакою, другий для кота).
require_relative"pet"
include Pet

module Menu
  def start_dog(n, name)
    a = Dog.new(name)

    p ('Ось всі показники вашого улюбленця ' + name)
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
      if z1 == '1'
        a.feed_meat
      elsif z1 == '2'
        a.feed_dry_food
      elsif z1 == '3'
        a.feed_bonne
      elsif z1 == '4'
        a.sleep
      elsif z1 == '5'
        a.walk
      elsif z1 == '6'
        a.walk_to_club
      elsif z1 == '7'
        a.play_ball
      elsif z1 == '8'
        a.play_branch
      elsif z1 == '9'
        a.pet
      elsif z1 == '10'
        a.new_toy
      elsif z1 == '11'
        a.do
      elsif z1 == '12'
        a.all_info
      elsif z1 == '13'
        puts('Виходжу')
        z = 3
      elsif z1 == '14'
        a.help
      else
        p 'Ви ввели неправельний символ, спробуйте ще'
      end
    end
    return z
  end

  def start_cat(n, name)
    a = Cat.new(name)

    p ('Ось всі показники вашого улюбленця ' + name)
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
      if z1 == '1'
        a.feed_meat
      elsif z1 == '2'
        a.feed_dry_food
      elsif z1 == '3'
        a.feed_fish
      elsif z1 == '4'
        a.sleep
      elsif z1 == '5'
        a.walk
      elsif z1 == '6'
        a.walk_to_club
      elsif z1 == '7'
        a.play_ball
      elsif z1 == '8'
        a.play_branch
      elsif z1 == '9'
        a.pet
      elsif z1 == '10'
        a.new_toy
      elsif z1 == '11'
        a.do
      elsif z1 == '12'
        a.all_info
      elsif z1 == '13'
        puts('Виходжу')
        z = 3
      elsif z1 == '14'
        a.help
      else
        p 'Ви ввели неправельний символ, спробуйте ще'
      end
    end
    return z
  end
end
