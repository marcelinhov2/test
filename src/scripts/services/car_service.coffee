class Car extends Service
  constructor: (
    @cars
    @localStorageService
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

  create: (data) =>
    data.id = do _.uniqueId

    @cars.push data
    @localStorageService.set('cars', @cars)

  read: (id) =>
    return _.find(@cars, {id: id})

  update: (data) =>
    car = _.find(@cars, {id: data.id})
    car = _.merge(car, data)

    @localStorageService.set('cars', @cars)

  delete: (ids) =>
    i = 0

    while i < ids.length
      @cars = _.reject(@cars, {id: ids[i]})
      i++

    do @update