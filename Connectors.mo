within EnergyCell;
package Connectors "pins for the Energycell"

  connector Pin "pins for the power cell"
    SI.ComplexElectricPotential v;
    flow SI.ComplexCurrent i;
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
  annotation ();
end Connectors;
