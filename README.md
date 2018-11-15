# SimplexGraphs
R code to draw simplex graphs
<hr>
<p>A few simple functions to draw simplex graphs and add data points.</p>

<p>The main functions are:
<ul>
  <li><b>simplexPlot</b>
    <p>arguments include:
      <ul>
        <li>plotData (default = 0): This should be a matrix or data.frame in which the first three columns represent the 
                                    values for the upper vertex (12|34), the lower left vertex (13|24), and the
          lower right vertex (14|23), respectively. </li>
        <li>vertexlabels: a vector of three elements to label the three vertices (upper, lower left, lower right)</li>
        <li>drawLabels (default = FALSE): whether to draw the vertex labels or not</li>
        <li>cexLabels (default = .5): size to draw the vertex labels</li>
        <li>cexPoints (default = .1): size to draw the points</li>
        <li>main (default = ""): title of graph</li>
        <li>col (default = black): The color to paint the points</li>
    </ul>
    <p>Example: 
      </br>myData = matrix(c(0.9,0.1,0,.05,.9,.05), ncol=3, byrow=T)
      </br>simplexPlot(myData, cexPoints = .5, col="red", vertexLabels = c("A","B","C"), drawLabels = TRUE)
    </p>
  </li>
</ul>
</p>
