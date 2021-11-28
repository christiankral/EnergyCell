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
      annotation (Placement(transformation(extent={{18,-10},{38,10}})));
    Loads_over_time.Office office
      annotation (Placement(transformation(extent={{-40,-10},{-60,10}})));
  equation
    connect(office.p, one_Phase.p)
      annotation (Line(points={{-40,0},{18,0}}, color={0,0,255}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)),
      experiment(StopTime=34444, __Dymola_Algorithm="Dassl"));
  end Baker_over_time;
end Test_Library;
