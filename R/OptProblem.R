# Optimization Problem

# The OptProblem is an object that is not allowed to change during optimization
# It contains all information to start the optimization
OptProblem= R6Class(
  "OptProblem",

  public = list(
    # public member
    storage = list(),
    target_fun = NULL,
    design = NULL,
    opt_iterator = NULL,
    opt_terminator = NULL,
    surrogate_model = NULL,
    acq_optimizer = NULL,
    acq_function = NULL,
    hook_fun = NULL,

    # constructor
    initialize = function(target_fun, design, opt_iterator, opt_terminator, surrogate_model, acq_optimizer, acq_function, hook_fun = function(opt_state) NULL) {
      self$target_fun = target_fun
      self$design = design
      self$opt_iterator = opt_iterator
      self$opt_terminator = opt_terminator
      self$surrogate_model = surrogate_model
      self$acq_optimizer = acq_optimizer
      self$acq_function = acq_function
      self$hook_fun = hook_fun
    },

    # public methods
    # returns OptState
    init = function() {
      OptState$new(
        opt_problem = self,
        opt_iterator = self$opt_iterator$clone(),
        opt_terminator = self$opt_terminator$clone(),
        surrogate_model = self$surrogate_model$clone(),
        acq_optimizer = self$acq_optimizer$clone(),
        acq_function = self$acq_function$clone()
      )
    }
  )
)
