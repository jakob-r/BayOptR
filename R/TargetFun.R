# Target Function
TargetFun = R6Class(
  "TargetFun",

  public = list(
    # public member
    fun = NULL,
    minimize = logical(1),
    search_space = NULL,

    # constructor
    initialize = function(fun, search_space, minimize = TRUE) {
      self$fun = assert_function(fun)
      self$search_space = assert_R6(search_space, "ParamSet")
      self$minimize = assert_flag(minimize)
    }

    # points = data.table with column x
    # returns: numeric(nrow(points))
    eval = function(points) {
      fun(points$x)
    }

    eval_as_minimization(points) {
      if (minimize) {
        eval(points)
      } else {
        -1 * eval(points)
      }

    }
  )
)
