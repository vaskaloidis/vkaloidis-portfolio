
		<h2>Floating Point Unit Array, Single Precision, MIPS</h2>
		
		<p><center><embed height="400" width="500" src="./projects/mipsFPUarray/Project5.swf"></center></p>

		<p>This program takes a random 4 digit number as a seed, and manipulates it. The MIPS program replicates  the C function below:</p>
	<pre>	
	int seed = 9973; 

	int randnum() 
	{ 
		seed = ((seed * 32749) + 32649) % 32768; 
		return seed; 
	}
	</pre>

		<p>The program loops 20 times, and asks the user for a random seed every time, it adds the result of the above multiplication to an FPU Single Precision array.</p>

<script src="http://gist.github.com/6265804.js"></script>

