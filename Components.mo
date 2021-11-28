within EnergyCell;
package Components "Building blocks for the energy cell"
  model Impedance "complex Impedance with one Pin"
    parameter SI.ComplexImpedance Z = Complex( 5, 0) "assign a parameter for complex Impedance";
    extends EnergyCell.Connectors.OnePin;
  equation
     V = Z * I "definition of complex impedance using complex Voltage and complex Current";
    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
            Rectangle(extent={{-40,30},{100,-30}},  lineColor={0,0,0}),
          Line(points={{-40,0},{-82,0}}, color={0,0,0}),
          Rectangle(
            extent={{20,30},{40,-30}},
            lineColor={0,0,0},
            fillColor={255,170,85},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{60,30},{80,-30}},
            lineColor={0,0,0},
            fillColor={0,255,255},
            fillPattern=FillPattern.Solid)}),
                                     Diagram(coordinateSystem(preserveAspectRatio=
             false)));
  end Impedance;

  model Line_Impedance "complex Impedance with two Pins"
      parameter SI.ComplexImpedance Z = Complex( 0, 0) "assign a parameter for complex Impedance";

      extends EnergyCell.Connectors.TwoPins;
  equation
     V = Z * I "definition of complex impedance using complex Voltage and complex Current";

    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Line(points={{-60,0},{-92,0}}, color={0,0,0}),
          Line(points={{60,0},{82,0}}, color={0,0,0}),
          Rectangle(
            extent={{-60,20},{0,-20}},
            lineColor={0,0,0},
            fillColor={0,255,255},
            fillPattern=FillPattern.None),
          Line(points={{60,0},{50,20},{40,-20},{30,20},{20,-20},{10,0},{0,0}},
              color={0,0,0})}),                                    Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end Line_Impedance;

  model Load
    final parameter SI.ComplexAdmittance Y = Complex(G, B);
    parameter SI.ActivePower P_ref_threephase = 100 " set activ power to 100 for 100W of effective Power 3 Phase";
    parameter SI.ActivePower P_ref = P_ref_threephase/3;
    parameter SI.ReactivePower Q_ref = 0 "set reactive Power to 0 for a load using only effective Power";
    parameter SI.Voltage V_ref = 230 "Voltage between one Phase and neutral conductor";
    final parameter SI.Conductance G = P_ref_threephase / V_ref^2 "fixed definition of electrical Conductance";
    final parameter SI.Susceptance B = Q_ref / V_ref^2 "fixed definition of electrical Susceptance";

    extends EnergyCell.Connectors.OnePin;

  equation

    I = Y * V "definition of complex Admittance using complex Voltage and complex Current";


    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(extent={{-50,60},{50,-60}}, lineColor={0,0,0}),
          Text(
            extent={{-24,32},{22,-34}},
            lineColor={0,0,0},
            textString="E"),
          Line(points={{-50,0},{-80,0}}, color={0,0,0})}),         Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end Load;

end Components;
