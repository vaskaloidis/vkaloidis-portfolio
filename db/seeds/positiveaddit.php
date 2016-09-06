
		<h2>Positive Addit Function</h2>

		<p>The MIPS code bellow replicates the following C code:</p>
		
		<pre>
int positive(int a, int b) 
{ 
if (addit(a, b) > 0)
  return 1; 
else
  return 0;
} 
int addit(int a, int b) 
{
return a+b; 
}
		</pre>
		
		<p>The MIPS code reffers to the positive function above: it takes input from the user, and if a+b is positive, it returns 1 and tells the user it is a positive number, If the number combination given to addit() function sums negative, the program notifies the user it is negative and returns 0.</p>
		
<script src="http://gist.github.com/6265798.js"></script>


