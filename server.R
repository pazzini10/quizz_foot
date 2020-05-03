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
    

  })
  
  # determine if current user is admin
  isAdmin <- reactive({
    is.null(session$user) || session$user %in% adminUsers
  })    
  
  
    

  # Show the responses in the admin table
  output$responsesTable <- DT::renderDataTable({
    input$submit
    data <- loadData()
    good1=good %>% slice(rep(row_number(), nrow(data)))  
    data=data %>%
      cbind(good1)
    
    for (p in 3:32) {
      data=data %>%
        mutate(!!sym(paste0("result",p)):=ifelse(.[p]==.[p+31],1,0)) 
    }
    data$timestamp <- as.POSIXct(data$timestamp, origin="1970-01-01")
    data= data %>%
      replace(is.na(.), 0) %>%
      mutate(Taux_reussite = (rowSums(.[64:93]))/30) %>%
      select(name,favourite_team,Taux_reussite,timestamp) %>%
      arrange(desc(Taux_reussite)) %>%
      mutate(Position=row_number()) %>%
      select(Position,name,favourite_team,Taux_reussite,timestamp) %>%
      rename(Nom=name,"Equipe de Coeur"=favourite_team,"Taux de reussite"=Taux_reussite,Date=timestamp)
    DT::datatable(
      data
,
      rownames = FALSE,
      options = list( rowCallback = JS('function(nRow, aData) {    
                                if (aData[0] == 1)
                                  $(nRow).css("background-color", "#FFD700");
                                if (aData[0] == 2)
                                  $(nRow).css("background-color", "#C0C0C0");
                                if (aData[0] == 3)
                                  $(nRow).css("background-color", "#cd7f32");
                                }'),searching = FALSE, lengthChange = FALSE,ordering=FALSE,columnDefs = list(list(className = 'dt-center', targets="_all")))
    ) %>% 
      formatPercentage(c("Taux de reussite"), 2)  
      #formatStyle(0, target = "row", backgroundColor = styleEqual(which(data$Position==1)[1], "yellow"))
  })
  
  
  
  # Allow user to download responses
  # output$downloadBtn <- downloadHandler(
  #   filename = function() { 
  #     sprintf("result_foot_%s.csv", humanTime())
  #   },
  #   content = function(file) {
  #     write.csv(loadData(), file, row.names = FALSE)
  #   }
  # )    
}