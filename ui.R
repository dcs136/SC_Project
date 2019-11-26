dashboardPage(skin = "purple",
  dashboardHeader(title = "Root Finding App"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Root Finding", tabName = "root", icon = icon("bar-chart-o"))
    ),
    # selectInput(inputId = 'equation',
    #             selectize = FALSE,
    #             size = 1,
    #             label = 'Select a Function',
    #             choices = unique(functions$Functions),
    #             selected = c('log(x) + exp(-x)')),
    # uiOutput('Area_ui_b'),
    textInput("text", "Enter Your Function: "),
    numericInput("num1", "First Point", value = 0, min = -100, max = 100, step = 0.1),
    numericInput("num2", "Second Point", value = 0, min = -100, max = 100, step = 0.1),
   actionButton("calculate", "Find Root")
),
  dashboardBody(
    tabItems(
      tabItem(tabName = "root")),
    fluidRow(
      box(
        title = "Root", align = "center", class = "text-center", width = 2, height = 100, style = "font-size:30px", status = "success", solidHeader = TRUE,
        htmlOutput('conversionS')),
      box(
        title = "FixedPoint", class = "text-center", width = 2, height = 100, style = "font-size:30px",status = "primary", solidHeader = TRUE,
        htmlOutput('iterationF')
      ),  
      box(
        title = "Bisection", class = "text-center", width = 2, height = 100, style = "font-size:30px", status = "primary", solidHeader = TRUE, fill = T,
        htmlOutput('iterationB')
        ),
    box(
      title = "Secant", class = "text-center", width = 2, height = 100, style = "font-size:30px", status = "primary", solidHeader = TRUE, fill = T,
      htmlOutput('iterationS')
        )
      ),
      fluidRow(
      box(
        side = "left",
        title = "Curve", status = "primary", solidHeader = TRUE, width = 8,
        #collapsible = TRUE,
        plotOutput('curve')
        ),
      
      # fluidRow(
      #   infoBox("New Orders", 10 * 2, icon = icon("credit-card"), fill = TRUE),
      #   infoBoxOutput("progressBox2"),
      #   infoBoxOutput("approvalBox2")
      # ),
    )
  )

)

