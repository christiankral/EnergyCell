within EnergyCell.TestingExamples;
model Load_Combined
  extends Modelica.Icons.Example;
  PowerSystems.Generic.FixedVoltageSource fixedVoltageSource(redeclare package
      PhaseSystem = PowerSystems.PhaseSystems.ThreePhase_dq, V(displayUnit="V")=
         400) annotation (Placement(transformation(extent={{-100,0},{-80,20}})));
  PowerSystems.Generic.Ground ground
    annotation (Placement(transformation(extent={{80,0},{100,20}})));
  PowerSystems.Generic.Impedance ohm(
    redeclare package PhaseSystem = PowerSystems.PhaseSystems.ThreePhase_dq,
    R=10,
    L=0) annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
  PowerSystems.Generic.Impedance ind(R=0, L=1)
    annotation (Placement(transformation(extent={{-10,0},{10,20}})));
  PowerSystems.Generic.Admittance cap(G=0, C=1e-06)
    annotation (Placement(transformation(extent={{40,0},{60,20}})));
equation
  connect(fixedVoltageSource.terminal, ohm.terminal_p)
    annotation (Line(points={{-80,10},{-60,10}}, color={0,120,120}));
  connect(ind.terminal_n, cap.terminal_p)
    annotation (Line(points={{10,10},{40,10}}, color={0,120,120}));
  connect(cap.terminal_n, ground.terminal)
    annotation (Line(points={{60,10},{80,10}}, color={0,120,120}));
  connect(ind.terminal_p, ohm.terminal_n)
    annotation (Line(points={{-10,10},{-40,10}}, color={0,120,120}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Load_Combined;
