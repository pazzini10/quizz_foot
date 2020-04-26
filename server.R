function(input, output, session) {
  
  # Enable the Submit button when all mandatory fields are filled out
  observe({
    mandatoryFilled <-
      vapply(fieldsMandatory,
             function(x) {
               !is.null(input[[x]]) && input[[x]] != ""
             },
             logical(1))
    mandatoryFilled <- all(mandatoryFilled)
    
    shinyjs::toggleState(id = "submit", condition = mandatoryFilled)
  })
  
  # Gather all the form inputs (and add timestamp)
  formData <- reactive({
    data <- sapply(fieldsAll, function(x) input[[x]])
    data <- c(data, timestamp = epochTime())
    data <- t(data)
    data
  })    
  
  # When the Submit button is clicked, submit the response
  observeEvent(input$submit, {
    
    # User-experience stuff
    shinyjs::disable("submit")
    shinyjs::show("submit_msg")
    shinyjs::hide("error")
    
    # Save the data (show an error message in case of error)
    tryCatch({
      saveData(formData())
      shinyjs::reset("form")
      shinyjs::hide("form")
      shinyjs::show("thankyou_msg")
    },
    error = function(err) {
      shinyjs::html("error_msg", err$message)
      shinyjs::show(id = "error", anim = TRUE, animType = "fade")
    },
    finally = {
      shinyjs::enable("submit")
      shinyjs::hide("submit_msg")
    })
  })
  
 
  
  # render the admin panel
  output$adminPanelContainer <- renderUI({
    if (!isAdmin()) return()
    
    div(
      id = "adminPanel",
      h2("Les résultats"),
      downloadButton("downloadBtn", "Télécharger classement joueurs"), br(), br(),
      DT::dataTableOutput("responsesTable")
       
    )
  })
  
  # determine if current user is admin
  isAdmin <- reactive({
    is.null(session$user) || session$user %in% adminUsers
  })    
  
  # Show the responses in the admin table
  output$responsesTable <- DT::renderDataTable({
    data <- loadData()
    data$timestamp <- as.POSIXct(data$timestamp, origin="1970-01-01")
    DT::datatable(
      data %>% select(name,favourite_team),
      rownames = FALSE,
      options = list(searching = FALSE, lengthChange = FALSE)
    )
  })
  
  # Allow user to download responses
  output$downloadBtn <- downloadHandler(
    filename = function() { 
      sprintf("result_foot_%s.csv", humanTime())
    },
    content = function(file) {
      write.csv(loadData(), file, row.names = FALSE)
    }
  )    
}