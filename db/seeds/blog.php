<a name="blog"></a>

<div id="blog">
    <?php

    require $dir . 'library/autoloader.php';

    $feed = new SimplePie();

    $feed->set_feed_url('http://kaloidistech.com/wordpress/?feed=rss2');

    $feed->force_feed(true);

    $feed->enable_order_by_date(false);		

    $feed->init();

    $feed->handle_content_type();

    foreach($feed->get_items() as $item){

            echo '<h4><a href="' . $item->get_permalink() . '">' . $item->get_title() . '</a></h4>';

            echo '<p>' . substr($item->get_description(), 0, 200) . '... <a href="' . $item->get_permalink() . '">';

            echo '<small>View More!</small></p>';
            echo '<hr>';

    }

    ?>

    <h4><a href="http://www.vkaloidis.com/wordpress/">View Blog</a></h4>
</div>