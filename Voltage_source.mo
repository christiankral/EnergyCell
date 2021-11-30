within EnergyCell;
package Voltage_source
  model One_Phase "fix Voltage Source"

    parameter SI.ComplexVoltage V_ref = Complex(230, 0) "Complex line to phase voltage";

    //Inheritance of the source code from Pin
    extends EnergyCell.Connectors.OnePin;

  equation
    V = V_ref;
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-120},
              {140,120}}), graphics={
          Ellipse(
            extent={{-30,60},{90,-60}},
            lineColor={0,0,0},
            startAngle=0,
            endAngle=360),
          Text(
            extent={{-22,36},{82,-10}},
            lineColor={0,0,0},
            textString="V"),
          Text(
            extent={{-38,10},{98,-52}},
            lineColor={0,0,0},
            textString="~"),
          Line(points={{-30,0},{-82,0}}, color={0,0,0})}),         Diagram(
          coordinateSystem(preserveAspectRatio=false, extent={{-100,-120},{140,120}})));
  end One_Phase;
end Voltage_source;
