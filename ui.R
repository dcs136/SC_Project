dashboardPage(skin = "purple",
  dashboardHeader(title = "Root Finding App"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Root Finding", tabName = "root", icon = icon("home"))
    ),
    selectInput(inputId = 'equation',
                selectize = FALSE,
                size = 1,
                label = 'Select a Function',
                choices = unique(functions$Functions),
                selected = c('CT')),
    uiOutput('Area_ui_b'),
    numericInput("num1", "First Initial Point", value = 0, min = -100, max = 100, step = 0.1),
   actionButton("calculate", "Find Root")
),
  
  dashboardBody(
    tabItems(
      tabItem(tabName = "root")),
    fluidRow(
      plotOutput('curve'),
      htmlOutput('iteration')
    )
  )
)
