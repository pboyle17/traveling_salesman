
  @trial = []
  puts 'how many simulations do you want to run?'
  @sims = gets
  @sims = @sims.chomp.to_i

  def run
    @cities = [[1, 2], [3, 4], [8, 7], [10, 12], [2, 4]]
    @salesman = [0,0]
    @totalDistance = 0
    @path = []
    @totalRoute = []

    def distance(*arrs)
      d=0.0
      arrs.each do |arr|
        d+=((arr[1][0] - arr[0][0])**2.0 + (arr[1][1]-arr[0][1])**2.0)**0.5
      end
      return d
    end

    def routes(arr,origin)
      possible = []
      arr.each do |x|
        possible << [origin,x.to_a]
      end
       routeTaken = possible.sample
       @totalRoute << routeTaken
       @salesman = routeTaken[1]
       @path << @salesman
       @cities.delete(routeTaken[1])
       @totalDistance += distance(routeTaken)
    end

    for y in 0..@cities.length-1
      routes(@cities,@salesman)
    end
    @cities << [0,0]
    routes(@cities,@salesman)

    p @totalRoute
    if @trial.include? @totalDistance
    else
      @trial << @totalDistance
    end
  end

  for x in 0..@sims
    run
  end

  p @trial.min.round(2)
