<div  style="<?= $display ?>;" id="<?= $thisSection ?>">
    <div id="insideItem">
        <h2>OUCF - Open College Commerce Framework</h2>

        <div class="alert alert-danger">
            This is in complete redevelopment. Check back for updates!
        </div>

        <p><b>Technologies: </b> PHP, AJAX, CSS, Bootstrap, Apache, MySql</p>

        <p>Open source CMS marketplace system written in PHP with extensive Javascript/ AJAX use. Beautiful web 2.0 design, infinite page ajax feature, MySql database, optional IP logging/ banner system, plus login / user management with complete Bootstrap Admin Section. 

            Open Source Content Management System (CMS) marketplace system written in PHP with extensive JavaScript/ AJAX use. User theme template system, beautiful web 2.0 design, AJAX infinite page scrolling, MySQL database storage, optional IP logging/ banning system, user login/ management system, full ADMIN system Admin Section.
            </p>
                <input type="submit"
                class="btn btn-large btn-primary"
                onclick="window.location='https://code.google.com/p/phppineapple/'"
                value="https://code.google.com/p/phppineapple/">

                <center><img class="img-polaroid" width="400" height="400" src="./projects/turtle/turtle.png" /></center>
        <p><a href="./projects/turtle/turtle.png">
                <center>

                </center>
        </a></p>
        <h3>Contribute! - SVN, Bug Tracking, Wiki and Download!</h3>
        <input type="submit" onclick="window.location='https://code.google.com/p/phppineapple/'" class="btn btn-large btn-block" value="https://code.google.com/p/phppineapple/">
        <h3>Source Code - Subversion</h3>
<pre class="pre">
# Non-members may check out a read-only working copy anonymously over HTTP.
svn checkout http://phppineapple.googlecode.com/svn/trunk/ phppineapple-read-only
</pre>
			<h3>Pineapple IP Log System</h3>

<pre class="pre">
$ipQuery = mysql_query("SELECT * FROM ipLog WHERE (ip = '$ip' AND date = '$today')");

if(mysql_num_rows($ipQuery) > 0){
	mysql_query("UPDATE ipLog SET visits = visits +1 WHERE (ip = '$ip' AND date = '$today')");
} else {
	mysql_query("INSERT INTO ipLog (ip, status, visits, date, failed_logons) VALUES ('$ip', 'active', 1, '$today', 0)");
</pre>
			<p><a href="./projects/turtle/ipLog.png"><center><img class="img-polaroid" width="400" height="400" src="./projects/turtle/ipLog.png" /></center></a></p>
			
		<p><h3>Action Log System</h3></3>
<pre class="pre">
function logAction($u, $a){
$sql = "INSERT INTO log (user, action, date, time) VALUES ('$u', '$a', NOW(), NOW())";
mysql_query($sql);
}	
</pre>
    <p><a href="./projects/turtle/logSection.png"><center><img class="img-polaroid" width="400" height="400" src="./projects/turtle/logSection.png" /></center></a></p>


</div>
</div>