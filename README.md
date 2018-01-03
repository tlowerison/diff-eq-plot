<h1>Differential Equation Plotter</h1>

Download MATLAB scripts and add them to your MATLAB folder.<br/>
<br/>
To encode a sequence of coupled differential equations use the following protoype:<br/>
@(param1, param2, ...) diffEqGen({@(Q,t) ..., @(Q,t) ..., ...})<br/>
<br/>
Each coupled differential equation in the cell-table passed into function diffEqGen is used to determine the <i>n<sup>th</sup></i> time derivative of that variable.<br/>
These functions all receive two arguments:<br/>
<ol>
	<li>
		<i>Q</i>: A matrix of values for each time-valued variable for the system and its derivatives.<br/>
		Q(1,1), ..., Q(1,n) represent the first variable of the system and its first <i>(n-1)</i> time derivatives. Its total rows are determined by how many coupled equations are desired/needed.
	</li>
	<li>
		<i>t</i>: The current time value at which the system is being evaluated. This is useful for systems with explicit time dependence or driven systems (e.g. Step Function System Responses).
	</li>
</ol>

<hline>

Example: Single Mass-Spring-Damper System (assume m, z, k are defined in workspace)<br/>
<br/>
&nbsp;&nbsp;&nbsp;&nbsp;Q_init = [2, 0];<br/>
&nbsp;&nbsp;&nbsp;&nbsp;DE = @(m,z,k) diffEqGen({@(Q,t) - z/m\*Q(1,2) - k/m\*Q(1,1)});<br/>
&nbsp;&nbsp;&nbsp;&nbsp;Ti = 0;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;Tf = 60;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;Tstep = 0.25;<br/>
&nbsp;&nbsp;&nbsp;&nbsp;varLabels = ["Position", "Velocity", "Acceleration"];<br/>
<br/>
&nbsp;&nbsp;&nbsp;&nbsp;timeEvolvePlot(Q_init, DE(m,z,k), Ti, Tf, Tstep, varLabels);<br/>