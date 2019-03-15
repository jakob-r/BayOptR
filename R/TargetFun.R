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
      self$search_space = assert_r6(search_space, "ParamSet")
      self$minimize = assert_flag(minimize)
    },

    # points = data.table with column x
    # returns: numeric(nrow(points))
    eval = function(points) {
      vapply(points$x, function(x) do.call(fun, x), numeric(1))
    },

    eval_as_minimization = function(points) {
      if (minimize) {
        eval(points)
      } else {
        -1 * eval(points)
      }

    }
  )
)
