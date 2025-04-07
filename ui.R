library(shiny)
library(DT)
library(lubridate)
library(shinycssloaders)
library(httr)
library(jsonlite)
library(dplyr)

ui <- tags$html(
  lang = "en",
  fluidPage(
    style = "padding: 0px; margin: 0px;",
    tags$head(
      tags$title("WEDC: Guides and Factsheets"),
      tags$link(rel = "stylesheet", type = "text/css", href = "styles.css")
    ),
    
    # Black banner
    tags$div(
      class = "black-banner",
      tags$div(
        class = "banner-content",
        tags$a(
          href = "https://www.lboro.ac.uk",
          target = "_blank",
          tags$img(src = "logo.png", class = "uni-logo", alt = "University Logo")
        ),
        tags$span("School of Architecture, Building and Civil Engineering")
      )
    ),
    
    # Blue banner
    tags$div(
      class = "blue-banner",
      tags$div(
        class = "banner-content",
        tags$span("Water Engineering and Development Centre"),
        tags$a(
          href = "https://www.lboro.ac.uk/research/wedc/publications-and-resources/",
          class = "return-link",
          "< Return to Publications and resources"
        )
      )
    ),
    
    # Title section
    tags$div(
      class = "white-banner",
      tags$h1("Guides and Factsheets")
    ),
    
    # Layout for inputs and outputs
    sidebarLayout(
      sidebarPanel(
        style = "margin-left: 20px; padding-right: 20px;",
        
        # Collection Drop-down
        selectInput(
          inputId = "collectionSelect",
          label = "Select a Collection",
          choices = NULL,  # Placeholder, will be updated dynamically
          selected = NULL,
          multiple = FALSE
        ),
        
        # Author Search
        textInput(
          inputId = "authorSearch",
          label = "Search by Author",
          placeholder = "Enter author's name"
        ),
        
        # Title Search
        textInput(
          inputId = "titleSearch",
          label = "Search by Title",
          placeholder = "Enter book or manual title"
        )
      ),
      
      mainPanel(
        fluidRow(
          style = "margin-left: 20px; margin-right: 20px;",
          withSpinner(
            uiOutput("bookDetails"),
            type = 3,
            color = "#009BC9",
            color.background = "#FFFFFF"
          )
        )
      )
    ),
    
    # Footer
    tags$div(
      class = "footer", 
      fluidRow(
        column(
          12, 
          tags$a(
            href = 'https://doi.org/10.17028/rd.lboro.28525481', 
            "Accessibility Statement"
          )
        )
      )
    )
  )
)
