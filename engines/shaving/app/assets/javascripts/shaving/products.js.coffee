# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#= require d3
#= require nvd3
#= require moment

parse_data = (rawJson) ->
  if rawJson? and rawJson.reviews?
    data = {
      overall: []
      face: []
      shave: []
    }

    rawJson.reviews.forEach (e, i) ->
      data.overall.push { x: e.updated_at, y: e.overall_rating }
      data.face.push    { x: e.updated_at, y: e.face_feel }
      data.shave.push   { x: e.updated_at, y: e.shaving_feel }

    ratings_chart data


ratings_chart = (data) ->
  series = [
    {
      key: "Overall"
      values: data.overall
    }
    {
      key: "Face Feel"
      values: data.face
    }
    {
      key: "Shaving Feel"
      values: data.shave
    }
  ]

  nv.addGraph ->
    chart = nv.models.lineChart()
      .useInteractiveGuideline true
      .transitionDuration 350
      .showLegend true
      .showYAxis true
      .showXAxis true

    chart.xAxis.tickFormat (d) ->
      d3.time.format('%x')(moment.unix(d).toDate())

    chart.yAxis.tickFormat d3.format 'd'

    d3.select '#nvd3-chart svg'
      .datum series
      .call chart

    nv.utils.windowResize chart.update

    chart


$ ->
  $.getJSON window.location.href, parse_data
