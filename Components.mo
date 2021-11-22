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
          Line(points={{20,20},{20,-20}}, color={28,108,200}),
          Line(points={{40,20},{40,-20}}, color={28,108,200})}),   Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end Line_Impedance;

  model Last
    parameter SI.ComplexAdmittance Y = Complex( 5, 0);
    parameter SI.ActivePower P_ref = Real( 100);
    parameter SI.ReactivePower Q_ref = Real( 0);
    SI.Conductance  G;
    SI.Susceptance B;


    extends EnergyCell.Connectors.OnePin;

  equation

    G = P_ref / V_ref^2;
    B = Q_ref / V_ref^2;

    Y = P_ref + Q_ref / V_ref^2
    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
            Rectangle(extent={{-60,40},{60,-40}}, lineColor={28,108,200}), Line(
              points={{-92,0},{-60,0}}, color={28,108,200})}),     Diagram(
          coordinateSystem(preserveAspectRatio=false)));

    annotation (__Dymola_DymolaStoredErrors(thetext="model Last
  parameter SI.ComplexAdmittance Y = Complex( 5, 0);
  parameter SI.ActivePower P_ref = Real( 100);
  parameter SI.ReactivePower Q_ref = Real( 0);
  SI.Conductance G;
  SI.Susceptance B;


  extends EnergyCell.Connectors.OnePin;

equation 

  G = P_ref / V_ref^2;
  B = Q_ref / V_ref^2;

  \"Y = P_ref + Q_ref / V_ref^2\"
  
  \"Y = G+jB;\"
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(extent={{-60,40},{60,-40}}, lineColor={28,108,200}), Line(
            points={{-92,0},{-60,0}}, color={28,108,200})}),     Diagram(
        coordinateSystem(preserveAspectRatio=false)));

end Last;
"));
  end Last;
end Components;
