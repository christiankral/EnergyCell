within EnergyCell.TestingExamples;
model Fluctating_load_trafo
  extends Modelica.Icons.Example;
  PowerSystems.Generic.FixedVoltageSource fixedVoltageSource(redeclare package
      PhaseSystem = PowerSystems.PhaseSystems.ThreePhase_dq, V(displayUnit="kV")=
         10000)
    annotation (Placement(transformation(extent={{-100,0},{-80,20}})));
  PowerSystems.Generic.PrescribedPowerLoad prescribedPowerLoad
    annotation (Placement(transformation(extent={{68,0},{88,20}})));
  PowerSystems.Blocks.Signals.Transient transSig1(
    t_change=5,
    t_duration=1,
    s_start=1,
    s_end=1000) annotation (Placement(transformation(extent={{68,42},{88,62}})));
  PowerSystems.Generic.Sensors.PMeter pMeter
    annotation (Placement(transformation(extent={{20,0},{40,20}})));
  PowerSystems.Generic.Transformer transformer(ratio=10/0.4)
    annotation (Placement(transformation(extent={{-40,0},{-20,20}})));
equation
  connect(transSig1.y, prescribedPowerLoad.P)
    annotation (Line(points={{88,52},{89,52},{89,10}}, color={0,0,127}));
  connect(prescribedPowerLoad.terminal, pMeter.terminal_n)
    annotation (Line(points={{68,10},{40,10}}, color={0,120,120}));
  connect(pMeter.terminal_p, transformer.terminal_n)
    annotation (Line(points={{20,10},{-20,10}}, color={0,120,120}));
  connect(transformer.terminal_p, fixedVoltageSource.terminal)
    annotation (Line(points={{-40,10},{-80,10}}, color={0,120,120}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Fluctating_load_trafo;
