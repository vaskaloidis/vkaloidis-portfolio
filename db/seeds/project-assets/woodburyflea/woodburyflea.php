<div class="item">
    <a href="#"onclick="Effect.toggle(<?= $thisSection ?>, 'slide');return false;">
        <span class="project">Woodbury Flea Market Website</span>
        <span class="label label-danger">PHP</span>
        <span class="label label-info">MySQL</span>
        <span class="label label-success">Updated <i class="fa fa-star"></i></span>
    </a>
</div>
<div style="<?= $display ?>" id="<?= $thisSection ?>">
    <div id="insideItem">
        <h2>The New Woodbury Flea Market</h2>
        <p><b>Technologies: </b> PHP - CMS / Auth System, Mysql, HTML, CSS</p>
        <p>A website for the Woodbury Flea Market, complete with a marketing campaign launched for the 2015 season</p>
        <p>
            <center>
                <input type="submit"
                class="btn btn-large btn-success"
                onclick="window.location='http://www.thenewwoodburyfleamarket.com/'"
                value="www.thenewwoodburyfleamarket.com" /><br>
                <a href="http://www.thenewwoodburyfleamarket.com">
                    <img class="img-polaroid" width="400" height="400" src="./projectSections/woodburyflea/woodburyfleaSs1.png" />
                    <img class="img-polaroid" width="400" height="400" src="./projectSections/woodburyflea/woodburyfleaSs2.png" />
                    <img class="img-polaroid" width="400" height="400" src="./projectSections/woodburyflea/woodburyfleaSs3.png" />
                    <img class="img-polaroid" width="400" height="400" src="./projectSections/woodburyflea/woodburyfleaSs4.png" />
                </a>
            <br>
            <?php if($section == "all" && $thisSection != "" && $Config->get('direct_link')) { ?>
                <ol style="text-align:center" class="breadcrumb"><li><a href="<?= $url . $thisSection ?>"><i class="fa fa-link fa-lg"></i>&nbsp;<b>Direct Link</b>&nbsp;<?= $url . "/" . $thisSection?></li></a></ol>
            <?php } ?>
            </center>
        </p>
    </div>
</div>