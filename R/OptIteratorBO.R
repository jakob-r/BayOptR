# Optimization Iterator

# The optimization iterator should not store any temporary function
# It is supposed to contain all the logic that is necessary for one iteration step
OptIteratorBO = R6Class(
  "OptIteratorBO",

  inherit = OptIterator,

  public = list(
    # public member

    # constructor
    initialize = function() {
      super$initialize()
    },

    # returns OptState
    step = function(opt_state) {
      new_point = opt_state$acq_optimizer(opt_state$acq_function)
      y = opt_state$opt_problem$target_fun(new_point)
      opt_state$surrogate_model$add(data.frame(x = new_point, y = y))
    }


  )
)
