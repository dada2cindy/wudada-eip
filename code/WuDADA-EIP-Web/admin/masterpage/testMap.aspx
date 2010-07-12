<%@ Page Language="C#" AutoEventWireup="true" CodeFile="testMap.aspx.cs" Inherits="admin_masterpage_testMap" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MAP</title>
     <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAA-aWzeXZzb2erLxHs9uO0GhR7tCGSxHqBYteMGl2e75HAQnVqdRTskvZqM-9lGi-Lbkd346AVNoH6hg" type="text/javascript"></script>

<script type="text/javascript">

    //<![CDATA[
    var geocoder;
    var map;

    //var address = "高雄市火車站";
    var address = "<%= this.address %>";

    // On page load, call this function
    function load()
     {
         // Create new map object
         map = new GMap2(document.getElementById("map"));

         // Create new geocoding object
         geocoder = new GClientGeocoder();

         // Retrieve location information, pass it to addToMap()
         geocoder.getLocations(address, addToMap);

     }

     // This function adds the point to the map
     function addToMap(response) 
     {
         // Retrieve the object
         place = response.Placemark[0];

         // Retrieve the latitude and longitude
         point = new GLatLng(place.Point.coordinates[1], place.Point.coordinates[0]);

         // Center the map on this point
         map.setCenter(point, 13);

         // Create a marker
         marker = new GMarker(point);

         // Add the marker to map
         map.addOverlay(marker);

         // Add address information to marker
         marker.openInfoWindowHtml(place.address);

     }

     //]]>
</script>

</head>
<body onload="load()" onunload="GUnload()">
    <form id="form1" runat="server">
    <div>
     <asp:TextBox ID="TextBox1" runat="server" Width="400px"></asp:TextBox>
       <div id="map" style="width: 100%; height: 500px; border-right: black thin solid; border-top: black thin solid; border-left: black thin solid; border-bottom: black thin solid;"></div>
       
       
    </div>
    </form>
</body>
</html>
