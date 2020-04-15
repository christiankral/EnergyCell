within EnergyCell.TestingExamples;
model Generator_with_Load
  extends Modelica.Icons.Example;
  PowerSystems.Generic.Generator generator(f_nom=50, V_nom(displayUnit="V")=
      400) annotation (Placement(transformation(extent={{2,2},{22,22}})));
  PowerSystems.Mechanics.Rotational.Rotor rotor1(J=500)
    annotation (Placement(transformation(extent={{-40,2},{-20,22}})));
  PowerSystems.Generic.PrescribedPowerLoad prescribedPowerLoad
    annotation (Placement(transformation(extent={{58,2},{78,22}})));
  PowerSystems.Blocks.Signals.Transient transSig1(
    t_change=5,
    t_duration=4,
    s_start=1,
    s_end=100)  annotation (Placement(transformation(extent={{40,42},{60,62}})));
  PowerSystems.Generic.Sensors.PMeter pMeter
    annotation (Placement(transformation(extent={{22,2},{42,22}})));
  PowerSystems.Mechanics.Rotational.Speed speed1(w0=314.15926535898)
    annotation (Placement(transformation(extent={{-80,2},{-60,22}})));
equation
  connect(rotor1.flange_b, generator.flange)
    annotation (Line(points={{-20,12},{2,12}}, color={0,0,0}));
  connect(prescribedPowerLoad.terminal,pMeter. terminal_n)
    annotation (Line(points={{58,12},{42,12}}, color={0,120,120}));
  connect(transSig1.y, prescribedPowerLoad.P)
    annotation (Line(points={{60,52},{79,52},{79,12}}, color={0,0,127}));
  connect(pMeter.terminal_p, generator.terminal)
    annotation (Line(points={{22,12},{22,12}}, color={0,120,120}));
  connect(speed1.flange, rotor1.flange_a)
    annotation (Line(points={{-60,12},{-40,12}}, color={0,0,0}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=100,
      __Dymola_NumberOfIntervals=5000,
      __Dymola_Algorithm="Dassl"));
end Generator_with_Load;
