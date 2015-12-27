################################################################################
# Developer Name: Abiyu Giday                                                  #
# Date: 12/24/2015                                                             #
# Description:  This crime analyzer shiny web app is developed                 #
#               for a project in Coursera Data Science Specialization course.  #
################################################################################
shinyUI(
        fluidPage(
                
                # Global style setting #
                style = "padding-top: 10px; padding-bottom: 50px; font-family: times new roman;",
                
                # The main Menu Naviagation bar for all pages #
                navbarPage(
                        
                        title = "Houston Viloent Crime Analysis Map FY 2010",
                        position = "static-top",
                        
                        # Menu 1 #
                        tabPanel("HoustonMap", 
                                 icon = icon("map-marker"),
                                 div(class="outer",
                                     tags$style(type = "text/css",
                                                ".outer {position: fixed; top: 50px; left: 0; right: 0;
                                                bottom: 0; overflow: hidden; padding: 0}"),
                                     
                                     leafletOutput("map", width="100%", height="100%"),
                                     
                                     # Floating panel on the right hand sdie.
                                     absolutePanel(top = 30, right = 30, draggable=TRUE,
                                                   wellPanel(style = "background-color: #ffffff; width: 350px",
                                                             
                                                             # Selection options
                                                             selectizeInput('offenseFilter', 'Filter by type(s) of offenses:',
                                                                            choices = c("All", unique(as.character(hustonCrime$offense))) 
                                                                            
                                                             ),
                                                             checkboxInput('mapCluster', 'Cluster results?'),
                                                             
                                                             selectizeInput('monthFilter', 'Select by month:',
                                                                            choices = c("All",
                                                                                        unique(as.character(sort(hustonCrime$month))))
                                                             )#2nd selectInput close
                                                   )#wellPanel close
                                     )#absolutePanel close
                                     )#div close
                                 
                                 
                        ),#tabPanel close
                        
                        
                        # Menu 2 #
                        tabPanel("App Documentation",
                                 icon = icon("life-saver"),
                                 navlistPanel(
                                         "Content",
                                         tabPanel("About",
                                                  h1("Huston Crime App Summary"),
                                                  p("The Huston Crime Analysis web application is built with shiny web framework from RStudio."),
                                                  p("The dataset 'Crime' is gathered from Huston Texas Police crime report from January to August 2010." ,br(), "The data is cleaned and filtered so that only more serious crimes (murder, Rape, robbery and aggravated assault) are considered."),
                                                  p("The data is geocoded with longitude and latitude information with Google Maps and mapped using the Leaflet map widget."),
                                                  br(),
                                                  p("Huston Police data can be found here http://www.houstontx.gov/police/cs/stats2.htm")
                                                  
                                                  
                                         ),                                                    
                                         tabPanel("How to Use the App",
                                                  h1("Application Input Selection"),
                                                  p("The Application comes with a floating panel that can be dragged in any direction by clicking and pulling it around."),
                                                  p("There are 3 Input (selection options) in the panel, and they are Filter by offense type, Select Month and a cluster box that unifies crime types."),
                                                  p("A user can plot the crimes on the map based on just offense and/or type of offense in a particular month.  For example rape in June etc."),
                                                  p("A user can hover and click on each plot to view the offense type, the date of the offense, and the time of the crime."),
                                                  p("A user can select the checkbox to cluster crime types for higher level view.")
                                                  
                                         ),
                                         tabPanel("Credit",
                                                  h1("Application was influenced by the following:"),
                                                  p("Dean Attali - http://deanattali.com "),
                                                  p("Josh Pepper http://dlab.berkeley.edu/training/building-webmaps-r-leaflet-shiny"),
                                                  p("Dr. Brain Caffo https://www.coursera.org/instructor/~47"),
                                                  p("Coursera https://www.coursera.org/learn/data-products"),
                                                  p("Icons from http://fontawesome.io/icons/")
                                         ),
                                         tabPanel("GitHub Source Code Location"),
                                         h3("Source Code URLs"),
                                         p("https://github.com/abiyug/CrimeAnalyzerShinyApp"),
                                         h3("Presenation for the app is published on rpubs."),
                                         p("http://rpubs.com/abiyu/CrimeAnalyzerShinyApp3")
                                         
                                 )
                        )
                ) #nav bar page close
        ) #fluid page close
        
        
) #Shiny UI close

