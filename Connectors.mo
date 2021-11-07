within EnergyCell;
package Connectors "pins for the Energycell"
  connector Pin "pins for the power cell"
    SI.ComplexElectricPotential V;
    flow SI.ComplexCurrent I;
  end Pin;

  connector Positive_Pin
    extends Pin;
    annotation (Icon(graphics={Rectangle(
            extent={{-80,80},{80,-80}},
            lineColor={0,0,255},
            fillColor={238,46,47},
            fillPattern=FillPattern.Solid)}));
  end Positive_Pin;

  connector Negative_Pin
    extends Pin;
    annotation (Icon(graphics={Rectangle(
            extent={{-80,80},{80,-80}},
            lineColor={0,0,255},
            fillColor={28,108,200},
            fillPattern=FillPattern.Solid)}));
  end Negative_Pin;

  partial model TwoPins "Two connectors for interconnecting components"
    SI.ComplexVoltage V;
    SI.ComplexCurrent I;
    SI.ActivePower P;
    SI.ComplexPower S;
    SI.ReactivePower Q;
    Positive_Pin p
      annotation (Placement(transformation(extent={{-110,-10},{-90,10}}),
          iconTransformation(extent={{-110,-10},{-90,10}})));
    Negative_Pin n
      annotation (Placement(transformation(extent={{90,-10},{110,10}}),
          iconTransformation(extent={{90,-10},{110,10}})));
  equation
   p.V - n.V = V;
   p.I + n.I = Complex(0, 0);
   p.I = I;
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
      annotation (Placement(transformation(extent={{-110,-10},{-90,10}}),
          iconTransformation(extent={{-110,-10},{-90,10}})));
  equation
   p.V = V;
   p.I = I;
   S = Complex( P, Q);
   S = 3 * V * conj( I);
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)),
                                              Diagram(coordinateSystem(
            preserveAspectRatio=false)));
  end OnePin;
  annotation ();
end Connectors;
