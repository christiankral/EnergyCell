within EnergyCell.TestingExamples;
model Dymola_Source_Comb_Test
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-66,-66},{-46,-46}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V=230)
    annotation (Placement(transformation(extent={{-88,-56},{-68,-36}})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor Hausanschluss_Messung
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-92,-14})));
  Storage_Integration.Household_with_Storage household_with_Storage(g=12, k=5)
    annotation (Placement(transformation(extent={{-80,10},{-60,30}})));
equation
  connect(constantVoltage.n,ground. p) annotation (Line(points={{-68,-46},{-56,
          -46}},                     color={0,0,255}));
  connect(constantVoltage.p, Hausanschluss_Messung.p)
    annotation (Line(points={{-88,-46},{-92,-46},{-92,-24}}, color={0,0,255}));
  connect(Hausanschluss_Messung.n, household_with_Storage.pin_p) annotation (
      Line(points={{-92,-4},{-86,-4},{-86,20},{-80,20}}, color={0,0,255}));
  connect(household_with_Storage.pin_n, ground.p) annotation (Line(points={{-60,
          20},{-58,20},{-58,-46},{-56,-46}}, color={0,0,255}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=31536000,
      __Dymola_NumberOfIntervals=100000,
      __Dymola_Algorithm="Dassl"));
end Dymola_Source_Comb_Test;
