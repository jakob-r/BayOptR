# Acquistion Function Optimizer
AcqOptimizer = R6Class(
  "AcqOptimizer",

  public = list(
    # public member
    id = character(1L),
    parameters = list(),
    storage = list(),
    capabilities = character(),
    packages = character(),

    # constructor
    initialize = function(id, parameters, capabilities, packages) {
      self$id = id
      self$parameters = parameters
      self$capabilities = capabilities
      self$packages = packages
    },

    # public methods

    # prepare
    prepare = function(opt_state) {

    },

    # optimizes the acq_function
    # returns one point as list eg list(x1 = 0, x2 = 1), or list(x = 1)
    optim = function(acq_function) {

    }
  )
)
