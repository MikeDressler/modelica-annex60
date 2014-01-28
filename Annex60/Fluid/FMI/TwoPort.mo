within Annex60.Fluid.FMI;
partial block TwoPort
  "Container to export a thermofluid flow model with two ports as an FMU"
  replaceable package Medium =
      Modelica.Media.Interfaces.PartialMedium "Medium in the component"
      annotation (choicesAllMatching = true);

  Interfaces.Inlet inlet(redeclare final package Medium = Medium) "Fluid inlet"
    annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));

  Interfaces.Outlet outlet(redeclare final package Medium = Medium)
    "Fluid outlet" annotation (Placement(transformation(extent={{100,
            -10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics={Rectangle(extent={{-100,100},{100,-100}},
            lineColor={0,0,255}),
            Text(
          extent={{-151,147},{149,107}},
          lineColor={0,0,255},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={0,127,255},
          textString="%name")}), Diagram(coordinateSystem(preserveAspectRatio=false,
                   extent={{-100,-100},{100,100}}), graphics));
end TwoPort;
