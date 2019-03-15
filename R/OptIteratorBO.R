# Optimization Iterator

# The optimization iterator should not store any temporary function
# It is supposed to contain all the logic that is necessary for one iteration step
OptIteratorBO = R6Class(
  "OptIteratorBO",

  inherit = OptIterator,

  public = list(
    # public member

    # constructor

    # returns OptState
    step = function(opt_state) {
      opt_state$acq_function$prepare(opt_state)
      new_point = opt_state$acq_optimizer$optim(opt_state$acq_function)
      y = opt_state$opt_problem$target_fun$eval(data.table(x = list(new_point)))
      opt_state$surrogate_model$add(data.table(x = list(new_point), y = y))
    }


  )
)
