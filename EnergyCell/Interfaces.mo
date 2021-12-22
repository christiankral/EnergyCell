within EnergyCell;
package Interfaces
  model Variable_load "Interface for diffrent timetable"

    SI.ActivePower P_ref = gain.y "Adopting the values from table for active Power";
    SI.ComplexAdmittance Y = Complex(G, 0) "Definition of admittance ";
    SI.Conductance G = P_ref / V_ref^2 "Definition of Conductance";
    parameter Real k(start=1) "For kWh consumption per year, start value set to 1";
    parameter SI.Voltage V_ref = 230 "Parameters for the voltage";

  //Inheritance of the source code from OnePin
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

  model Variable_generation
    "A generation profile of a south-facing photovoltaic system in the town of Berndorf/Lower Austria"

  parameter Real k(start=1)
                           "k stands for the kWh generated per year";

    SI.ComplexAdmittance Y = Complex(G, 0);
    SI.ActivePower P_ref = gain.y;
    parameter SI.Voltage V_ref = 230;
    SI.Conductance G = P_ref / V_ref^2;

  extends EnergyCell.Connectors.OnePin;

    Modelica.Blocks.Math.Gain gain(k=k) annotation (Placement(transformation(
          extent={{-19,-19},{19,19}},
          rotation=180,
          origin={1,-1})));
    Modelica.Blocks.Sources.CombiTimeTable table(
      smoothness=Modelica.Blocks.Types.Smoothness.MonotoneContinuousDerivative1,
      timeScale=900,
      startTime=0) annotation (Placement(transformation(
          extent={{-22,22},{22,-22}},
          rotation=180,
          origin={98,0})));
  equation
    I = -Y * V;
    connect(table.y[1], gain.u) annotation (Line(points={{73.8,1.77636e-15},{66,1.77636e-15},
            {66,-1},{23.8,-1}}, color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{120,100}}), graphics={
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
            textString="S"),
          Line(
            points={{-60,0},{-80,0}},
            color={0,0,0},
            thickness=0.5)}),                                      Diagram(
          coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{120,
              100}})));
  end Variable_generation;
end Interfaces;
