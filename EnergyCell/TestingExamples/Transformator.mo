within EnergyCell.TestingExamples;
model Transformator
  extends Modelica.Icons.Example;
  PowerSystems.Generic.FixedVoltageSource fixedVoltageSource(redeclare package
      PhaseSystem = PowerSystems.PhaseSystems.ThreePhase_dq, V(displayUnit="kV")=
         10000)
    annotation (Placement(transformation(extent={{-100,0},{-80,20}})));
  PowerSystems.Generic.Ground ground
    annotation (Placement(transformation(extent={{80,0},{100,20}})));
  PowerSystems.Generic.Impedance ohm(
    redeclare package PhaseSystem = PowerSystems.PhaseSystems.ThreePhase_dq,
    R=10,
    L=0) annotation (Placement(transformation(extent={{-10,0},{10,20}})));
  PowerSystems.Generic.Transformer transformer(ratio=10/0.4)
    annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
equation
  connect(fixedVoltageSource.terminal, transformer.terminal_p)
    annotation (Line(points={{-80,10},{-60,10}}, color={0,120,120}));
  connect(transformer.terminal_n, ohm.terminal_p)
    annotation (Line(points={{-40,10},{-10,10}}, color={0,120,120}));
  connect(ohm.terminal_n, ground.terminal)
    annotation (Line(points={{10,10},{80,10}}, color={0,120,120}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Transformator;
