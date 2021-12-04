# frozen_string_literal: true

# В цьому файлі реалізований батьківський клас Pet та два дочірні класи Dog, Cat.

require 'hw3gem'
include Hw3Gem


class Pet

  # ініціалізую змінні
  def initialize(name)
    @meat = 0
    @bonne = 0
    @dry_food = 0
    @ball = 0
    @branch = 0
    @fish = 0
    @name = name
    @hangry = 10
    @sleep = 60
    @happy = 10
    @hp = 1
    @walk = 50
    @toys = 40
    puts("Ви купили нову тваринку #{@name}")
  end

  # Реалізую метод для годування м'ясом
  def feed_meat
    if @meat < 3
      @meat += 1
      @bonne = 0
      @dry_food = 0
      @fish = 0
      @hangry = 10
      @happy = 10
      pass_time(0, 1, 0, 1, 0)
      check_all
    else
      p 'Я звик, дай щось інше'
    end
  end

  # Реалізую метод для годування сухим кормом
  def feed_dry_food
    if @dry_food < 3
      @dry_food += 1
      @meat = 0
      @bonne = 0
      @fish = 0
      @hangry = 10
      @happy = 10
      pass_time(0, 1, 0, 1, 0)
      check_all
    else
      p 'Я звик, дай щось інше'
    end
  end

  # Реалізую метод для того щоб покласти спати
  def sleep
    @sleep = 60
    @happy = 10
    pass_time(2, 0, 0, 2, 0)
    check_all
  end

  # Реалізую метод для того щоб погратися м'ячиком
  def play_ball
    if @ball < 3
      @ball += 1
      @happy = 10
      @branch = 0
      pass_time(1, 1, 0, 1, 1)
      check_all
    else
      p 'Я звик, давай гратись якось інакше'
    end
  end

  # Реалізую метод для того щоб погратися паличкою
  def play_branch
    if @branch < 3
      @branch += 1
      @happy = 10
      @ball = 0
      pass_time(1, 1, 0, 1, 1)
      check_all
    else
      p 'Я звик, давай гратись якось інакше'
    end
  end

  # Реалізую метод для того щоб погладити
  def pet
    @happy = 10
    pass_time(1, 2, 0, 1, 0)
    check_all
  end

  # Реалізую метод для того щоб прогулятися
  def walk
    @walk = 50
    @happy = 10
    pass_time(1, 1, 0, 0, 0)
    check_all
  end

  # Реалізую метод для того щоб прогулятися до клубу з тваринами
  def walk_to_club
    @walk = 50
    @happy = 10
    pass_time(2, 2, 0, 0, 0)
    check_all
  end

  # Реалізую метод для того щоб купити нову іграшку
  def new_toy
    @toys = 40
    @happy = 10
    @branch = 0
    @ball = 0
    pass_time(1, 1, 0, 1, 1)
    check_all
  end

  # Реалізую метод для того щоб пропустити час
  def pass
    pass_time(1, 1, 1, 1, 1)
    check_all
  end

  # Реалізую метод для того щоб перевірити всі показники тварини
  def check_all
    chek_hangry
    chek_sleep
    chek_toy
    chek_happy
    chek_walk
  end

  # Реалізую метод для того щоб вивести показники
  def all_info
    puts 'Ситість: ' + @hangry.to_s
    puts 'Не хочу спати: ' + (@sleep / 6).to_s
    puts 'Щастя: ' + @happy.to_s
    puts 'Не хочу гуляти: ' + (@walk / 5).to_s
    puts 'Стан іграшок: ' + (@toys/4).to_s
  end

  def getinfo
    info ='Життя: ' + @hp.to_s +  ' Ситість: ' + @hangry.to_s + ' Не хочу спати: ' + @sleep.to_s + ' Щастя: ' + @happy.to_s + ' Не хочу гуляти: ' + @walk.to_s + ' Стан іграшок: ' + @toys.to_s
    return info
  end

  def sum_of_stats
    sum = @hangry + @sleep  + @happy + @walk + @toys
    return sum
  end

  def hp
    return @hp
  end

  # Реалізую метод для того щоб імітувати проходження часу, причому залежно від методу що викликається віднімаються певні параметри

  private

  def pass_time(hangry, sleep, happy, walk, toys)
    @hangry -= hangry
    @sleep -= sleep
    @happy -= happy
    @walk -= walk
    @toys -= toys
  end

  # Реалізую метод закінчення гри
  def minus_hp
    if @hp <= 0
      info ='Життя: ' + @hp.to_s +  ' Ситість: ' + @hangry.to_s + ' Не хочу спати: ' + @sleep.to_s + ' Щастя: ' + @happy.to_s + ' Не хочу гуляти: ' + @walk.to_s + ' Стан іграшок: ' + @toys.to_s
      sum = @hangry + @sleep  + @happy + @walk + @toys
      hp = @hp
      makeHTML(sum, hp, info)
      puts('Ось і втратили ви свого друга, через недбальсво. Сором вам.')
      exit
    end
  end

  # Наступні методи створені для перевірки показників життя
  def chek_hangry
    if @hangry <= 0
      puts("#{@name} Помер від голоду")
      @hp -= 1
      minus_hp
    elsif @hangry < 10
      puts('Я голодний')
    end
  end

  def chek_sleep
    if @sleep <= 0
      puts("#{@name} Заснув назавжди")
      @hp -= 1
      minus_hp
    elsif @sleep < 44
      puts('Я сонний')
    end
  end

  def chek_happy
    if @happy <= 0
      puts("#{@name} Ви його лякали. Втік до кращього господаря ніж ви")
      @hp -= 1
      minus_hp
    elsif @happy < 10
      puts('Я сумний')
    end
  end

  def chek_walk
    if @walk <= 0
      puts("#{@name} Пішов гуляти без вас, і вже не повернеться")
      @hp -= 1
      minus_hp
    elsif @walk < 45
      puts('Я хочу гуляти')
    end
  end

  def chek_toy
    if @toys <= 0
      puts("#{@name} Тепер я буду злитись")
      @happy -= 2
    elsif @toys < 36
      puts('Я хочу нову іграшку')
    end
  end
