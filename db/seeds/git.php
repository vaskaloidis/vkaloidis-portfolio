<?php
// require('./library/library/SimplePie.php');
$gitFeed = new SimplePie();

    $gitFeed->set_feed_url('https://github.com/vaskaloidis.atom');

    $gitFeed->force_feed(true);

    $gitFeed->enable_order_by_date(false);		

    $gitFeed->init();

    $gitFeed->handle_content_type();

    foreach($gitFeed->get_items() as $item){
        echo '<p><b><a href="' . $item->get_permalink() . '">' . $item->get_title() . '</a></b><br>';
        echo '<small>View More!</small></p>';
        echo '<hr>';
    }    
?>
<button type="submit" onclick="
    window.location='https://github.com/vaskaloidis'"
class="btn btn-large btn-success">
        <i class="fa fa-github fa-lg"></i>&nbsp; GitHub
</button>
	
    
<!-- GIT Activity Experiment-->
<!--<iframe id="#github-activity-iframe" allowtransparency="true" 
        frameborder="0" scrolling="no" seamless="seamless" 
        src="http://colmdoyle.github.io/gh-activity/gh-activity.html?user=colmdoyle&type=user" 
width="300" height="300">
</iframe>-->