within Annex60.Fluid.FMI.Examples;
block HeaterCoolerPrescribed "FMU declaration for an ideal heater or cooler"
   extends Annex60.Fluid.FMI.TwoPortSingleComponent(
     redeclare package Medium = Annex60.Media.Water,
     redeclare final Annex60.Fluid.HeatExchangers.HeaterCoolerPrescribed com(
      m_flow_nominal=m_flow_nominal,
      dp_nominal=dp_nominal,
      Q_flow_nominal=Q_flow_nominal,
      energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial));

  parameter Modelica.SIunits.MassFlowRate m_flow_nominal(start=1)
    "Nominal mass flow rate";
  parameter Modelica.SIunits.Pressure dp_nominal=10 "Pressure";
  inner Modelica.Fluid.System system(energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial)
    annotation (Placement(transformation(extent={{70,68},{90,88}})));
  parameter Modelica.SIunits.HeatFlowRate Q_flow_nominal = 1000
    "Heat flow rate at u=1, positive for heating";
  Modelica.Blocks.Interfaces.RealInput u(min=0, max=1, unit="1")
    "Control input"
    annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
equation
  connect(com.u, u) annotation (Line(
      points={{-12,6},{-40,6},{-40,60},{-120,60}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end HeaterCoolerPrescribed;
