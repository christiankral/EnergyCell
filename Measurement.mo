within EnergyCell;
package Measurement
  model Powermeter
    parameter SI.ComplexPower Pm = Complex( 0, 0);

    parameter SI.Voltage V_ref = 230;

  extends EnergyCell.Connectors.TwoPins;

  equation


    Pm = V_ref * I;

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
            thickness=0.5)}));
  end Powermeter;
end Measurement;
