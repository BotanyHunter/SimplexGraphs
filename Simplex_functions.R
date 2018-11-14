stepConnect = function( point1, point2, col, lwd ){
  lines( x = c(point1["x"], point2["x"]),
         y = c(point1["y"], point1["y"]), col=col, lwd=lwd )
  lines( x = c(point2["x"], point2["x"]),
         y = c(point1["y"], point2["y"]), col=col, lwd=lwd )
}

drawQuartetTopology = function( x = 0, y = 1, 
                                size = 1                  , 
                                topology="(A,(B,(C,D)))"  ,
                                col = c("black", "black") ,
                                lwd = c(1,1)              ,
                                highlight = c("")         ){
  #plot(0,type="n", xlim=c(-.1,1.1), ylim=c(-.1,.1+sqrt(3)/2), axes=FALSE, ann=FALSE)

  tips = data.frame( x = c(x, x+size/3, x+2*size/3, x+size), y = rep(y-.8*size,4)) 
  rownames(tips) = c("A", "B", "C", "D")
  text(x=tips["A","x"], y=y-size, "A", cex=.5)
  text(x=tips["B","x"], y=y-size, "B", cex=.5)
  text(x=tips["C","x"], y=y-size, "C", cex=.5)
  text(x=tips["D","x"], y=y-size, "D", cex=.5)

  if( topology == "(A,(C,(B,D)))" ){
    nodes = data.frame( x = c(0,0,0), y=c(y, y-size/3, y-2*size/3) )
    rownames(nodes) = c("ABCD", "BCD", "BD")
    nodes["BD"  ,"x"] = (.25*tips["B","x"] + .75*tips["D"   ,"x"] )
    nodes["BCD" ,"x"] = (tips["C","x"] + nodes["BD" ,"x"] ) / 2
    nodes["ABCD","x"] = (tips["A","x"] + nodes["BCD","x"] ) / 2

    stepConnect(nodes["BD"  ,], tips ["B"  ,],
                    col = ifelse( "B" %in% highlight, col[1], col[2]),
                    lwd = ifelse( "B" %in% highlight, lwd[1], lwd[2]) )
    stepConnect(nodes["BD"  ,], tips ["D"  ,],
                    col = ifelse( "D" %in% highlight, col[1], col[2]),
                    lwd = ifelse( "D" %in% highlight, lwd[1], lwd[2]) )

    stepConnect(nodes["BCD" ,], nodes["BD" ,], 
                    col = ifelse( "B" %in% highlight && 
                                  "D" %in% highlight   , col[1], col[2]),
                    lwd = ifelse( "B" %in% highlight &&
                                  "D" %in% highlight   , lwd[1], lwd[2]) )
    stepConnect(nodes["BCD" ,], tips ["C"  ,],
                    col = ifelse( "C" %in% highlight, col[1], col[2]),
                    lwd = ifelse( "C" %in% highlight, lwd[1], lwd[2]) )

    stepConnect(nodes["ABCD",], nodes["BCD",],
                    col = ifelse( "B" %in% highlight && 
                                  "C" %in% highlight && 
                                  "D" %in% highlight   , col[1], col[2]),
                    lwd = ifelse( "B" %in% highlight &&
                                  "C" %in% highlight && 
                                  "D" %in% highlight   , lwd[1], lwd[2]) )
    stepConnect(nodes["ABCD",], tips ["A"  ,],
                    col = ifelse( "A" %in% highlight, col[1], col[2]),
                    lwd = ifelse( "A" %in% highlight, lwd[1], lwd[2]) )

  } else if( topology == "(A,(D,(B,C)))" ){
    nodes = data.frame( x = c(0,0,0), y=c(y, y-size/3, y-2*size/3) )
    rownames(nodes) = c("ABCD", "BCD", "BC")
    nodes["BC"  ,"x"] = (tips["B","x"] + tips["C"   ,"x"] ) / 2
    nodes["BCD" ,"x"] = (tips["D","x"] + nodes["BC" ,"x"] ) / 2
    nodes["ABCD","x"] = (tips["A","x"] + nodes["BCD","x"] ) / 2

    stepConnect(nodes["BC"  ,], tips ["B"  ,],
                    col = ifelse( "B" %in% highlight, col[1], col[2]),
                    lwd = ifelse( "B" %in% highlight, lwd[1], lwd[2]) )
    stepConnect(nodes["BC"  ,], tips ["C"  ,],
                    col = ifelse( "C" %in% highlight, col[1], col[2]),
                    lwd = ifelse( "C" %in% highlight, lwd[1], lwd[2]) )

    stepConnect(nodes["BCD" ,], nodes["BC" ,], 
                    col = ifelse( "B" %in% highlight && 
                                  "C" %in% highlight   , col[1], col[2]),
                    lwd = ifelse( "B" %in% highlight &&
                                  "C" %in% highlight   , lwd[1], lwd[2]) )
    stepConnect(nodes["BCD" ,], tips ["D"  ,],
                    col = ifelse( "D" %in% highlight, col[1], col[2]),
                    lwd = ifelse( "D" %in% highlight, lwd[1], lwd[2]) )

    stepConnect(nodes["ABCD",], nodes["BCD",],
                    col = ifelse( "B" %in% highlight && 
                                  "C" %in% highlight && 
                                  "D" %in% highlight   , col[1], col[2]),
                    lwd = ifelse( "B" %in% highlight &&
                                  "C" %in% highlight && 
                                  "D" %in% highlight   , lwd[1], lwd[2]) )
    stepConnect(nodes["ABCD",], tips ["A"  ,],
                    col = ifelse( "A" %in% highlight, col[1], col[2]),
                    lwd = ifelse( "A" %in% highlight, lwd[1], lwd[2]) )

  } else {

    nodes = data.frame( x = c(0,0,0), y=c(y, y-size/3, y-2*size/3) )
    rownames(nodes) = c("ABCD", "BCD", "CD")
    nodes["CD"  ,"x"] = (tips["C","x"] + tips["D"   ,"x"] ) / 2
    nodes["BCD" ,"x"] = (tips["B","x"] + nodes["CD" ,"x"] ) / 2
    nodes["ABCD","x"] = (tips["A","x"] + nodes["BCD","x"] ) / 2

    stepConnect(nodes["CD"  ,], tips ["C"  ,],
                    col = ifelse( "C" %in% highlight, col[1], col[2]),
                    lwd = ifelse( "C" %in% highlight, lwd[1], lwd[2]) )
    stepConnect(nodes["CD"  ,], tips ["D"  ,],
                    col = ifelse( "D" %in% highlight, col[1], col[2]),
                    lwd = ifelse( "D" %in% highlight, lwd[1], lwd[2]) )

    stepConnect(nodes["BCD" ,], nodes["CD" ,], 
                    col = ifelse( "C" %in% highlight && 
                                  "D" %in% highlight   , col[1], col[2]),
                    lwd = ifelse( "C" %in% highlight &&
                                  "D" %in% highlight   , lwd[1], lwd[2]) )
    stepConnect(nodes["BCD" ,], tips ["B"  ,],
                    col = ifelse( "B" %in% highlight, col[1], col[2]),
                    lwd = ifelse( "B" %in% highlight, lwd[1], lwd[2]) )

    stepConnect(nodes["ABCD",], nodes["BCD",],
                    col = ifelse( "B" %in% highlight && 
                                  "C" %in% highlight && 
                                  "D" %in% highlight   , col[1], col[2]),
                    lwd = ifelse( "B" %in% highlight &&
                                  "C" %in% highlight && 
                                  "D" %in% highlight   , lwd[1], lwd[2]) )
    stepConnect(nodes["ABCD",], tips ["A"  ,],
                    col = ifelse( "A" %in% highlight, col[1], col[2]),
                    lwd = ifelse( "A" %in% highlight, lwd[1], lwd[2]) )

  }
}

