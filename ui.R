dashboardPage(
  skin = "black",
  dashboardHeader(
    title = "Newton IP"
  ),
  dashboardSidebar(
    sidebarMenu(
      menuItem(
        text = "Personal",
        tabName = "personal",
        badgeLabel = "demographics",
        badgeColor = "blue",
        icon = icon("gears")
      ),
      menuItem(
        text = "Billing",
        tabName = "billing",
        badgeLabel = "rate",
        badgeColor = "red",
        icon = icon("tasks")
      ),
      menuItem(
        text = "Work",
        tabName = "work",
        badgeLabel = "demographics", 
        badgeColor = "green",
        icon = icon("cubes")
      )
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(
        tabName = "personal",
        fluidRow(
          box(
            title = "Overview",
            width = 12, 
            
            radioButtons(inputId = "status", 
                         label = "Attrition status?", 
                         choices = unique(data_attrition$attrition),
                         inline = TRUE),
            
            valueBoxOutput(outputId = "job_sat", width = 3),
            
            valueBoxOutput(outputId = "env_sat", width = 3),
            
            valueBoxOutput(outputId = "tenure", width = 3),
            
            valueBoxOutput(outputId = "income", width = 3)
          ) 
        ),
         fluidRow(
           box(
             title = "Numerical Variable",
             width = 12,
             selectInput(
               inputId = "pers_num",
               label = "Select the variable:",
               choices = data_attrition %>%
                 select(age,
                        distance_from_home,
                        total_working_years,
                        num_companies_worked) %>% 
                 colnames()
             ), 
             plotlyOutput("personalNum")
           )
         )
      )
    )
  )
)