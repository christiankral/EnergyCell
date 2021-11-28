within EnergyCell;
package Interfaces
  model Variable_load " interface for diffrent timetable"

  parameter Real k(start=1) "k stands for the kWh consumption per year";
    SI.ComplexAdmittance Y = Complex(G, 0);
    SI.ActivePower P_ref = gain.y;
    parameter SI.Voltage V_ref = 230;
    SI.Conductance G = P_ref / V_ref^2;

  extends EnergyCell.Connectors.OnePin;

    Modelica.Blocks.Math.Gain gain(k=k) annotation (Placement(transformation(
          extent={{-20,20},{20,-20}},
          rotation=180,
          origin={0,0})));
    Modelica.Blocks.Sources.CombiTimeTable table(
      smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,
      timeScale=900,
      startTime=0) annotation (Placement(transformation(
          extent={{-20,20},{20,-20}},
          rotation=180,
          origin={80,0})));

  equation

    I = Y * V;

    connect(table.y[1], gain.u)
      annotation (Line(points={{58,1.77636e-15},{52,1.77636e-15},{52,0},{20,0},
            {20,-2.88658e-15},{24,-2.88658e-15}},  color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(
            extent={{-60,80},{60,-80}},
            lineColor={0,0,0},
            fillColor={0,255,255},
            fillPattern=FillPattern.None,
            lineThickness=0.5),
          Text(
            extent={{-18,32},{18,-34}},
            lineColor={0,0,0},
            fillColor={0,255,255},
            fillPattern=FillPattern.None,
            textString="E"),
          Line(
            points={{-60,0},{-80,0}},
            color={0,0,0},
            thickness=0.5)}),                                      Diagram(
          coordinateSystem(preserveAspectRatio=false), graphics={Line(points={{-24,
                0},{-82,0}}, color={28,108,200})}));
  end Variable_load;
end Interfaces;