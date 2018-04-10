FactoryBot.define do
 factory :station do
   attributes =
   {
     "MonitoringLocationIdentity"=>
       {"MonitoringLocationIdentifier"=>"11NPSWRD-GRSA_NURE_0145",
        "MonitoringLocationName"=>"C29663",
        "MonitoringLocationTypeName"=>"River/Stream",
        "MonitoringLocationDescriptionText"=>"The station is located on the BLANCA PEAK, COLORADO 1:24000 scale series topographic quadrangle.  The site, described as a stream, was retrieved from the online USGS Open-File Report 97-492, 'National Geochemical Database, Reformatted Data from the National Uranium Resource Evaluation (NURE) Hydrogeochemical and Stream Sediment Reconnaissance (HSSR) Program' Version 1.4 (2006).  The 'LASLID' (Los Alamos Scientific Laboratory Site Identification Number) field entry was used to create the Station Name.",
        "DrainageAreaMeasure"=>
          {"MeasureValue"=>"120", "MeasureUnitCode"=>"sq mi"}},
     "MonitoringLocationGeospatial"=>
       {"LatitudeMeasure"=>"37.5636",
        "LongitudeMeasure"=>"-105.4392"}
   }

   initialize_with { new(attributes) }
 end
end
