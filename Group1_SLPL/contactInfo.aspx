<%@ Page Title="Contact Information" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="contactInfo.aspx.vb" Inherits="contactInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">


<h1>Location: </h1><center><p> 123 Unicorn Lane, South Liberty, IA </p>

<h2>Phone Number:</h2><p>(987)654-3210</p>
<h2>Email:</h2><p>slpl@gmail.com</p></center>

<center><h2>Map:</h2>
 <a href="https://maps.google.com/maps?ie=UTF8&cid=10494728181523755767&q=Iowa+City+Public+Library&iwloc=A&gl=US&hl=en"><asp:Image runat="server" Height="500px" 
                        ImageUrl="~/images/mapOfLibrary.jpg" Width="500px" /></a></center>

</asp:Content>