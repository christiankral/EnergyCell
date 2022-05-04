within EnergyCell;
package Battery
  model Energy_Meter

    SI.ActivePower Pmeter = y;


    extends EnergyCell.Connectors.TwoPins;


    Modelica.Blocks.Interfaces.RealOutput y;

    Modelica.Blocks.Interfaces.RealOutput y1
      annotation (Placement(transformation(extent={{100,-98},{140,-58}}),
          iconTransformation(extent={{100,-98},{140,-58}})));
  equation

    I = Y * V;

    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(extent={{-60,60},{60,-60}}, lineColor={28,108,200}),
          Line(points={{-82,0},{-60,0}}, color={28,108,200}),
          Line(points={{60,0},{82,0}}, color={28,108,200}),
          Text(
            extent={{-34,30},{34,-32}},
            lineColor={28,108,200},
            textString="kWh"),
          Line(points={{100,-80},{0,-80}}, color={28,108,200}),
          Line(points={{0,-80},{0,-60}}, color={28,108,200})}),    Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end Energy_Meter;

  model Batterypack
     extends EnergyCell.Connectors.OnePin;
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));

  end Batterypack;
end Battery;
