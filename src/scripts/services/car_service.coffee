class Car extends Service
  constructor: (
    @cars
    @localStorageService
    @notify
  ) ->
    @cars = @get_all()

    return {
      get_all: @get_all
      create: @create
      read: @read
      update: @update
      delete: @delete
    }

  get_all: =>
    return @localStorageService.get('cars') || @cars

  write: =>
    @localStorageService.set('cars', @cars)
    do @success_message

  create: (data) =>
    data.id = @localStorageService.get('cars_next_id') or do _.uniqueId
    data.id = parseInt(data.id)

    @cars.unshift data

    @localStorageService.set('cars_next_id', data.id + 1)

    do @write

  read: (id) =>
    return _.find(@cars, {id: id})

  update: (data) =>
    car = _.find(@cars, {id: data.id})
    car = _.merge(car, data)

    do @write

  delete: (ids) =>
    i = 0

    while i < ids.length
      @cars = _.reject(@cars, {id: ids[i]})
      i++

    do @write

  success_message: =>
    @notify({
      message: "Dados atualizados com sucesso!"
      duration: 3000  
    });