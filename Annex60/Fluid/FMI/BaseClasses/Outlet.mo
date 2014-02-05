within Annex60.Fluid.FMI.BaseClasses;
model Outlet "Model for exposing a fluid outlet to the FMI interface"

  replaceable package Medium =
      Modelica.Media.Interfaces.PartialMedium "Medium model within the source"
     annotation (choicesAllMatching=true);

  Interfaces.Outlet outlet(redeclare final package Medium=Medium)
    "Fluid outlet" annotation (Placement(transformation(extent={{100,-10},
            {120,10}}), iconTransformation(extent={{100,-10},{120,10}})));

  Modelica.Fluid.Interfaces.FluidPort_a port(redeclare final package Medium=Medium)
    "Fluid port"
                annotation (Placement(
        transformation(extent={{-110,-10},{-90,10}}),
                                                    iconTransformation(extent={{-110,
            -10},{-90,10}})));
  Modelica.Blocks.Interfaces.RealInput p(unit="Pa") "Pressure" annotation (
      Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-120})));
equation
  // Set outlet pressure and port pressure to pressure
  // of signal port
  outlet.p        = p;
  port.p          = p;

  port.m_flow     = outlet.m_flow;
  inStream(port.h_outflow)  = outlet.h_outflow;
  inStream(port.Xi_outflow) = outlet.Xi_outflow;
  inStream(port.C_outflow)  = outlet.C_outflow;

  port.h_outflow  = outlet.h_inflow;
  port.Xi_outflow = outlet.Xi_inflow;
  port.C_outflow  = outlet.C_inflow;

    annotation (defaultComponentName="boundary",
    Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}}), graphics={
        Rectangle(
          extent={{60,60},{-60,-60}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Sphere,
          fillColor={0,127,255}),
        Text(
          extent={{-150,110},{150,150}},
          textString="%name",
          lineColor={0,0,255}),
        Line(
          points={{60,0},{100,0}},
          color={0,0,255}),
        Rectangle(
          extent={{-100,20},{-60,-21}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={0,127,255}),
        Text(
          extent={{66,40},{100,0}},
          lineColor={0,0,255},
          textString="outlet"),
        Line(
          points={{0,-60},{0,-100}},
          color={0,0,255},
          smooth=Smooth.None),
        Text(
          extent={{10,-64},{44,-104}},
          lineColor={0,0,255},
          textString="p")}),
    Documentation(info="<html>
<p>
Defines output values for boundary conditions:
</p>
<ul>
<li> Boundary pressure.</li>
<li> Boundary enthalpy.</li>
<li> Boundary composition (only for multi-substance or trace-substance flow).</li>
</ul>
<p>
This model can be used to send output signals from a fluid flow component
to the FMI interface.
</p>
</html>", revisions="<html>
<ul>
<li>
January 21, 2014 by Michael Wetter:<br/>
First implementation.
</li>
</ul>
</html>"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics));
end Outlet;
