within EnergyCell;
package Voltage_source
  model One_Phase

    extends EnergyCell.Connectors.OnePin;

    SI.ComplexVoltage V;
    parameter SI.ComplexVoltage U = Complex( 230, 0);

  equation
    V = U;

    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
            Rectangle(
            extent={{-80,60},{80,-60}},
            lineColor={28,108,200},
            fillColor={255,213,170},
            fillPattern=FillPattern.Solid)}),                      Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end One_Phase;
end Voltage_source;
