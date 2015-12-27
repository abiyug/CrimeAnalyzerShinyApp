################################################################################
# Developer Name: Abiyu Giday                                                  #
# Date: 12/24/2015                                                             #
# Description:  This crime analyzer shiny web app is developed                 #
#               for a project in Coursera Data Science Specialization course.  #
################################################################################
function(input, output, session) {
        
        #set the initial color palette
        offenseColor <- colorFactor(rainbow(7), hustonCrime$offense)
        
        
        # Set Data based on the input selection #        
        fData <- reactive({
                data <- hustonCrime
                
                
                if (input$offenseFilter != "All"){
                        data <- subset(data, offense %in% input$offenseFilter) 
                }
                if (input$monthFilter != "All"){
                        data <- subset(data, month %in% input$monthFilter) 
                }
                
                return(data)
                
                
        })
        
        
        # render map using the leaflet fucntion #  
        output$map <- renderLeaflet({
                
                leaflet(fData()) %>%
                        addProviderTiles("CartoDB.Positron") %>%
                        setView(-95.4, 29.76, zoom = 10)
        })
        
        #set mapCluster variable based on input checkbox #
        mapClusterResult <- reactive({
                if(input$mapCluster){TRUE}
                else {NULL}
        })
        
        # update map based on changed inputs #
        observe({
                leafletProxy("map", data = fData()) %>%
                        clearMarkers() %>%
                        clearControls() %>%
                        clearMarkerClusters %>%
                        addCircleMarkers(
                                stroke = FALSE, fillOpacity = 0.5, radius=6, color = ~offenseColor(offense),
                                clusterOptions = mapClusterResult(),
                                popup = ~paste("<strong>Offense:</strong>",offense,
                                               "<br>",
                                               "<strong>Date:</strong>",date,
                                               "<br>",
                                               "<strong>Time:</strong>",time)
                        ) %>%
                        addLegend(title = "Type of Offense", position = "topleft",
                                  pal = offenseColor, values = ~offense, opacity = 1)
                
                
        })
}