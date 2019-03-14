BayOptR
================
Jakob Richter

Just a skeletton\!

![Dancing Skeletton](https://i.imgur.com/JODHF99.gif)

``` r
devtools::load_all()

fun = function(x) x^2
search_space = ParamSet$new(params = list(ParamDbl$new("x", -5, 5)))

op = OptProblem$new(
  target_fun = TargetFun$new(fun, search_space),
  opt_iterator = OptIteratorBO$new(),
  opt_terminator = OptTerminatorSteps$new(10),
  surrogate_model = SurrogateModelGP$new(),
  acq_optimizer = AcqOptimizerCMAES$new(),
  acq_function = AcqFunctionCB$new()
)

bayopt(op)
```