end

class Dog < Pet
  # Реалізую метод для того щоб погодувати кісточкою
  def feed_bonne
    if @bonne < 3
      @bonne += 1
      @meat = 0
      @dry_food = 0
      @hangry = 10
      @happy = 10
      pass_time(0, 1, 0, 1, 0)
      check_all
    else
      p 'Я звик, дай щось інше'
    end
  end

  # Реалізую метод help якбуло вказано в завданні
  def help
    p 'Ви можете погудувати тваринку м\'ясом за допомого методу feed_meat'
    p 'Ви можете погудувати тваринку сухим кормом за допомого методу feed_dry_food'
    p 'Ви можете кісточкою за допомого методу feed_bonne'
    p 'Ви можете поклати тваринку спати за допомого методу sleep'
    p 'Ви можете погратися з тваринкою м\'ячиком за допомого методу play_ball'
    p 'Ви можете погратися з тваринкою паличкою за допомого методу play_branch'
    p 'Ви можете погладити за допомого методу pet'
    p 'Ви можете прогулятися за допомого методу walk'
    p 'Ви можете прогулятися то клубу з тваринами за допомого методу walk_to_club'
    p 'Ви можете купити нову іграшку за допомого методу new_toy'
    p 'Ви можете пропустити годину за допомого методу do'
  end
  # Аналогічно до батьківського класу це метод для прходженя часу

  private

  def pass_time(hangry, sleep, happy, walk, toys)
    @hangry -= hangry
    @sleep -= sleep
    @happy -= happy
    @walk -= walk
    @toys -= toys
  end
end

class Cat < Pet
  # Реалізую метод для того щоб погодувати рибою
  def feed_fish
    if @bonne < 3
      @bonne += 1
      @meat = 0
      @dry_food = 0
      @hangry = 10
      @happy = 10
      pass_time(0, 1, 0, 1, 0)
      check_all
    else
      p 'Я звик, дай щось інше'
    end
  end

  # Реалізую метод help якбуло вказано в завданні
  def help
    p 'Ви можете погудувати тваринку м\'ясом за допомого методу feed_meat'
    p 'Ви можете погудувати тваринку сухим кормом за допомого методу feed_dry_food'
    p 'Ви можете погудувати рибкою за допомого методу feed_fish'
    p 'Ви можете поклати тваринку спати за допомого методу sleep'
    p 'Ви можете погратися з тваринкою м\'ячиком за допомого методу play_ball'
    p 'Ви можете погратися з тваринкою паличкою с мотузкою за допомого методу play_branch'
    p 'Ви можете погладити за допомого методу pet'
    p 'Ви можете прогулятися за допомого методу walk'
    p 'Ви можете прогулятися то клубу з тваринами за допомого методу walk_to_club'
    p 'Ви можете купити нову іграшку за допомого методу new_toy'
    p 'Ви можете пропустити годину за допомого методу do'
  end
  # Аналогічно до батьківського класу це метод для прходженя часу

  private

  def pass_time(hangry, sleep, happy, walk, toys)
    @hangry -= hangry
    @sleep -= sleep
    @happy -= happy
    @walk -= walk
    @toys -= toys
  end
end
