<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="CloudComputing._Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Massachusetts Life Expectancy</h1>
                
            </hgroup>
            <div style="margin:0 auto">
                <h2>Enter your zip code or city to show life expectancy information for your area</h2>
                <asp:TextBox ID="txtLocation" runat="server"  Height="26px" Width="352px"></asp:TextBox>&nbsp&nbsp
                <asp:Button ID="btnSubmit" runat="server" Text="Search" />
            </div>
                
                <!--To learn more about ASP.NET, visit <a href="http://asp.net" title="ASP.NET Website">http://asp.net</a>.
                The page features <mark>videos, tutorials, and samples</mark> to help you get the most from ASP.NET.
                If you have any questions about ASP.NET visit <a href="http://forums.asp.net/18.aspx" title="ASP.NET Forum">our forums</a>.-->
            <div style="margin:0 auto">
                <h3><asp:Label ID="lblResults" runat="server"></asp:Label></h3>
                <asp:Table ID="LifeExpectancyTable" runat="server" Style="margin:auto;" Width="90%"></asp:Table>
                <h3><asp:Label ID="lblMessage" runat="server"></asp:Label></h3>
            </div>
            <div id="cardioheading" runat="server" style="text-align:center;font-size:large;">
                <b>Cardiovascular Statistics</b>
            </div>
            <div id="cardio" runat="server" style="margin:0 auto">
                <asp:Table ID="CardiovascularTable" runat="server" Style="margin:auto;" Width="90%"></asp:Table>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <!--<h3>We suggest the following:</h3>
    <ol class="round">
        <li class="one">
            <h5>Getting Started</h5>
            ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
            <a href="http://go.microsoft.com/fwlink/?LinkId=245146">Learn more…</a>
        </li>
        <li class="two">
            <h5>Add NuGet packages and jump-start your coding</h5>
            NuGet makes it easy to install and update free libraries and tools.
            <a href="http://go.microsoft.com/fwlink/?LinkId=245147">Learn more…</a>
        </li>
        <li class="three">
            <h5>Find Web Hosting</h5>
            You can easily find a web hosting company that offers the right mix of features and price for your applications.
            <a href="http://go.microsoft.com/fwlink/?LinkId=245143">Learn more…</a>
        </li>
    </ol>-->
</asp:Content>
