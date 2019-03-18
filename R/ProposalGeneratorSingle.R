ProposalGeneratorSingle = R6Class(
  "ProposalGeneratorSingle",
  inherit = ProposalGenerator,
  
  public = list(
    # public member
    
    # constructor
    
    # public methods
    # value: data.table with column x (plus additional stuff in additional columns?)
    generate = function(opt_state) {
      self$acq_function$prepare(opt_state)
      self$acq_optimizer$optim(self$acq_function)  
    }
  )
  
)