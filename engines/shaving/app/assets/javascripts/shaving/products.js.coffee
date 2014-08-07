# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

parse_data = (rawJson) ->
  if rawJson? and rawJson.reviews?
    data = {
      overall: []
      face: []
      shave: []
    }
    rawJson.reviews.forEach (e, i) ->
      data.overall.push { x: e.updated_at, y: e.overall_rating }
      data.face.push { x: e.updated_at, y: e.face_feel }
      data.shave.push { x: e.updated_at, y: e.shaving_feel }

    ratings_chart data


ratings_chart = (data) ->
  series_rickshaw = [
    {
      name: "Overall Rating"
      color: 'Gold'
      data: data.overall
    }
    {
      name: "Face Feel Rating"
      color: 'Blue'
      data: data.face
    }
    {
      name: "Shaving Feel Rating"
      color: 'Red'
      data: data.shave
    }
  ]

  graph = new Rickshaw.Graph
    series: series_rickshaw
    renderer: 'scatterplot'
    height: 250
    element: document.querySelector("#ratings-chart")

  xAxis = new Rickshaw.Graph.Axis.Time
    graph: graph

  yAxis = new Rickshaw.Graph.Axis.Y
    graph: graph
    orientation: 'left'
    element: document.querySelector("#ratings-yaxis")

  graph.render()
  xAxis.render()
  yAxis.render()

  hover = new Rickshaw.Graph.HoverDetail
    graph: graph

  legend = new Rickshaw.Graph.Legend
    graph: graph
    element: document.querySelector("#ratings-legend")

  shelving = new Rickshaw.Graph.Behavior.Series.Toggle
    graph: graph
    legend: legend


window['products#show'] = (data) ->
  $ ->
    $.getJSON window.location.href, parse_data
