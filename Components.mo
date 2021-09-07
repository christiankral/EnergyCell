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
end Components;
