within EnergyCell;
package Test_Library
  model Test
    Voltage_source.One_Phase one_Phase
      annotation (Placement(transformation(extent={{18,-10},{38,10}})));
    Components.Last last
      annotation (Placement(transformation(extent={{-36,-10},{-56,10}})));
  equation
    connect(last.p, one_Phase.p)
      annotation (Line(points={{-36,0},{18,0}}, color={0,0,255}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end Test;
end Test_Library;
