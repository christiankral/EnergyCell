within EnergyCell;
package Test_Library
  model Test
    Voltage_source.One_Phase one_Phase
      annotation (Placement(transformation(extent={{18,-10},{38,10}})));
    Components.Load last
      annotation (Placement(transformation(extent={{-36,-10},{-56,10}})));
  equation
    connect(last.p, one_Phase.p)
      annotation (Line(points={{-36,0},{18,0}}, color={0,0,255}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end Test;

  model Baker_over_time
    Voltage_source.One_Phase one_Phase
      annotation (Placement(transformation(extent={{40,-16},{74,16}})));
    Loads_over_time.Office office
      annotation (Placement(transformation(extent={{-20,-10},{-40,10}})));
    Measurement.Powermeter powermeter
      annotation (Placement(transformation(extent={{-2,-10},{18,10}})));
  equation
    connect(powermeter.n, one_Phase.p)
      annotation (Line(points={{18,0},{40,0}}, color={0,0,0}));
    connect(powermeter.p, office.p)
      annotation (Line(points={{-2,0},{-20,0}}, color={0,0,0}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)),
      experiment(StopTime=34444, __Dymola_Algorithm="Dassl"));
  end Baker_over_time;
end Test_Library;
