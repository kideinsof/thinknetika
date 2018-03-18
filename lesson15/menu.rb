class Menu
  def initialize
    @stations = {}
    @routes = {}
    @trains = {}
  end

  def menu_main
    loop do
      puts 'Выберите тип операций:',
           '1. Создание станций',
           '2. Создание маршрутов и управление станциями в нем',
           '3. Создание поездов',
           '4. Управление движением',
           '5. Выходим нахрен из этого симулятора'
      case gets.strip.to_i
      when 1 then return menu_station
      when 2 then return menu_route
      when 3 then return menu_train
      when 4 then return menu_motion
      when 5
        puts 'Пока!!'
        return
      else
        puts 'Cделайте корректный выбор'
      end
    end
  end

  private

  def menu_station
    loop do
      puts 'Создание станций:',
           '1. Создать станцию',
           '2. Удалить станцию',
           '3. Вывести список доступных станций',
           '4. Вернуться в основное меню'
      case gets.strip.to_i
      when 1 then return station_create
      when 2 then return station_delete
      when 3 then return station_list
      when 4 then return station_trains
      when 5
        puts 'Возврат в основное меню..'
        return menu_main
      else
        puts 'Cделайте корректный выбор'
      end
    end
  end

  def station_name
    puts 'Введите название станции'
  end

  def station_create
    puts 'Создать станцию:'
    station_name
    name = gets.chomp
    @stations[name] = Station.new(name)
    menu_station
  end

  def station_delete
    puts 'Удалить станцию'
    station_name
    name = gets.chomp
    @stations.delete(name)
    menu_station
  end

  def station_list
    print 'Список доступных станций: '
    @stations.each_key { |station| print "#{station} " }
    puts
    menu_station
  end

  def station_trains
    puts 'Список поездов на станции'
    station_name
    name = gets.chomp
    puts @stations[name].trains
    menu_station
  end

  def menu_route
    loop do
      puts 'Добавить/редактировать маршрут:',
           '1. Выберите начальную и конечную станцию',
           '2. Добавить станцию в маршрут',
           '3. Удалить станцию из маршрута',
           '4. Вернуться в основное меню'
      case gets.strip.to_i
      when 1 then return route_station_terminal
      when 2 then return route_station_add
      when 3 then return route_station_delete
      when 4
        puts 'Возврат в основное меню..'
        return menu_main
      else
        puts 'Cделайте корректный выбор'
      end
    end
  end

  def route_name
    puts 'Введите наименование маршрута'
  end

  def route_station_terminal
    route_name
    name = gets.chomp
    print 'начальная станция:'
    first_station = @stations[gets.chomp]
    print 'конечная станция:'
    last_station = @stations[gets.chomp]
    @routes[name] = Route.new(first_station, last_station)
    menu_route
  end

  def route_station_add
    route_name
    name = gets.chomp
    station_name
    station = gets.chomp
    @routes[name].add_station(@stations[station])
    menu_route
  end

  def route_station_delete
    route_name
    name = gets.chomp
    station_name
    station = gets.chomp
    @routes[name].delete_station(@stations[station])
    menu_route
  end

  def menu_train
    loop do
      puts 'Создание/редактирование поездов',
           '1. Создать поезд',
           '2. Операции с вагонами',
           '3. Назначить маршрут поезду',
           '4. Вернуться в основное меню'
      case gets.strip.to_i
      when 1 then return train_create
      when 2 then return train_wagons
      when 3 then return train_take_route
      when 4
        puts 'Возврат в основное меню..'
        return menu_main
      else
        puts 'Cделайте корректный выбор'
      end
    end
  end

  def train_name
    puts 'Введите номер поезда:'
  end

  def train_create
    train_name
    train_number = gets.chomp
    puts 'Выбрать тип поезда:',
         '1. Грузовой',
         '2. Пассажирский'
    case gets.strip.to_i
    when 1 then @trains[train_number] = CargoTrain.new('train_number' => train_number)
    when 2 then @trains[train_number] = PassengerTrain.new('train_number' => train_number)
    end
    menu_train
  end

  def train_wagons
    train_name
    train_number = gets.chomp
    case @trains[train_number].train_type
    when 'train_cargo' then wagon_type = 'wagon_cargo'
    when 'train_passenger' then wagon_type = 'wagon_passenger'
    end
    puts 'Что сделать с вагонами?:',
         '1. Прицепить',
         '2. Отцепить'
    case gets.strip.to_i
    when 1 then @trains[train_number].add_wagon(wagon_type)
    when 2 then @trains[train_number].delete_wagon
    end
    menu_train
  end

  def train_take_route
    train_name
    train_number = gets.chomp
    route_name
    name = gets.chomp
    @trains[train_number].take_route(@routes[name])
    menu_train
  end

  def menu_motion
    train_name
    train_number = gets.chomp
    current_train = @trains[train_number]
    loop do
      puts 'Управление движением:',
           '1. Прибавить скорости',
           '2. Вперед',
           '3. Назад',
           '4. Полный стоп',
           '5. Вернуться в основное меню'
      case gets.strip.to_i
      when 1
        print 'Увеличить скорость до, км/ч: '
        current_train.add_speed(gets.strip.to_i)
      when 2
        current_train.move_next_station
      when 3
        current_train.move_previous_station
      when 4
        current_train.stop
        puts "Текущая скорость: #{current_train.speed} км/ч"
      when 5
        return menu_main
      else
        puts 'Cделайте корректный выбор'
      end
    end
  end
end
