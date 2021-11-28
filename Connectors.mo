within EnergyCell;
package Connectors "pins for the Energycell"
  connector Pin "pins for the power cell"
    SI.ComplexElectricPotential V "import complex Voltage for Pin";
    flow SI.ComplexCurrent I "import complex Current for Pin";
  end Pin;

  connector Positive_Pin "positiv Pin for Library"
    extends Pin;
    annotation (Icon(graphics={Rectangle(
            extent={{-80,80},{80,-80}},
            lineColor={0,0,255},
            fillColor={238,46,47},
            fillPattern=FillPattern.Solid)}));
  end Positive_Pin;

  connector Negative_Pin "negative Pin for Library"
    extends Pin;
    annotation (Icon(graphics={Rectangle(
            extent={{-80,80},{80,-80}},
            lineColor={0,0,255},
            fillColor={28,108,200},
            fillPattern=FillPattern.Solid)}));
  end Negative_Pin;

  partial model TwoPins "Two connectors for interconnecting components"
    SI.ComplexVoltage V "deposit complex Voltage for TwoPins Connector";
    SI.ComplexCurrent I "deposit complex Current for TwoPins Connector";
    SI.ActivePower P "deposit active Power for TwoPins Connector";
    SI.ComplexPower S "deposit apparent Power for TwoPins Connector";
    SI.ReactivePower Q "deposit reactive Power for TwoPins Connector";
    Positive_Pin p
      annotation (Placement(transformation(extent={{-124,-24},{-76,24}}),
          iconTransformation(extent={{-124,-24},{-76,24}})));
    Negative_Pin n
      annotation (Placement(transformation(extent={{76,-24},{124,24}}),
          iconTransformation(extent={{74,-26},{122,22}})));
  equation
   p.V - n.V = V "definition of potential Voltage diffrent";
   p.I + n.I = Complex(0, 0) "definition or current (Sum of currents is 0)";
   S = Complex( P, Q) "describe the apparent power by active Power and reactive Power";
   S = 3 * V * conj( I) "definition of apparent Power consisting of complex Voltage and complex Current";
   p.I = I "definition of complex Current";
    connect(n, n) annotation (Line(points={{100,0},{100,0}}, color={0,0,255}));
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
   p.V = V "definition of potential Voltage diffrent";
   p.I = I "definition of complex Current";
   S = Complex( P, Q) "describe the apparent power by active Power and reactive Power";
   S = 3 * V * conj( I) "definition of apparent Power consisting of complex Voltage and complex Current";
    connect(p, p)
      annotation (Line(points={{-100,0},{-100,0}}, color={0,0,255}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)),
                                              Diagram(coordinateSystem(
            preserveAspectRatio=false)));
  end OnePin;
  annotation ();
end Connectors;