simplexTransform = function(dataPoint){
  if( typeof( dataPoint ) == "list" ){
    xReturn = data.frame(matrix(unlist(apply(dataPoint, 1, simplexTransform)), ncol=2, byrow=TRUE))
    colnames(xReturn) = c("x","y")
    xReturn
  } else {
    if( length(dataPoint) != 3 ) return (NULL)
    if( abs(sum(dataPoint)-1) > .0015 ) return(NULL)
    y = dataPoint[2] * sqrt(3) / 2
    x = .5 * dataPoint[2] +  dataPoint[1]
    data.frame(x=x, y=y)
  }
}

quartetPlot = function(plotData, 
                       binLabels = NULL,
                       cexLabels=.7, 
                       cexPoints=.1,
                       main="",
                       mar = c(0,0,2.1,0),
                       col = "black",
                       vertexMap = list(upper     =1,
                                        lowerleft =2,
                                        lowerright=3) ){
  topologies = c("(A,(B,(C,D)))",
                 "(A,(C,(B,D)))",
                 "(A,(D,(B,C)))")
  
  simplexPlot(plotData, 
              drawLabels = FALSE,
              cexLabels = cexLabels,
              cexPoints = cexPoints,
              mar = mar,
              main = main,
              col = col,
              vertexMap = vertexMap)
  drawQuartetTopology(x=.3, y=.85, size=.10, 
                      topology=topologies[vertexMap[["upper"]]],
                      col=c("blue", "black"), lwd=c(3,1),
                      highlight=c("C","D") )
  drawQuartetTopology(x=.0, y=.30, size=.10, 
                      topology=topologies[vertexMap[["lowerleft"]]],
                      col=c("blue", "black"), lwd=c(3,1),
                      highlight=c("B","D") )
  drawQuartetTopology(x=.90, y=.30, size=.10, 
                      topology=topologies[vertexMap[["lowerright"]]],
                      col=c("blue", "black"), lwd=c(3,1),
                      highlight=c("B","C") )
  #add legend with vertex labels
  if( !is.null(binLabels) ){
    text(x=0, y=0.85, paste0("A = ",binLabels[1]), cex=cexLabels, adj=c(0,.5))
    text(x=0, y=0.80, paste0("B = ",binLabels[2]), cex=cexLabels, adj=c(0,.5))
    text(x=0, y=0.75, paste0("C = ",binLabels[3]), cex=cexLabels, adj=c(0,.5))
    text(x=0, y=0.70, paste0("D = ",binLabels[4]), cex=cexLabels, adj=c(0,.5))
  }

}


