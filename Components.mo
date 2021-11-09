within EnergyCell;
package Components "Building blocks for the energy cell"
  model Impedance
    parameter SI.ComplexImpedance Z = Complex( 5, 0);
    extends EnergyCell.Connectors.OnePin;
  equation
     V = Z * I;
    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
            Rectangle(extent={{-100,30},{100,-30}}, lineColor={28,108,200}), Line(
              points={{60,30},{60,-30},{40,-30},{40,28},{40,30},{20,30},{20,-30}},
              color={28,108,200})}), Diagram(coordinateSystem(preserveAspectRatio=
             false)));
  end Impedance;

  model Line_Impedance
      parameter SI.ComplexImpedance Z = Complex( 0, 0);
      extends EnergyCell.Connectors.TwoPins;
  equation
     V = Z * I;


    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(extent={{-60,20},{60,-20}}, lineColor={28,108,200}),
          Line(points={{-60,0},{-92,0}}, color={28,108,200}),
          Line(points={{60,0},{92,0}}, color={28,108,200}),
          Line(points={{18,20},{18,-20}}, color={28,108,200}),
          Line(points={{40,20},{40,-20}}, color={28,108,200})}),   Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end Line_Impedance;

  model Last
    parameter SI.ComplexAdmittance Y = Complex( 0, 0);

    extends EnergyCell.Connectors.OnePin;

  equation
     Y = P / V^2;

    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end Last;
end Components;
