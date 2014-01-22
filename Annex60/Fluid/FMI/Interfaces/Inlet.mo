within Annex60.Fluid.FMI.Interfaces;
connector Inlet "Connector for fluid inlet"
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
    "Medium model" annotation (choicesAllMatching=true);

  input Medium.MassFlowRate m_flow
    "Mass flow rate from the connection point into the component";
  input Medium.AbsolutePressure p
    "Thermodynamic pressure in the connection point";
  input Medium.SpecificEnthalpy h_inflow
    "Specific thermodynamic enthalpy close to the connection point if m_flow >= 0";
  input Medium.MassFraction Xi_inflow[Medium.nXi]
    "Independent mixture mass fractions m_i/m close to the connection point if m_flow < 0";
  input Medium.ExtraProperty C_inflow[Medium.nC]
    "Properties c_i/m close to the connection point if m_flow < 0";

  output Medium.SpecificEnthalpy h_outflow
    "Specific thermodynamic enthalpy close to the connection point if m_flow >= 0";
  output Medium.MassFraction Xi_outflow[Medium.nXi]
    "Independent mixture mass fractions m_i/m close to the connection point if m_flow < 0";
  output Medium.ExtraProperty C_outflow[Medium.nC]
    "Properties c_i/m close to the connection point if m_flow < 0";

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics={Polygon(
          points={{-100,100},{-100,-100},{100,0},{-100,100}},
          lineColor={0,0,255},
          smooth=Smooth.None,
          fillPattern=FillPattern.Backward,
          fillColor={0,0,255})}));
end Inlet;
