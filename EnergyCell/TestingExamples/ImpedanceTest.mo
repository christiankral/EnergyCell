within EnergyCell.TestingExamples;
model ImpedanceTest
  extends Modelica.Icons.Example;

  PowerSystems.Generic.FixedVoltageSource source
    annotation (Placement(transformation(extent={{-80,0},{-60,20}})));
  PowerSystems.Generic.Impedance
    load(R=30, L=10/314)
    annotation (Placement(transformation(extent={{-20,0},{0,20}})));
  PowerSystems.Generic.Ground ground
    annotation (Placement(transformation(extent={{40,0},{60,20}})));
  inner PowerSystems.System system
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
equation
  connect(source.terminal, load.terminal_p)
    annotation (Line(points={{-60,10},{-20,10}}, color={0,120,120}));
  connect(load.terminal_n, ground.terminal)
    annotation (Line(points={{0,10},{40,10}}, color={0,120,120}));
  annotation (experiment(StopTime=1));
end ImpedanceTest;
