# Acquistion Function Optimizer
AcqOptimizer = R6Class(
  "AcqOptimizer",

  public = list(
    # public member
    id = character(1L),
    optimizer_storage = list(),
    search_space = NULL,

    # constructor
    initialize = function() {

    },

    # public methods
    # optimizes the acq_function
    # returns point list(x = )
    optim = function(acq_function) {

    }
  )
)
