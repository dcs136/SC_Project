dashboardPage(skin = "purple",
  dashboardHeader(title = "Root Finding App"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Root Finding", tabName = "root", icon = icon("bar-chart-o"))
    ),
    selectInput(inputId = 'equation',
                selectize = FALSE,
                size = 1,
                label = 'Select a Function',
                choices = unique(functions$Functions),
                selected = c('log(x) + exp(-x)')),
    uiOutput('Area_ui_b'),
    numericInput("num1", "First Initial Point", value = 0, min = -100, max = 100, step = 0.1),
   textInput("text", "Text Input: "),
   actionButton("calculate", "Find Root")
),
  dashboardBody(
    tabItems(
      tabItem(tabName = "root")),
    fluidRow(
      box(
        title = "Curve", background = "blue", solidHeader = TRUE,
        collapsible = TRUE,
        plotOutput('curve')),
      box(
        title = "Root Point", width = 4, background = "light-blue",
        htmlOutput('iteration')
      ),  
      #htmlOutput('iteration')
    )
  )
)
