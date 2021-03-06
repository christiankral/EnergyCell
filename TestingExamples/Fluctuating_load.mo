within EnergyCell.TestingExamples;
model Fluctuating_load
  extends Modelica.Icons.Example;
  PowerSystems.Generic.FixedVoltageSource fixedVoltageSource(redeclare package
      PhaseSystem = PowerSystems.PhaseSystems.ThreePhase_dq, V(displayUnit="V")=
         400) annotation (Placement(transformation(extent={{-80,0},{-60,20}})));
  PowerSystems.Generic.PrescribedPowerLoad prescribedPowerLoad
    annotation (Placement(transformation(extent={{20,0},{40,20}})));
  PowerSystems.Blocks.Signals.Transient transSig1(
    t_change=5,
    t_duration=1,
    s_start=1,
    s_end=10) annotation (Placement(transformation(extent={{20,42},{40,62}})));
  PowerSystems.Generic.Sensors.PMeter pMeter
    annotation (Placement(transformation(extent={{-28,0},{-8,20}})));
equation
  connect(transSig1.y, prescribedPowerLoad.P)
    annotation (Line(points={{40,52},{41,52},{41,10}}, color={0,0,127}));
  connect(prescribedPowerLoad.terminal, pMeter.terminal_n)
    annotation (Line(points={{20,10},{-8,10}}, color={0,120,120}));
  connect(pMeter.terminal_p, fixedVoltageSource.terminal)
    annotation (Line(points={{-28,10},{-60,10}}, color={0,120,120}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Fluctuating_load;
