ProposalGeneratorMultiCL = R6Class(
  "ProposalGeneratorMultiCL",
  inherit = ProposalGenerator,
  
  public = list(
    # public member
    
    # constructor
    initialize = function(acq_function, acq_optimizer, n = 1, lie = "min") {
      super$initialize(acq_function = acq_function, acq_optimizer = acq_optimizer)
      self$parameters$lie = assert_choice(lie, c("min", "max", "mean"))
      self$parameters$n = n
    },
    
    # public methods
    # value: data.table with column x (plus additional stuff in additional columns?)
    generate = function(opt_state) {
      this_opt_state = opt_state$clone(deep = TRUE) # FIXME This is probably not very fast, because we copy a (potentially big) surrogate model which we probably wont use. But this depends on the surrogate and should be handled there I guess.
      lie_fun = get(self$parameters$lie, mode = "function")
      proposals = vector("list", self$parameters$n)
      for (i in seq_len(self$parameters$n)) {
        self$acq_function$prepare(this_opt_state)
        prop = self$acq_optimizer$optim(self$acq_function)
        proposals[[i]] = prop
        prop$y = lie_fun(this_opt_state$surrogate_model$design$y)
        this_opt_state$surrogate_model$add(prop)
      }
      rbindlist(proposals)
    }
  )
  
)