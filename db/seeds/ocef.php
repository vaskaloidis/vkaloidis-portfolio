<div class="item" id="item">
    <a href="#" onclick="Effect.toggle('<?= $thisSection ?>', 'slide');return false;">
        <span class="project">OCEF - Open College ECommerce PHP Framework </span>
        <span class="label label-danger">PHP</span>
        <span class="label label-info">MySQL</span>
        <span class="label label-info">Composer</span>
        <span class="label label-info">GitHub</span>
        <span class="label label-success">New <i class="fa fa-fire"></i></span>
    </a>
</div>

<div style="<?= $display ?>;" id="<?= $thisSection ?>">
    <div id="insideItem">
        <h2>OCEF Dependencies</h2>
        <p>The source code from Campus Swap, ported as a generic open source framework.
        </p>
        <div class="alert alert-warning">This framework is being rewritten. The Composer dev-libraries branch are still under development</div>
        <div class="alert alert-success">The OCEF framework 
            <a href="https://github.com/vaskaloidis/campusswap/blob/master/composer.json"><b>Campusswap/Composer.Json</b></a> 
            dependencies are 
            <a href="https://github.com/vaskaloidis/campusswap/tree/master/lib"><b>hosted on GitHub  </b>
        </div>
        <pre>
        {
            "repositories": [
                {
                    "type": "vcs",
                    "url": "https://github.com/vaskaloidis/campusswap"
                }
            ],
            "require": {
                "campusswap/DAO": "dev-libraries",
                "campusswap/Object": "dev-libraries",
                "campusswap/Util": "dev-libraries",
                "campusswap/Exception": "dev-libraries",
                "campusswap/Interface": "dev-libraries",
            }
        }
        </pre>
        
        <h2>Libraries</h2>
        <ul>
            <li>DAO - Data Access Objects</li>
            <li>Enum - Enum Prototype.</li>
            <li>Exception - Custom Exceptions. Needs more added.</li>
            <li>Interface - Class Interfaces.</li>
            <li>Object - Database and Auth Objects.</li>
            <li>Util - Util Classes.</li>
        </ul>
        <br><br>
            
        <p>
            <?php if($section == "all" && $thisSection != "" && $Config->get('direct_link')) { ?>
                <ol style="text-align:center" class="breadcrumb">
                    <li>
                        <a href="<?= $url . $thisSection ?>">
                     <ol style="text-align:center" class="breadcrumb">
                    <li>
                        <a href="<?= $url . $thisSection ?>">
                            <i class="fa fa-link fa-lg"></i>&nbsp;
                            <b>Direct Link</b>&nbsp;
                            <?= $url . "/" . $thisSection?>
                        </a>
                    </li>
                </ol>
            <?php } ?>
        </p>

    </div>
</div>