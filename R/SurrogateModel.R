# Optimization Surrogate Model

# *points - data.table with column x and y (always!)
#

SurrogateModel = R6Class(
  "SurrogateModel",

  public = list(
    # public member
    storage = list(),
    search_space = NULL,

    # constructor
    initialize = function(points) {

    },

    # public methods
    # add points (x,y) to the surrogate
    add = function(points) {

    },

    # remove points from the surrogate (optional)
    remove = function(points) {

    },

    # replace old_points by new_points (optional)
    update = function(old_points, new_points) {

    },

    # obtain mean response (and optional se)
    # returns data.table with columns mean (+se)
    predict = function(points) {

    },

    # returns data.table with columns mean (+se) for choosen resolution within a grid of the search_space
    surface = function(resolution) {

    }

  ))
