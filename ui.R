dashboardPage(skin = "blue",
  dashboardHeader(title = "Root Finding App"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Root Finding", tabName = "root", icon = icon("bar-chart-o"))
    ),
    textInput("text", "Enter Your Function: "),
    numericInput("num1", "First Point", value = 0, min = -100, max = 100, step = 0.1),
    numericInput("num2", "Second Point", value = 0, min = -100, max = 100, step = 0.1),
   actionButton("calculate", "Find Root"),
   
   br(), br(), br(),br(), br(),br(), br(),br(), br(),br(),br(), br(),br(), br(),
   br(),br(),br(), br(),br(), br(),
   a(" Tolerance = 1e-09")

),
  dashboardBody(
    tabItems(
      tabItem(tabName = "root")),
    fluidRow(
      box(
        title = "UniRoot", align = "center", class = "text-center", width = 3, height = 150, style = "font-size:40px", status = "success", solidHeader = TRUE,
        htmlOutput('conversionS')),
      box(
        title = "Bisection", class = "text-center", width = 3, height = 150, style = "font-size:40px", status = "primary", solidHeader = TRUE, fill = T,
        htmlOutput('iterationB')
        ),
    box(
      title = "Secant", class = "text-center", width = 3, height = 150, style = "font-size:40px", status = "primary", solidHeader = TRUE, fill = T,
      htmlOutput('iterationS')
        ),
    box(
      title = "Newton", class = "text-center", width = 3, height = 150, style = "font-size:40px", status = "primary", solidHeader = TRUE, fill = T,
      htmlOutput('iterationN')
    )
      ),
      fluidRow(
      box(
        side = "left",
        title = "Curve", status = "primary", solidHeader = TRUE, width = 6,
        #collapsible = TRUE,
        plotOutput('curve')
        ),
      box(
          side = "right",
          title = "Number of Iteration", status = "primary", solidHeader = TRUE, width = 6,
          #collapsible = TRUE,
          plotOutput('barplot')
       ),
    )
  )
)


