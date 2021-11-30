within EnergyCell;
package Connectors "pins for the Energycell"
  connector Pin "Pins for the power cell"
    SI.ComplexElectricPotential V "Import complex Voltage for Pin";
    flow SI.ComplexCurrent I "Import complex Current for Pin";
  end Pin;

  connector Positive_Pin "Positiv Pin for Library"
    //Inheritance of the source code from Pin
    extends Pin;
    annotation (Icon(graphics={Rectangle(
            extent={{-80,80},{80,-80}},
            lineColor={0,0,0},
            fillColor={238,46,47},
            fillPattern=FillPattern.Solid)}));
  end Positive_Pin;

  connector Negative_Pin "Negative Pin for Library"
    //Inheritance of the source code from Pin
    extends Pin;
    annotation (Icon(graphics={Rectangle(
            extent={{-80,80},{80,-80}},
            lineColor={0,0,0},
            fillColor={28,108,200},
            fillPattern=FillPattern.Solid)}));
  end Negative_Pin;

  partial model TwoPins "Two connectors for interconnecting components"
    SI.ComplexVoltage V "Deposit complex Voltage for TwoPins Connector";
    SI.ComplexCurrent I "Deposit complex Current for TwoPins Connector";
    SI.ActivePower P "Deposit active Power for TwoPins Connector";
    SI.ComplexPower S "Deposit apparent Power for TwoPins Connector";
    SI.ReactivePower Q "Deposit reactive Power for TwoPins Connector";
    Positive_Pin p
      annotation (Placement(transformation(extent={{-124,-24},{-76,24}}),
          iconTransformation(extent={{-124,-24},{-76,24}})));
    Negative_Pin n
      annotation (Placement(transformation(extent={{76,-24},{124,24}}),
          iconTransformation(extent={{76,-24},{124,24}})));
  equation
   p.V - n.V = V "Definition of potential Voltage diffrent";
   p.I + n.I = Complex(0, 0) "Definition or current (Sum of currents is 0)";
   S = Complex( P, Q) "Describe the apparent power by active Power and reactive Power";
   S = 3 * V * conj( I) "Definition of apparent Power consisting of complex Voltage and complex Current";
   p.I = I "Definition of complex Current";
   annotation (Icon(coordinateSystem(preserveAspectRatio=false)),
                                              Diagram(coordinateSystem(
            preserveAspectRatio=false)));
  end TwoPins;

  partial model OnePin "One connectors for modeling loads and sources"
    SI.ComplexVoltage V "Complex phase to neutral voltage";
    SI.ComplexCurrent I "Complex line current";
    SI.ActivePower P "Active power";
    SI.ComplexPower S "Complex apparent power";
    SI.ReactivePower Q "Reactive power";
    Positive_Pin p
      annotation (Placement(transformation(extent={{-124,-24},{-76,24}}),
          iconTransformation(extent={{-124,-24},{-76,24}})));
  equation
   p.V = V "Definition of potential Voltage diffrent";
   p.I = I "Definition of complex Current";
   S = Complex( P, Q) "Describe the apparent power by active Power and reactive Power";
   S = 3 * V * conj( I) "Definition of apparent Power consisting of complex Voltage and complex Current";
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)),
                                              Diagram(coordinateSystem(
            preserveAspectRatio=false)));
  end OnePin;
  annotation ();
end Connectors;
