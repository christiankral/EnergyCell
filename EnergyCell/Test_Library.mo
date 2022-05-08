within EnergyCell;
package Test_Library
  model Voltage_and_Source
    extends Modelica.Icons.Example;
    Voltage_source.One_Phase one_Phase
      annotation (Placement(transformation(extent={{88,-10},{108,10}})));
    Source_over_time.PV_Berndorf pV_Berndorf(k=1)
      annotation (Placement(transformation(extent={{-26,-10},{-48,10}})));
    Loads_over_time.Bakery bakery(k=1)
      annotation (Placement(transformation(extent={{-26,-38},{-46,-18}})));
    Components.Line_Impedance line_Impedance(l=150, A=10)
      annotation (Placement(transformation(extent={{6,-10},{26,10}})));
    Measurement.Powermeter powermeter
      annotation (Placement(transformation(extent={{66,-10},{46,10}})));
  equation
    connect(pV_Berndorf.p, line_Impedance.p)
      annotation (Line(points={{-26,0},{6,0}}, color={0,0,0}));
    connect(bakery.p, line_Impedance.p) annotation (Line(points={{-26,-28},{-10,
            -28},{-10,0},{6,0}}, color={0,0,0}));
    connect(powermeter.p, one_Phase.p)
      annotation (Line(points={{66,0},{88,0}}, color={0,0,0}));
    connect(powermeter.n, line_Impedance.n)
      annotation (Line(points={{46,0},{26,0}}, color={0,0,0}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end Voltage_and_Source;

  model Voltage_and_Load
    extends Modelica.Icons.Example;
    Voltage_source.One_Phase one_Phase(V_ref=Complex(250, 5))
      annotation (Placement(transformation(extent={{40,-16},{74,16}})));
    Loads_over_time.Office office
      annotation (Placement(transformation(extent={{-20,-10},{-40,10}})));
  equation
    connect(one_Phase.p, office.p)
      annotation (Line(points={{40,0},{-20,0}}, color={0,0,0}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)),
      experiment(StopTime=34444, __Dymola_Algorithm="Dassl"));
  end Voltage_and_Load;

  model Ampermeter
    extends Modelica.Icons.Example;
    Voltage_source.One_Phase one_Phase(V_ref=Complex(250, 5))
      annotation (Placement(transformation(extent={{30,-16},{64,16}})));
    Loads_over_time.Office office
      annotation (Placement(transformation(extent={{-30,-10},{-50,10}})));
    Measurement.Amperemeter amperemeter
      annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  equation
    connect(amperemeter.n, one_Phase.p)
      annotation (Line(points={{10,0},{30,0}}, color={0,0,0}));
    connect(amperemeter.p, office.p)
      annotation (Line(points={{-10,0},{-30,0}}, color={0,0,0}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end Ampermeter;

  model Ampermeter_and_Voltmeter
    extends Modelica.Icons.Example;
    Voltage_source.One_Phase one_Phase(V_ref=Complex(250, 5))
      annotation (Placement(transformation(extent={{32,-16},{66,16}})));
    Loads_over_time.Office office
      annotation (Placement(transformation(extent={{-28,-10},{-48,10}})));
    Measurement.Amperemeter amperemeter
      annotation (Placement(transformation(extent={{-8,-10},{12,10}})));
    Measurement.Voltmeter voltmeter
      annotation (Placement(transformation(extent={{-8,-30},{12,-10}})));
  equation
    connect(amperemeter.n, one_Phase.p)
      annotation (Line(points={{12,0},{32,0}}, color={0,0,0}));
    connect(amperemeter.p, office.p)
      annotation (Line(points={{-8,0},{-28,0}}, color={0,0,0}));
    connect(voltmeter.p, office.p) annotation (Line(points={{-8,-20},{-12,-20},{-12,
            0},{-28,0}}, color={0,0,0}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end Ampermeter_and_Voltmeter;

  model Voltage_and_Lineimpedance
    extends Modelica.Icons.Example;
    Voltage_source.One_Phase one_Phase(V_ref=Complex(250, 5))
      annotation (Placement(transformation(extent={{30,-16},{64,16}})));
    Loads_over_time.Office office
      annotation (Placement(transformation(extent={{-78,-10},{-98,10}})));
    Measurement.Amperemeter amperemeter
      annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
    Measurement.Voltmeter voltmeter
      annotation (Placement(transformation(extent={{-10,-30},{10,-10}})));
    Components.Line_Impedance line_Impedance(l=100, A=0.000100)
      annotation (Placement(transformation(extent={{-46,-10},{-26,10}})));
  equation
    connect(amperemeter.n, one_Phase.p)
      annotation (Line(points={{10,0},{30,0}}, color={0,0,0}));
    connect(office.p, line_Impedance.p)
      annotation (Line(points={{-78,0},{-46,0}}, color={0,0,0}));
    connect(line_Impedance.n, amperemeter.p)
      annotation (Line(points={{-26,0},{-10,0}}, color={0,0,0}));
    connect(voltmeter.p, line_Impedance.p) annotation (Line(points={{-10,-20},{-60,
            -20},{-60,0},{-46,0}}, color={0,0,0}));
    annotation (
      Icon(coordinateSystem(preserveAspectRatio=false)),
      Diagram(coordinateSystem(preserveAspectRatio=false)),
      experiment(StopTime=31536000, __Dymola_Algorithm="Dassl"));
  end Voltage_and_Lineimpedance;
end Test_Library;
