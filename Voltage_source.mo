within EnergyCell;
package Voltage_source
  model One_Phase
    SI.ComplexVoltage V;
    parameter SI.ComplexVoltage U = Complex( 230, 0);

  equation
    V = U;

    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end One_Phase;
end Voltage_source;
