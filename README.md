<h1>Differential Equation Plotter</h1>

To encode a sequence of coupled differential equations use the following protoype:<br/>
@(param1, param2, ...) diffEqGen({@(Q,t) ..., @(Q,t) ..., ...})<br/>
<br/>
param1, param2, etc. are parameters in the ODEs that are not time-variant and that you may want to vary from plot to plot (e.g. masses and spring constants in a mass-spring system)<br/>
<br/>
Each coupled differential equation in the cell-table passed into function diffEqGen is used to determine the <i>n<sup>th</sup></i> time derivative of that variable. These functions all receive two arguments:<br/>
<ol>
	<li>
		<i>Q</i>: A matrix of values for each time-valued variable for the system and its derivatives.<br/>
		Q(1,1), ..., Q(1,n) represent the first variable of the system and its first <i>(n-1)</i> time derivatives. Its total rows are determined by how many coupled equations are desired/needed.
	</li>
	<li>
		<i>t</i>: The current time value at which the system is being evaluated. This is useful for systems with explicit time dependence or driven systems (e.g. Step Function System Responses).
	</li>
</ol>

<hr/>

<b>Example</b>: Single Mass-Spring-Damper System (assume m, z, k are defined in workspace)<br/>
<br/>
&nbsp;&nbsp;&nbsp;&nbsp;Q_init = [2, 0];<br/>
&nbsp;&nbsp;&nbsp;&nbsp;DE = @(m, z, k) diffEqGen( { @(Q, t) -z / m \* Q(1,2) - k / m \* Q(1,1) } );<br/>
&nbsp;&nbsp;&nbsp;&nbsp;Ti = 0;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;Tf = 60;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;Tstep = 0.25;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;varLabels = ["Position", "Velocity", "Acceleration"];<br/>
&nbsp;&nbsp;&nbsp;&nbsp;timeEvolvePlot(Q_init, DE(m,z,k), Ti, Tf, Tstep, varLabels);<br/>
<br/>
<br/>
<b>Example</b>: Two Mass-Spring System with hammerblow to first mass at t=0 (assume m, k are defined in workspace)<br/>
<i>Setting a value in varLabel to 0 will disclude the corresponding variable's derivative from the plot.<br/></i>
<br/>
&nbsp;&nbsp;&nbsp;&nbsp;Q_init = [0, 0; 0, 0];<br/>
&nbsp;&nbsp;&nbsp;&nbsp;DE = @(m, k) diffEqGen( { @(Q, t) k / m \* (Q(2,1) - 2 \*Q(1,1)) + 1 / m \* dirac(t); @(Q, t) k / m \* (Q(1,1) - 2 \* Q(2,1)) } );<br/>
&nbsp;&nbsp;&nbsp;&nbsp;Ti = 0;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;Tf = 60;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;Tstep = 0.25;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;varLabels = ["x_{1}", 0, 0; "x_{2}", 0, 0];<br/>
&nbsp;&nbsp;&nbsp;&nbsp;timeEvolvePlot(Q_init, DE(m,z,k), Ti, Tf, Tstep, varLabels);<br/>
<br/>