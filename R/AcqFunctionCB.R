AcqFunctionCB = R6Class(
  "AcqFunctionCB",
  inherit = AcqFunction,
  public = list(
    # public members

    # constructor
    initialize = function(lambda = 2) {
      parameters = list(lambda = assert_number(lambda, lower = 0))
      super$initialize(id = "CB", name = "Confidence Bound", requirements = "se", opt_direction = "objective", parameters = parameters)
    },

    # public methods
    prepare = function(opt_state) {
      self$opt_direction = ifelse(opt_state$opt_problem$target_fun$minimize, "minimize", "maximize")
      super$prepare(opt_state)
    },

    evaluate = function(points) {
      p = self$surrogate_model$predict(points)
      res = p$mean + self$mult_max_to_min * self$parameters$lambda * p$se
      data.table(acq = res, se = p$se, mean = p$mean, lambda = self$parameters$lambda)
    }
  )
)
