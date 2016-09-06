<?php
$thisSection = "";
$section = "";
$url_section = basename(parse_url("http://" . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'], PHP_URL_PATH));
if($section != null && $section != "" && strcasecmp($section, "vkaloidis") != 0) {
    $section = $url_section;
} else {
    $section = "all";
}
if($section != "all") {
    $display = "";
} else {
    $display = "display:none";
}

echo '<script>' . PHP_EOL;
   echo "#" . $section . " {" . PHP_EOL . " display: block !important; " . PHP_EOL . " } " . PHP_EOL;
echo "</script>" . PHP_EOL;

$projectSections = array('isaac-python-scripts', 'fleamarket',
                              'applescripts', 'campusswap', 'pineapple',
                              'vineyard', 'cocktailchemist'
                                ); //Finish this but change section file names to section names

$thisSection = "apelonva-export";
 if($section == "all" || strcasecmp($section, $thisSection) == 0) {
    include('./projectSections/' . $thisSection . '.php'); 
}

$thisSection = "campusswap";
 if($section == "all" || strcasecmp($section, $thisSection) == 0) {
    include('./projectSections/campusswap.php'); 
}
 
$thisSection = "ocef";
 if($section == "all" || strcasecmp($section, $thisSection) == 0) {
    include('./projectSections/ocef.php'); 
}

$thisSection = "isaac-python-scripts";
if($section == "all" || $section == $thisSection) {
    include('./projectSections/isaac-python-scripts.php'); 
} 

$thisSection = "fleamarket";
if($section == "all" || strcasecmp($section, $thisSection) == 0) {
    include('./projectSections/woodburyflea/woodburyflea.php'); 
}

 $thisSection = "applescripts";
 if($section == "all" || strcasecmp($section, $thisSection) == 0) { 
     include('./projectSections/applescripts/applescripts.php'); 
 }

 $thisSection = false; //pineapple
 if(($thisSection && $section == "all") || strcasecmp($section, $thisSection) == 0) { ?>
 <div class="item" id="item">
        <a href="#"onclick="Effect.toggle('<?= $thisSection ?>', 'slide');return false;">
                <span class="project">Pineapple Social eCommerce Framework</span>
                <span class="label label-danger">PHP</span>
                <span class="label label-info">MySQL</span>
        </a>
 </div>
<?php include('./projectSections/pineapple.php'); ?>
 <?php }

 $thisSection = "vineyard";
 if($section == "all" || strcasecmp($section, $thisSection) == 0) { ?>
<div class="item" id="item">
        <a href="#"onclick="Effect.toggle('<?= $thisSection ?>', 'slide');return false;">
                <span class="project">The Bethlehem Vineyard </span>
                <span class="label label-danger">PHP</span>
                <span class="label label-info">MySQL</span>
        </a>
</div>
<?php include('./projectSections/vineyard.php'); ?>
 <?php }

 $thisSection = "cocktailchemist";
 if($section == "all" || strcasecmp($section, $thisSection) == 0) { ?>
<div class="item">
        <a href="#" onclick="Effect.toggle('<?= $thisSection ?>', 'slide');return false;">
                <span class="project">The Cocktail Chemists</span>
                <span class="label label-danger">PHP</span>
                <span class="label label-info">MySQL</span>
        </a>
</div>
<?php include('projectSections/cocktail.php'); ?>

 <?php }
 $thisSection = "akmemorial";
 if($section == "all" || strcasecmp($section, $thisSection) == 0) { ?>
<div class="item">
        <a href="#"onclick="Effect.toggle('<?= $thisSection ?>', 'slide');return false;">
                <span class="project">Athan Kaloidis Memorial Foundation</span>
                <span class="label label-danger">PHP</span>
                <span class="label label-info">MySQL</span>
        </a>
</div>
<?php include('./projectSections/athankaloidis.php'); ?>

<?php } ?>