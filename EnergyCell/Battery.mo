within EnergyCell;
package Battery

  model Batterypack
    extends EnergyCell.Connectors.OnePin;

    Real Speicherstandladen;
    Real Speicherstandentladen;
    Real Ladung;
    Real Ladestand;
    Real Ladung_Tatsaechlich;
    Real Strom;
    Real Energiemenge;
    Real e_max;
    parameter Real e_min = 0;
    parameter Real Akkugroesse;
    SI.ActivePower P_ref = Ladung_Tatsaechlich "Adopting the values from table for active Power";
    SI.ComplexAdmittance Y = Complex(G, 0) "Definition of admittance ";
    SI.Conductance G = P_ref / V_ref^2 "Definition of Conductance";
    parameter SI.Voltage V_ref = 230 "Parameters for the voltage";







    Modelica.Blocks.Interfaces.RealInput v                       annotation (
        Placement(transformation(
          origin={0,100},
          extent={{-20,-20},{20,20}},
          rotation=270)));
  equation
     I = Y * V;
    v=real( V)*Strom;
    Energiemenge = real(V) * Strom *3600;// J
    e_max = 3.6e+6 * Akkugroesse;// J

    when sample(0,100) then
     if v > 0 then
       Speicherstandladen = Energiemenge;
       Speicherstandentladen = 0;
     else
       Speicherstandladen = 0;
       Speicherstandentladen = Energiemenge;
     end if;

     Ladung = Speicherstandladen + Speicherstandentladen;//J

     if Ladung > 0 then
       if pre(Ladestand) + Ladung <= e_max then
         Ladestand = pre(Ladestand) + Ladung;
         Ladung_Tatsaechlich = Ladung;
       else
         Ladestand = e_max;
         Ladung_Tatsaechlich = e_max - pre(Ladestand);
       end if;
     else
       if pre(Ladestand) + Ladung >= e_min then
         Ladestand = pre(Ladestand) + Ladung;
         Ladung_Tatsaechlich = Ladung;
       else
         Ladestand = e_min;
         Ladung_Tatsaechlich = pre(Ladestand);
       end if;
     end if;
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
