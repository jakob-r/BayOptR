# Acquisition Function
AcqFunction = R6Class(
  "AcqFunction",

  public = list(
    # public members
    id = character(1L),
    name = character(1L),
    requirements = character(),
    opt_direction = character(1L), #should the acq fun be maximized or minimized or objective if the direction is the same as the direction of the objective function

    # constructor
    initialize = function(id, name, requirements, opt_direction) {
      self$id = assert_string(id)
      self$character = assert_string(name)
      self$requirements = assert_character(requirements)
      self$opt_direction = assert_choice(opt_direction, c("minimize", "maximize", "objective"))
    },

    # public methods

    # prepare the AcquisitionFunction for the actual optimization stage
    prepare = function(opt_state) {
      stop("not implemented")
    },


    # points - data.table with one column x
    # returns: data.table with one column y + attribute columns (e.g. mean, se etc.)
    evaluate = function(points) {
      stop("not implemented")
    },

    # see evaluate
    # res - converted to min problem
    evaluate_as_minimization = function(points) {
      res = self$evaluate(x)
      res$y = self$mult_max_to_min * res$y
      return(res)
    }
  ),

  # active bindings
  active = list(
    # multiplier to invert maximization to minimization
    mult_max_to_min = function() if (self$opt_direction == "minimize") 1 else -1
  )
)
