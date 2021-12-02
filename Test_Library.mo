within EnergyCell;
package Test_Library
  model Test
    Voltage_source.One_Phase one_Phase
      annotation (Placement(transformation(extent={{18,-10},{38,10}})));
    Source_over_time.PV_Berndorf pV_Berndorf
      annotation (Placement(transformation(extent={{-26,-10},{-48,10}})));
  equation
    connect(pV_Berndorf.p, one_Phase.p)
      annotation (Line(points={{-26,0},{18,0}}, color={0,0,0}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end Test;

  model Baker_over_time
    Voltage_source.One_Phase one_Phase
      annotation (Placement(transformation(extent={{40,-16},{74,16}})));
    Loads_over_time.Office office
      annotation (Placement(transformation(extent={{-20,-10},{-40,10}})));
    Measurement.Amperemeter amperemeter
      annotation (Placement(transformation(extent={{0,-10},{20,10}})));
  equation
    connect(amperemeter.n, one_Phase.p)
      annotation (Line(points={{20,0},{40,0}}, color={0,0,0}));
    connect(amperemeter.p, office.p)
      annotation (Line(points={{0,0},{-20,0}}, color={0,0,0}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)),
      experiment(StopTime=34444, __Dymola_Algorithm="Dassl"));
  end Baker_over_time;
end Test_Library;
