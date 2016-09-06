
<h2>USCRS Content Request Handler - Terminology EConcept (.jbin) / USCRS Content-Request Exporter Mojo</h2>
<p><b>Technologies: </b> Java, JavaFX, Maven, Apache Archiva, Maestro Dev</p><br />
<p>At Apelon, I work on a project, developed for the VA, <a href="https://github.com/Apelon-VA/">
        called ISAAC</a>. ISAAC is a Terminology Suite that works with Snomed CT, Loin, RX-Norm libraries.
        The project is a multi-module Maven project, written in Java, that utilizes the JavaFX GUI and Java 8 Features. 
        ISAAC GUI Suite consists of many modules that can be added to ISAAC's workspace; but it's also developed to run 
        headless on a CI server - this allows for nightly data exports, by utilizing the Maven Mojo I developed, here:</p>
    <center>
        <button type="submit" onclick="
            window.location='https://github.com/Apelon-VA/va-isaac-gui/blob/develop/content-request/src/main/java/gov/va/isaac/request/uscrs/UscrsContentRequestHandler.java'"
                        class="btn btn-large btn-success" >
                <i class="fa fa-github fa-lg"></i>&nbsp; UscrsContentRequestHandler.java
        </button>
        <button type="submit" onclick="
            window.location='https://github.com/Apelon-VA/va-isaac-gui/blob/develop/mojos/src/main/java/gov/va/isaac/mojos/datastore/export/ReleaseExporter.java'"
                        class="btn btn-large btn-success" >
                <i class="fa fa-github fa-lg"></i>&nbsp; ReleaseExporter.java (Maven Mojo)
        </button>
    </center>
    <p>The Release-Exporter executes an EConcept (.jbin) export or a USCRS Content-Request export. It is built to run automatically 
    when the -DskipExport=false flag is set (during a build). The Release Exporter Mojo takes a PATH UUID, and (if it is executing
    a USCRS Content Request Export) a USCRS Export Date filter - so the Exporter will export all concepts on the PATH as both (or either) an 
    EConcept (.jbin) and a USCRS Content-Request. If the USCRS Content Request is selected, then you may pass in a date-filter and the exporter
    will only export concepts and components modified after the date-filter date. </p>
    
    <p><b>Maestro Dev and generates the export then pushes it to Archiva</b></p>
    <h2>USCRS Export ISAAC Operation + Econcept / Changeset / XML Export ISAAC Operation</h2>
    <p>In ISAAC you may select concepts and add them to a list and run list operations against them. 
        The List-View API was developed so Operations (JavaFX Tasks) can easily be added.</p>
    <center>
        <button type="submit" onclick="
            window.location='https://github.com/Apelon-VA/va-isaac-gui/blob/develop/list-view/src/main/java/gov/va/isaac/gui/listview/operations/UscrsExportOperation.java'"
        class="btn btn-large btn-success">
                <i class="fa fa-github fa-lg"></i>&nbsp; ISAAC - UscrsExportOperation.java
        </button>
        
        <button type="submit" onclick="
            window.location='https://github.com/Apelon-VA/va-isaac-gui/blob/develop/list-view/src/main/java/gov/va/isaac/gui/listview/operations/EconceptExportOperation.java'"
                        class="btn btn-large btn-success" >
                <i class="fa fa-github fa-lg"></i>&nbsp; ISAAC - EconceptExportOperation.java
        </button>
    </center>
