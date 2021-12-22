within EnergyCell;
package Measurement
  model Powermeter_

  SI.ActivePower Pmess = y;

  extends EnergyCell.Connectors.TwoPins;

    Modelica.Blocks.Interfaces.RealOutput y
      annotation (Placement(transformation(extent={{78,40},{118,80}})));
  equation

    I = Y * V;
     annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Ellipse(extent={{-62,60},{58,-60}}, lineColor={0,0,0}),
          Text(
            extent={{-20,58},{16,0}},
            lineColor={0,0,0},
            textString="P"),
          Line(
            points={{-2,0},{36,46}},
            color={0,0,0},
            thickness=0.5),
          Line(
            points={{36,46},{36,28}},
            color={0,0,0},
            thickness=0.5),
          Line(
            points={{36,46},{18,46}},
            color={0,0,0},
            thickness=0.5),
          Rectangle(
            extent={{-62,0},{-84,0}},
            lineColor={0,0,0},
            lineThickness=0.5),
          Line(
            points={{58,0},{80,0}},
            color={0,0,0},
            thickness=0.5)}),                                       Diagram(
          coordinateSystem(preserveAspectRatio=false), graphics={
          Ellipse(extent={{-60,60},{60,-60}}, lineColor={0,0,0}),
          Text(
            extent={{-18,58},{18,0}},
            lineColor={0,0,0},
            textString="P"),
          Line(
            points={{0,0},{38,46}},
            color={0,0,0},
            thickness=0.5),
          Line(
            points={{38,46},{38,28}},
            color={0,0,0},
            thickness=0.5),
          Line(
            points={{38,46},{20,46}},
            color={0,0,0},
            thickness=0.5),
          Rectangle(
            extent={{-60,0},{-82,0}},
            lineColor={0,0,0},
            lineThickness=0.5),
          Line(
            points={{60,0},{82,0}},
            color={0,0,0},
            thickness=0.5),
          Line(points={{80,60},{40,60},{40,44}}, color={0,0,0})}));
  end Powermeter_;

  model Voltmeter
                 "Voltage meter"

  SI.Voltage Vmess = y "Output Voltage on RealOutput y";

  extends EnergyCell.Connectors.OnePin;

    Modelica.Blocks.Interfaces.RealOutput y
      annotation (Placement(transformation(extent={{78,40},{118,80}})));
  equation

  // Ideal voltage measurement no current flow
  I = Complex( 0, 0);
  Vmess = real(V)
                 "Real Part of Voltage";

     annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(
            extent={{-62,0},{-84,0}},
            lineColor={0,0,0},
            lineThickness=0.5),
          Ellipse(extent={{-60,60},{60,-60}}, lineColor={0,0,0}),
          Line(
            points={{0,0},{38,46}},
            color={0,0,0},
            thickness=0.5),
          Line(
            points={{38,46},{38,28}},
            color={0,0,0},
            thickness=0.5),
          Line(
            points={{38,46},{20,46}},
            color={0,0,0},
            thickness=0.5),
          Rectangle(
            extent={{-60,0},{-82,0}},
            lineColor={0,0,0},
            lineThickness=0.5),
          Line(
            points={{60,0},{82,0}},
            color={0,0,0},
            thickness=0.5),
          Text(
            extent={{-14,62},{14,0}},
            lineColor={0,0,0},
            textString="V")}),                                      Diagram(
          coordinateSystem(preserveAspectRatio=false), graphics={
          Ellipse(extent={{-60,60},{60,-60}}, lineColor={0,0,0}),
          Line(
            points={{0,0},{38,46}},
            color={0,0,0},
            thickness=0.5),
          Line(
            points={{38,46},{38,28}},
            color={0,0,0},
            thickness=0.5),
          Line(
            points={{38,46},{20,46}},
            color={0,0,0},
            thickness=0.5),
          Rectangle(
            extent={{-60,0},{-82,0}},
            lineColor={0,0,0},
            lineThickness=0.5),
          Text(
            extent={{-14,62},{14,0}},
            lineColor={0,0,0},
            textString="V"),
          Line(points={{80,60},{40,60},{40,44}}, color={0,0,0})}));
  end Voltmeter;

  model Amperemeter "Current meter"

  SI.Current Imess = y "Output Voltage on RealOutput y";

  extends EnergyCell.Connectors.TwoPins;

    Modelica.Blocks.Interfaces.RealOutput y
      annotation (Placement(transformation(extent={{78,40},{118,80}})));
  equation

    // Ideal current measurement no voltage drop
   V = Complex( 0, 0);
   Imess = abs(I) "Ideal current measurement no voltage drop";

    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Ellipse(extent={{-60,60},{60,-60}}, lineColor={0,0,0}),
          Line(
            points={{0,0},{38,46}},
            color={0,0,0},
            thickness=0.5),
          Line(
            points={{38,46},{38,28}},
            color={0,0,0},
            thickness=0.5),
          Line(
            points={{38,46},{20,46}},
            color={0,0,0},
            thickness=0.5),
          Rectangle(
            extent={{-60,0},{-82,0}},
            lineColor={0,0,0},
            lineThickness=0.5),
          Line(
            points={{60,0},{82,0}},
            color={0,0,0},
            thickness=0.5),
          Text(
            extent={{-14,62},{14,0}},
            lineColor={0,0,0},
            textString="I")}),                                     Diagram(
          coordinateSystem(preserveAspectRatio=false), graphics={
          Ellipse(extent={{-60,60},{60,-60}}, lineColor={0,0,0}),
          Line(
            points={{0,0},{38,46}},
            color={0,0,0},
            thickness=0.5),
          Line(
            points={{38,46},{38,28}},
            color={0,0,0},
            thickness=0.5),
          Line(
            points={{38,46},{20,46}},
            color={0,0,0},
            thickness=0.5),
          Rectangle(
            extent={{-60,0},{-82,0}},
            lineColor={0,0,0},
            lineThickness=0.5),
          Line(
            points={{60,0},{82,0}},
            color={0,0,0},
            thickness=0.5),
          Text(
            extent={{-14,62},{14,0}},
            lineColor={0,0,0},
            textString="I"),
          Line(points={{80,60},{40,60},{40,44}}, color={0,0,0})}));
  end Amperemeter;
end Measurement;
