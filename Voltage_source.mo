within EnergyCell;
package Voltage_source
  model One_Phase
    extends EnergyCell.Connectors.OnePin;
    parameter SI.ComplexVoltage V_phase = Complex(230, 0) "Complex line to phase voltage";
  equation
    V = V_phase;
    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
            Rectangle(
            extent={{-80,60},{80,-60}},
            lineColor={28,108,200},
            fillColor={255,213,170},
            fillPattern=FillPattern.Solid)}),                      Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end One_Phase;
end Voltage_source;