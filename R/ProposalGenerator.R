ProposalGenerator = R6Class(
  "ProposalGenerator",
  
  public = list(
    # public member
    acq_function = NULL,
    acq_optimizer = NULL,
    storage = list(),
    parameters = list(),
    
    # constructor
    initialize = function(acq_function, acq_optimizer) {
      self$acq_function = acq_function
      self$acq_optimizer = acq_optimizer
    },
    
    # value: data.table with column x (plus additional stuff in additional columns?)
    generate = function(opt_state) {
      stop("Not implemented.")
    }
  )
)