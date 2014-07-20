spin_to = undefined
spin_to = (element) ->
  opts =
    lines: 13
    length: 20
    width: 10
    radius: 5
    corners: 1
    rotate: 0
    direction: 1
    color: "#666"
    speed: 1
    trail: 60
    shadow: false
    hwaccel: false
    zIndex: 2e9

  spinner = new Spinner(opts).spin(element)
  spinner