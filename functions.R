library("shiny")

generateOptions2 <- function(inputId, choices, selected, inline, type = 'checkbox') {
  # generate a list of <input type=? [checked] />
  options <- mapply(
    choices, names(choices),
    FUN = function(value, name) {
      inputTag <- tags$input(
        type = type, name = inputId, value = value
      )
      if (value %in% selected)
        inputTag$attribs$checked <- "checked"
      
      # If inline, there's no wrapper div, and the label needs a class like
      # checkbox-inline.
      if (inline) {
        tags$label(class = paste0(type, "-inline"), inputTag, tags$span(name))
      } else {
        tags$div(class = type,
                 tags$label(inputTag, tags$span(name))
        )
      }
    },
    SIMPLIFY = FALSE, USE.NAMES = FALSE
  )
  
  gsub(pattern = "&amp;", replacement = "&", div(class = "shiny-options-group", options))
}


radioButtons2 = function (inputId, label, choices, selected = NULL, inline = FALSE) {
  selected <- if (is.null(selected)) 
    choices[[1]]
  else {
    validateSelected(selected, choices, inputId)
  }
  if (length(selected) > 1) 
    stop("The 'selected' argument must be of length 1")
  options <- generateOptions2(inputId, choices, selected, inline, 
                             type = "radio")
  divClass <- "form-group shiny-input-radiogroup shiny-input-container"
  if (inline) 
    divClass <- paste(divClass, "shiny-input-container-inline")
  tags$div(id = inputId, class = divClass, controlLabel(inputId, 
                                                        label), options)
}

environment(radioButtons2) <- environment(radioButtons)

environment(generateOptions2) <- environment(radioButtons)
