# Acquisition Function
AcqFunction = R6Class(
  "AcqFunction",

  public = list(
    # public members
    id = character(1L),
    name = character(1L),
    parameters = list(),
    requirements = character(),
    opt_direction = character(1L), #should the acq fun be maximized or minimized or objective if the direction is the same as the direction of the objective function
    surrogate_model = NULL,
    search_space = NULL,

    # constructor
    initialize = function(id, name, requirements, opt_direction, parameters) {
      self$id = assert_string(id)
      self$name = assert_string(name)
      self$requirements = assert_character(requirements)
      self$opt_direction = assert_choice(opt_direction, c("minimize", "maximize", "objective"))
      self$parameters = parameters
    },

    # public methods

    # prepare the AcquisitionFunction for the actual optimization stage, called probably in each step
    prepare = function(opt_state) {
      self$surrogate_model = opt_state$surrogate_model
      self$search_space = opt_state$opt_problem$target_fun$search_space
    },


    # points - data.table with one column x
    # returns: data.table with one column acq + attribute columns (e.g. mean, se etc.)
    evaluate = function(points) {
      stop("not implemented")
    },

    # see evaluate
    # res - converted to min problem
    evaluate_as_minimization = function(points) {
      res = self$evaluate(points)
      res$acq = self$mult_max_to_min * res$acq
      return(res)
    }
  ),

  # active bindings
  active = list(
    # multiplier to invert maximization to minimization
    mult_max_to_min = function() if (self$opt_direction == "minimize") 1 else -1
  )
)
