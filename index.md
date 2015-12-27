---
title: "Crime Analyzer Shiny Web Application"
author: "Abiyu Giday"
highlighter: prettify
output: pdf_document
job: Aspiring Data Scientist
knit: slidify::knit2slides
mode: selfcontained
hitheme: tomorrow
subtitle: slides for the Web App
framework: revealjs
widgets: mathjax
---

### Crime Analyzer Shiny Web Application


<div style='text-align: center;'>
    <img height='320' src='HustonCrime.png' />
</div>


#### Abiyu Giday
##### December 24, 2015

--- .class #id 
### What is Crime Analyzer Shiny Web App?
* Crime Analyzer web application provides graphically detailed insight for crime analysis in a large metropolitan area. 
* The application comes loaded with Huston Police crime dataset from January 2010 to August 2010, but datasets from other metropolitan areas can be loaded. 
* The application loads violent crime by type, by month or by  a combination of both. 
* Each crime type is depicted with different color pallet. 
* The crime location is geocoded and is displayed on a map in the exact spot where the crime took place.


Refrence<http://www.houstontx.gov/police/cs/stats2.htm>


--- 

### Graphic User Interface of the application


<div style='text-align: center;'>
    <img height='660' src='appFeatures.png' />
</div>

---

### Crime Web App Features:

* **Clustering** feature allows to combine and view crime from a bird’s eye view.  
* When **hovering over and clicking on each crime dot** , a pop up will show the _type of offense, date and time of the crime_.
* The App has a **floating panel** with two drop down filter menus and a clustering click box.
* The user can select on the **drop-down menu** for type of offense and/or Month the crime took place.
* User can **drag the floating panel** by clicking and holding the mouse on anywhere on the panel.



---

### App Documentation

* The app documentation tab includes the help and _how-to_ use the app information. 
* The code for the application is located on Github <https://github.com/abiyug/CrimeAnalyzerShinyApp>

<div style='text-align: center;'>
    <img height='360' src='AppDocumentation.png' />
</div>


---

### R Packages used to develop the application

* Shiny package
* Leaflet package
* ggmap package
* ggplot2 package
* dplyr package
