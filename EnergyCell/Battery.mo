within EnergyCell;
package Battery

  model Batterypack
    extends EnergyCell.Connectors.OnePin;

    SI.Power Speicherstandladen;
    SI.Power Speicherstandentladen;
    SI.Power Ladung;

    //parameter Real s_0 = 0;
    //parameter Real s_max = 10;




    Modelica.Blocks.Interfaces.RealInput v                       annotation (
        Placement(transformation(
          origin={0,100},
          extent={{-20,-20},{20,20}},
          rotation=270)));
  equation
    S=V*I;

    when {v < 0, v > 0} then
     if v > 0 then
       Speicherstandladen = 0;
       Speicherstandentladen = v;
     else
       Speicherstandladen = v;
       Speicherstandentladen = 0;
     end if;

     Ladung = pre(Ladung) + Speicherstandladen + Speicherstandentladen;

    end when;

                                                        annotation (
        Placement(transformation(
          origin={0,100},
          extent={{-20,-20},{20,20}},
          rotation=270)));
  end Batterypack;

  model Energy_Meter
  SI.ComplexPower Pmess;
  SI.Power Pout = y;


  extends EnergyCell.Connectors.TwoPins;


    Modelica.Blocks.Interfaces.RealOutput y
      annotation (Placement(transformation(extent={{60,40},{100,80}}),
          iconTransformation(extent={{60,40},{100,80}})));
  equation
  S = Complex( 0, 0);
  Pmess = p.V * p.I;
  Pout = real(Pmess);
    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(extent={{-40,40},{40,-40}}, lineColor={28,108,200}),
          Text(
            extent={{22,8},{-20,-8}},
            lineColor={28,108,200},
            textString="M"),
          Line(points={{0,40},{0,60},{60,60}}, color={28,108,200}),
          Line(points={{-80,0},{-40,0}}, color={28,108,200}),
          Line(points={{40,0},{82,0}}, color={28,108,200})}),      Diagram(
          coordinateSystem(preserveAspectRatio=false)),
      __Dymola_DymolaStoredErrors(thetext="model Energy_Meter
SI.ComplexPower Pmess;
SI.Power Pout = y;
parameter Batt = 1;



extends EnergyCell.Connectors.TwoPins;


  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{60,40},{100,80}}),
        iconTransformation(extent={{60,40},{100,80}})));
equation 
S = Complex( 0, 0);
Pmess = p.V * p.I;
Pout = real(Pmess);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(extent={{-40,40},{40,-40}}, lineColor={28,108,200}),
        Text(
          extent={{22,8},{-20,-8}},
          lineColor={28,108,200},
          textString=\"M\"),
        Line(points={{0,40},{0,60},{60,60}}, color={28,108,200}),
        Line(points={{-80,0},{-40,0}}, color={28,108,200}),
        Line(points={{40,0},{82,0}}, color={28,108,200})}),      Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Energy_Meter;
"));
  end Energy_Meter;
end Battery;
