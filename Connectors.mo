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

  model MainConnector "Connectors for consumers and producers"
    SI.ComplexVoltage V;
    SI.ComplexCurrent I;

    Positive_Pin p;
    Negative_Pin n;


    Positive_Pin positive_Pin
      annotation (Placement(transformation(extent={{-10,-8},{10,12}}),
          iconTransformation(extent={{-10,-8},{10,12}})));
  equation
   p.V - n.V = V;
   p.I + n.I = Complex(0, 0);
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)),
                                              Diagram(coordinateSystem(
            preserveAspectRatio=false)),
      __Dymola_DymolaStoredErrors(thetext="model MainConnector \"Connectors for consumers and producers\"
  SI.ComplexVoltage V;
  SI.ComplexCurrent I;

  Positive_Pin p;
  Negative_Pin n;


  Positive_Pin positive_Pin
    annotation (Placement(transformation(extent={{-10,-8},{10,12}}),
        iconTransformation(extent={{-10,-8},{10,12}})));
equation 
 p.V - n.V = V;
 p.I + n.I = (0 0);
 
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)),
                                            Diagram(coordinateSystem(
          preserveAspectRatio=false)));
end MainConnector;
"));
  end MainConnector;
  annotation ();
end Connectors;
