within EnergyCell.TestingExamples;
model Load_Induktiv
  extends Modelica.Icons.Example;
  PowerSystems.Generic.FixedVoltageSource fixedVoltageSource(redeclare package
      PhaseSystem = PowerSystems.PhaseSystems.ThreePhase_dq, V(displayUnit="V")=
         400) annotation (Placement(transformation(extent={{-80,0},{-60,20}})));
  PowerSystems.Generic.Ground ground
    annotation (Placement(transformation(extent={{62,0},{82,20}})));
  PowerSystems.Generic.Impedance ind(
    redeclare package PhaseSystem = PowerSystems.PhaseSystems.ThreePhase_dq,
    R=0,
    L=1) annotation (Placement(transformation(extent={{-10,0},{10,20}})));
equation
  connect(fixedVoltageSource.terminal, ind.terminal_p)
    annotation (Line(points={{-60,10},{-10,10}}, color={0,120,120}));
  connect(ind.terminal_n, ground.terminal)
    annotation (Line(points={{10,10},{62,10}}, color={0,120,120}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Load_Induktiv;
