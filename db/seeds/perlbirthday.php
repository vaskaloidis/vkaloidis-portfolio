<div  style="<?= $display ?>" id="birthdaycount">
	<div id="insideItem">
		<h2>Countdown Months Till A Birthday</h2>
		<p>My first Perl app, counts the months till a users birthday. It takes the user's input and uses REGEX to count the months till the users birthday</p>
	<pre>
#!/usr/bin/perl
print "Please enter your birthday (EX: 3/13/91) - \n";
$birthday = <>;
$birthday =~ /(\d\d).(\d\d).(\d\d)/;
$month = $1;

$date = scalar(localtime());
$date =~ /(\d\d):(\d\d):(\d\d)/;
$currentMonth = $1;

if($month == $currentMonth){
print "This month is your birthday\n";
} elsif($currentMonth > $month){
$answer = 12 - $currentmonth;
$answer = $answer + $month;
print "$answer months till your birthday\n";
} elsif ($currentMonth < $month){
$answer = $month - $currentMonth;
print "$answer months till your birthday\n";
}
	</pre>
	</div>
</div>