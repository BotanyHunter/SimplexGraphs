# SimplexGraphs
R code to draw simplex graphs
<hr>
<p>A few functions to draw simplex graphs and add data points.</p>

<p>The main functions are:
<ul>
  <li><b>simplexPlot</b>
    <p>arguments include:
      <ul>
        <li>plotData (default = 0): This should be a matrix or data.frame in which the first three columns represent the 
                                    values for the upper vertex, the lower left vertex, and the
                                    lower right vertex, respectively. </li>
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
  <li><b>quartetPlot</b>
  <p>An extension of simplexPlot designed to display concordance factors or posterior probabilities for the three
    topologies in phylogenetic studies of quartets.  The display replaces the vertex labels with small tree diagrams.
    Arguments include:
    <ul>
      <li>plotData: same as above, the column order of the data should be (12|34), (13|24), (14|23).</li>
      <li>binLabels (default NULL): A vector with labels for the four taxa. 
          If provided, a legend is drawn to the upper left of the simplex.</li>
      <li>cexLabels (default = .7): the size of the legend text</li>
      <li>cexPoints (default = .1): same as above</li>
      <li>main (default = ""): same as above</li>
      <li>col (default = black): same as above</li>
    </ul>
  </p>
  <p>Example: 
    </br>myData = matrix(c(0.9,0.1,0,.05,.9,.05), ncol=3, byrow=T)
    </br>quartetPlot(myData, cexPoints = .5, col="red", binLabels = c("outgroup","gorillas","humans","chimps"))
  </p>
  </li>
  <li><b>simplexPoints</b>
  <p>This function adds points to an already drawn simplex plot. Arguments include:
    <ul>
      <li>plotData: same as above.</li>
      <li>col: same as above.</li>
      <li>cexPoints: same as above.</li>
    </ul>
  </p>
  <p>Example: 
    </br>myData = matrix(c(0.9,0.1,0,.05,.9,.05), ncol=3, byrow=T)
    </br>quartetPlot(0, binLabels = c("outgroup","gorillas","humans","chimps"))
    </br>simplexPoints(myData\[1,,drop=F\], col="red", cexPoints = 1)
    </br>simplexPoints(myData\[2,,drop=F\], col="blue", cexPoints = 1)
  </p>
  </li>  
</ul>
</p>
