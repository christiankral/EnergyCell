within EnergyCell.TestingExamples;
model Akku_test
  extends Modelica.Icons.Example;
  parameter Modelica.Electrical.Batteries.ParameterRecords.CellData cellData1(
    Qnom=18000,
    OCVmax=4.2,
    OCVmin=2.5,
    Ri=cellData1.OCVmax/1200)
    annotation (Placement(transformation(extent={{60,80},{80,100}})));
  Modelica.Electrical.Batteries.BatteryStacks.CellStack battery1(
    Ns=1,
    Np=1,
    cellData=cellData1,
    useHeatPort=false,
    SOC(fixed=true, start=0.95)) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={40,20})));
  Modelica.Electrical.Analog.Basic.Ground ground1
    annotation (Placement(transformation(extent={{10,-20},{30,0}})));
  Modelica.Electrical.Analog.Sources.SignalCurrent signalCurrent1
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-18,20})));
  Modelica.Electrical.Analog.Sensors.PowerSensor powerSensor1
    annotation (Placement(transformation(extent={{10,50},{30,70}})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={90,20})));
  Modelica.Blocks.Logical.LessEqualThreshold lessEqualThreshold(threshold=4.2)
    annotation (Placement(transformation(extent={{140,40},{160,60}})));
  Modelica.Blocks.Logical.GreaterEqualThreshold greaterEqualThreshold(threshold=
       2.5) annotation (Placement(transformation(extent={{140,0},{160,20}})));
  Modelica.Blocks.Sources.Constant const2(k=10)
    annotation (Placement(transformation(extent={{-100,10},{-80,30}})));
  Modelica.Blocks.Logical.And and1
    annotation (Placement(transformation(extent={{180,20},{200,40}})));
  Modelica.Blocks.Logical.Switch switch1
    annotation (Placement(transformation(extent={{-66,2},{-46,22}})));
  Modelica.Blocks.Sources.Constant const1(k=0)
    annotation (Placement(transformation(extent={{-100,-20},{-80,0}})));
equation
  connect(battery1.n,ground1. p)
    annotation (Line(points={{40,10},{40,0},{20,0}},   color={0,0,255}));
  connect(powerSensor1.nc,battery1. p)
    annotation (Line(points={{30,60},{40,60},{40,30}}, color={0,0,255}));
  connect(powerSensor1.nv,ground1. p)
    annotation (Line(points={{20,50},{20,0}},  color={0,0,255}));
  connect(powerSensor1.pc,powerSensor1. pv)
    annotation (Line(points={{10,60},{10,70},{20,70}}, color={0,0,255}));
  connect(voltageSensor.p, battery1.p)
    annotation (Line(points={{90,30},{40,30}}, color={0,0,255}));
  connect(voltageSensor.n, battery1.n)
    annotation (Line(points={{90,10},{40,10}}, color={0,0,255}));
  connect(voltageSensor.v, lessEqualThreshold.u) annotation (Line(points={{79,
          20},{108,20},{108,50},{138,50}}, color={0,0,127}));
  connect(greaterEqualThreshold.u, voltageSensor.v) annotation (Line(points={{
          138,10},{108,10},{108,20},{79,20}}, color={0,0,127}));
  connect(lessEqualThreshold.y, and1.u1) annotation (Line(points={{161,50},{170,
          50},{170,30},{178,30}}, color={255,0,255}));
  connect(greaterEqualThreshold.y, and1.u2) annotation (Line(points={{161,10},{
          170,10},{170,22},{178,22}}, color={255,0,255}));
  connect(ground1.p, signalCurrent1.n)
    annotation (Line(points={{20,0},{-18,0},{-18,10}}, color={0,0,255}));
  connect(const2.y, switch1.u1)
    annotation (Line(points={{-79,20},{-68,20}}, color={0,0,127}));
  connect(switch1.y, signalCurrent1.i) annotation (Line(points={{-45,12},{-38,
          12},{-38,20},{-30,20}}, color={0,0,127}));
  connect(and1.y, switch1.u2) annotation (Line(points={{201,30},{208,30},{208,
          -60},{-76,-60},{-76,12},{-68,12}}, color={255,0,255}));
  connect(const1.y, switch1.u3) annotation (Line(points={{-79,-10},{-74,-10},{
          -74,4},{-68,4}}, color={0,0,127}));
  connect(powerSensor1.pc, signalCurrent1.p)
    annotation (Line(points={{10,60},{-18,60},{-18,30}}, color={0,0,255}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=6000,
      __Dymola_NumberOfIntervals=10000,
      Tolerance=1e-05,
      __Dymola_Algorithm="Dassl"));
end Akku_test;