simplexPlot = function(plotData = 0, 
                       vertexLabels,
                       drawLabels = FALSE,
                       cexLabels=.5, 
                       cexPoints=.1,
                       main="",
                       col="black",
                       mar = c(0,0,2.1,0),
                       vertexMap = list(upper     =1,
                                        lowerleft =2,
                                        lowerright=3) ){
  op <- par(mar = mar)
  plot(0,type="n", 
         xlim=c(-.1,1.1), 
         ylim=c(-.1,.1+sqrt(3)/2),
         axes=FALSE, 
         ann=FALSE)
  if( main != "") title(main=main)

  vMap = c(3,1,2)
  if( vertexMap[["upper"]]      %in% 1:3 ) vMap[2] = vertexMap[["upper"]]
  if( vertexMap[["lowerleft"]]  %in% 1:3 ) vMap[3] = vertexMap[["lowerleft"]]
  if( vertexMap[["lowerright"]] %in% 1:3 ) vMap[1] = vertexMap[["lowerright"]]

  #make outline
  edges = data.frame(matrix(c(0,0,1,1,0,0,0,1,0,0,0,1), ncol=3, byrow=TRUE))
  edges = simplexTransform(edges)
  lines(edges, lwd=2)

  #make bifurcation lines
  bifurcs = data.frame(matrix(c(0,0,1,.5,.5,0,1,0,0,0,.5,.5,0,1,0,.5,0,.5), ncol=3, byrow=TRUE))
  bifurcs = simplexTransform(bifurcs)
  s = c(1,3,5)
  segments(bifurcs[s,1], bifurcs[s,2], bifurcs[s+1,1], bifurcs[s+1,2], lwd=1)


  #add labels
  if( drawLabels ){
    textPoint = simplexTransform(c(1,0,0))
    text(textPoint, vertexLabels[vMap[1]], cex=cexLabels, adj=c(1,1.5))

    textPoint = simplexTransform(c(0,1,0))
    text(textPoint, vertexLabels[vMap[2]], cex=cexLabels, adj=c(.5,-.5))

    textPoint = simplexTransform(c(0,0,1))
    text(textPoint, vertexLabels[vMap[3]], cex=cexLabels, adj=c(0,1.5))
  }

  if( plotData != 0 && ncol(plotData) > 0 ){
    mappedData = data.frame(lowerright = plotData[,vMap[1]], 
                            upper      = plotData[,vMap[2]], 
                            lowerleft  = plotData[,vMap[3]])
    xData = simplexTransform(mappedData)
    points(xData, pch=19, cex=cexPoints, col=col)
  }

  par(op)
}

simplexPoints = function(plotPoints, 
                         col="black", 
                         cexPoints=.1,
                         vertexMap = list(upper     =1,
                                          lowerleft =2,
                                          lowerright=3) ){
  vMap = c(3,1,2)
  if( vertexMap[["upper"]]      %in% 1:3 ) vMap[2] = vertexMap[["upper"]]
  if( vertexMap[["lowerleft"]]  %in% 1:3 ) vMap[3] = vertexMap[["lowerleft"]]
  if( vertexMap[["lowerright"]] %in% 1:3 ) vMap[1] = vertexMap[["lowerright"]]

  mappedData = data.frame(lowerright = plotPoints[,vMap[1]], 
                          upper      = plotPoints[,vMap[2]], 
                          lowerleft  = plotPoints[,vMap[3]])
  xData = simplexTransform(mappedData)
  points(xData, pch=19, cex=cexPoints, col=col)
}


RUN_SAMPLE_CODE = FALSE
if( RUN_SAMPLE_CODE ){
  numPoints = 100
  x = runif(numPoints)
  y = (1-x) * runif(numPoints)
  z = 1 - x - y
  plotData = data.frame(x = x, y = y, z = z)
  quartetPlot(plotData)
  quartetPlot(plotData,
              binLabels = c("outgroup", "cousins", "sister 1", "sister 2"))
  quartetPlot(plotData,
              binLabels = c("outgroup", "cousins", "sister 1", "sister 2"),
              cexLabels = 1)
  quartetPlot(plotData,
              binLabels = c("outgroup", "cousins", "sister 1", "sister 2"),
              cexLabels = 1,
              cexPoints = .7)
  quartetPlot(plotData,
              binLabels = c("outgroup", "cousins", "sister 1", "sister 2"),
              cexLabels = 1,
              cexPoints = 1,
              main="some points")
  quartetPlot(plotData,
              binLabels = c("outgroup", "cousins", "sister 1", "sister 2"),
              cexLabels = 1,
              cexPoints = 1,
              main="some points",
              col = "blue")
  simplexPoints(plotData, col="red")
}
