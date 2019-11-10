<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="CloudComputing._Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Regional Health Data Lookup</h1>
                
            </hgroup>
            <div style="margin:0 auto">
                <h2>Enter your zip code or city to show regional health data information for your area</h2>
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
                <b>Cardiovascular Statistics for my county</b>
            </div>
            <div id="cardio" runat="server" style="margin:0 auto">
                <asp:Table ID="CardiovascularTable" runat="server" Style="margin:auto;" Width="90%"></asp:Table>
            </div>
            <div id="pdiv" runat="server">
            <br />
            <div class="krow">
                <div class="kcolumn">
                    <img src="https://markvenas.s3.us-east-2.amazonaws.com/images/CVD+MA_3.jpg" style="width:100%" />
                </div>
                <div class="kcolumn">
                    <img src="https://markvenas.s3.us-east-2.amazonaws.com/images/HI+MA2_3.jpg" style="width:100%" />
                </div>
                <div class="kcolumn">
                    <img src="https://markvenas.s3.us-east-2.amazonaws.com/images/Pov+MA2_3.jpg" style="width:100%" />
                </div>
            </div>
            </div>
            <br />
            <div id="containercloud" runat="server">
                <div>
                    <b><h3 style="text-align:center;">What does the data mean?</h3></b>
                    <p>More and more we are seeing that Health outcomes are determined by epidemiology, for example cardiovascular health, a major determinant of life expectancy, has recently been shown to be majorly affected by factors such as geographic region, and socioeconomic status (City Health Dashboard, 2019).</p>
                    <p><b>Life Expectancy:</b> Although correlation doesn't equal causation, there are a number of factors that contribute to your zip code being a determinant factor of long term health outcomes and life expectancy.  For example, depending on where you live, you may have different levels of access to adequate healthcare.  Even different exposure to environmental stressors like tree cover and particle waste varies depending on your location.  Particulate matter (PM) air pollution has wide-ranging deleterious effects on human health, particularly on the cardiovascular system (Hamanaka, 2018). Other features that affect life expectancy that may correlate with zip code include:</p>
                    <ul>
                        <li><b>Co-location</b> with residents of a particular socioeconomic status, which also raises the potential of having a higher education degree, and earning a better income</li>
                        <ul style="list-style-type:circle;">
                            <li>Persons who earn a better income have better life expectancy outcomes</li>
                            <li>The same is true of persons with a higher degree of education</li>
                        </ul>
                        <li><b>Structural make-up</b> of an area like the amount of walkable space, green space, and concentration of concreted areas.</li>
                        <ul style="list-style-type:circle;">
                            <li>The more green space an area has, the lower the exposure to harmful pollutants, which increases life expectancy outcomes.</li>
                            <li>The higher concentration of concreted areas, the higher temperatures and air particulate concentration, which negatively impacts life expectancy.</li>
                        </ul>
                    </ul>
                    <p><b>Poverty:</b> Poverty is an assessment of the number of persons that fall below a federally defined threshold of income given a number of prescribed factors for each individual.  The level of impoverishment in an area can have an impact on the health outcomes of people living in that area in a few ways:</p>
                    <ul>
                        <li>For example, the <b>quality of</b> tax funded <b>health services</b> can be negatively impacted.</li>
                        <li>The level of household income also correlates with <b>life expectancy</b>.  People of a higher income level have a higher life expectancy.</li>
                        <li>Conversely, the more impoverished an area, the lower the life expectancy of those suffering impoverishment.</li>
                    </ul>
                    <p><b>Cardiovascular health:</b> Cardiovascular disease (CVD) is the leading cause of death in the United States. There are well known clinical risk factors that are linked to cardiovascular disease:</p>
                    <ul>
                        <li>Age</li>
                        <li>Sex</li>
                        <li>Obesity</li>
                        <li>And Smoking</li>
                    </ul>
                    <p>However, there are now well documented economic and sociodemographic risk factors that potentiate an individual’s circumstances with a higher risk of CVD:</p>
                    <ul>
                        <li>Air Pollution</li>
                        <li>Socioeconomic status</li>
                        <li>And neighborhood greenness</li>
                    </ul>
                    <br />
                    <p><b>Do you want to know more?</b>  If you are in an urban area the “City Health Database”  allows users to explore 36 key health social economic environmental and equity factors that impact a community's health and well-being for each of the 500 largest U.S. cities <a href="https://www.cityhealthdashboard.com/about">City Health Dashboard.</a></p>
                    <p><b>Are you eligible for federal benefits in 2019 </b><a href="https://www.thebalance.com/federal-poverty-level-definition-guidelines-chart-3305843">Federal Poverty Guidelines and Chart</a></p>
                    <p><b>Healthcare Professionals: </b>If you are part of the American Hospital Association’s member organizations you can check out the <a href="http://chnafinder.hret.org">American Hospital Association Community Health Needs Assessment (CHNA) Database</a> to find more information about what the primary community health needs are in your area as understood by other healthcare providers?</p>
                    <p>To read more about how poverty is measured in relation to income see the following links:</p>
                    <ul style="list-style-type:none">
                    <li><a href="https://www.thebalance.com/federal-poverty-threshold-3305793">Federal Poverty Threshold</a></li>
                    <li><a href="https://www.census.gov/topics/income-poverty/poverty/guidance/poverty-measures.html">How the Census Bureau Measures Poverty</a></li>
                    <li><a href="https://www.census.gov/programs-surveys/saipe/guidance/strategy.html">Small Area Income and Poverty Estimates (SAIPE) Program</a></li>
                    </ul>
                    <br />
                    <p><b>References:</b></p>
                    <p>City Health Dashboard. (2019). Cardiovascular Disease Deaths. Retrieved from <a href="https://www.cityhealthdashboard.com/metric/41">City Health Dashboard</a></p>
                    <p>Hamanaka, R. B., & Mutlu, G. M. (2018). Particulate Matter Air Pollution: Effects on the Cardiovascular System. Frontiers in endocrinology, 9, 680. doi:10.3389/fendo.2018.00680</p>
                    <p>Cardiovascular Disease: <a href="https://healthdata.gov/dataset/heart-disease-mortality-data-among-us-adults-35-stateterritory-and-county">https://healthdata.gov/dataset/heart-disease-mortality-data-among-us-adults-35-stateterritory-and-county</a></p>
                    <p>Life Expectancy: <a href="https://www.cdc.gov/nchs/nvss/usaleep/usaleep.html#life-expectancy">https://www.cdc.gov/nchs/nvss/usaleep/usaleep.html#life-expectancy</a></p>
                    <p>Percent of population in total poverty: <a href="https://data.ers.usda.gov/reports.aspx?ID=17826&AspxAutoDetectCookieSupport=1">https://data.ers.usda.gov/reports.aspx?ID=17826&AspxAutoDetectCookieSupport=1</a></p>
                    <p>Images on website: <a href="https://nccd.cdc.gov/DHDSPAtlas/Default.aspx?state=MA">Interactive Analysis of Heart Disease and Stroke</a></p>
                    

                </div>
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
