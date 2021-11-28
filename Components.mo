within EnergyCell;
package Components "Building blocks for the energy cell"
  model Impedance "complex Impedance with one Pin"
    parameter SI.ComplexImpedance Z = Complex( 5, 0) "assign a parameter for complex Impedance";
    extends EnergyCell.Connectors.OnePin;
  equation
     V = Z * I "definition of complex impedance using complex Voltage and complex Current";
    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
            Rectangle(extent={{-100,30},{100,-30}}, lineColor={28,108,200}), Line(
              points={{60,30},{60,-30},{40,-30},{40,28},{40,30},{20,30},{20,-30}},
              color={28,108,200})}), Diagram(coordinateSystem(preserveAspectRatio=
             false)));
  end Impedance;

  model Line_Impedance "complex Impedance with two Pins"
      parameter SI.ComplexImpedance Z = Complex( 0, 0) "assign a parameter for complex Impedance";

      extends EnergyCell.Connectors.TwoPins;
  equation
     V = Z * I "definition of complex impedance using complex Voltage and complex Current";

    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(extent={{-60,20},{60,-20}}, lineColor={28,108,200}),
          Line(points={{-60,0},{-92,0}}, color={28,108,200}),
          Line(points={{60,0},{92,0}}, color={28,108,200}),
          Line(points={{20,20},{20,-20}}, color={28,108,200}),
          Line(points={{40,20},{40,-20}}, color={28,108,200})}),   Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end Line_Impedance;

  model Load
    final parameter SI.ComplexAdmittance Y = Complex(G, B);
    parameter SI.ActivePower P_ref = 100 " set activ power to 100 for 100W of effective Power 3 Phase";
    parameter SI.ActivePower P_ref_onephase = P_ref/3;
    parameter SI.ReactivePower Q_ref = 0 "set reactive Power to 0 for a load using only effective Power";
    parameter SI.Voltage V_ref = 230 "Voltage between one Phase and neutral conductor";
    final parameter SI.Conductance G = P_ref_onephase / V_ref^2 "fixed definition of electrical Conductance";
    final parameter SI.Susceptance B = Q_ref / V_ref^2 "fixed definition of electrical Susceptance";

    extends EnergyCell.Connectors.OnePin;

  equation

    I = Y * V "definition of complex Admittance using complex Voltage and complex Current";


    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
            Rectangle(extent={{-60,40},{60,-40}}, lineColor={28,108,200}), Line(
              points={{-92,0},{-60,0}}, color={28,108,200})}),     Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end Load;

  package Measurement
  end Measurement;
end Components;
