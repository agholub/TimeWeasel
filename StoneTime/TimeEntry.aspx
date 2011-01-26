<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="TimeEntry.aspx.cs" Inherits="TimeEntry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <script type="text/javascript">
        function numericOnly(fld) {
            var iKeyCode = event.keyCode,
                 reValidChars = /[0123456789.]/,
            strKey = String.fromCharCode(iKeyCode);
            if (!reValidChars.test(strKey)) {
                return false;
            } 
        }
        function Validate(objName) {
            var checkStr = objName;
            var allValid = true;
            var allNum = "";
            var OK = "0123456789.";
            var ch = "";
            var i = 0;

            //reset color
            document.activeElement.style.color = 'black'
            for (i = 0; i < checkStr.value.length; i++) {
                ch = checkStr.value.charAt(i);
                for (j = 0; j < OK.length; j++)

                    if (ch == OK.charAt(j))
                        break;
                if (j == OK.length) {
                    allValid = false;
                    break;
                }
                if (ch != ",")
                    allNum += ch;
                break;
            }
            if (checkStr.value >= 24) {
                allValid = false;
            }
            if (!allValid) {
                // change color to red to indicate problem
                document.activeElement.style.color = 'red';
                var Message = "Time Weasel says fix all fields in RED. Don't make Time Weasel kick your ass.";
                document.getElementById("labelMessage").innerText = Message;

            }
            if (allValid == true) {
                var x = checkStr.value;
                var z = Round2QuarterHour(x);
                document.activeElement.value = z;
                if (CheckForErrors() == false) {
                    Total();
                }
            }
        }
        function Round2QuarterHour(x) {
            var y = (Math.round(x * Math.pow(10, 2))) / Math.pow(10, 2);
            y = y * 100
            var rem = Math.round(y - Math.floor(y / 25) * 25);
            y = (y - rem) / 100;
            y = (Math.round(y * Math.pow(10, 2))) / Math.pow(10, 2);
            return y;
        }
        function Total() {
            var mon1 = document.getElementById("inputMon1").value * 1;
            var mon2 = document.getElementById("inputMon2").value * 1;
            var mon3 = document.getElementById("inputMon3").value * 1;
            var mon4 = document.getElementById("inputMon4").value * 1;
            var mon5 = document.getElementById("inputMon5").value * 1;

            var tue1 = document.getElementById("inputTue1").value * 1;
            var tue2 = document.getElementById("inputTue2").value * 1;
            var tue3 = document.getElementById("inputTue3").value * 1;
            var tue4 = document.getElementById("inputTue4").value * 1;
            var tue5 = document.getElementById("inputTue5").value * 1;

            var wed1 = document.getElementById("inputWed1").value * 1;
            var wed2 = document.getElementById("inputWed2").value * 1;
            var wed3 = document.getElementById("inputWed3").value * 1;
            var wed4 = document.getElementById("inputWed4").value * 1;
            var wed5 = document.getElementById("inputWed5").value * 1;

            var thr1 = document.getElementById("inputThr1").value * 1;
            var thr2 = document.getElementById("inputThr2").value * 1;
            var thr3 = document.getElementById("inputThr3").value * 1;
            var thr4 = document.getElementById("inputThr4").value * 1;
            var thr5 = document.getElementById("inputThr5").value * 1;

            var fri1 = document.getElementById("inputFri1").value * 1;
            var fri2 = document.getElementById("inputFri2").value * 1;
            var fri3 = document.getElementById("inputFri3").value * 1;
            var fri4 = document.getElementById("inputFri4").value * 1;
            var fri5 = document.getElementById("inputFri5").value * 1;

            var sat1 = document.getElementById("inputSat1").value * 1;
            var sat2 = document.getElementById("inputSat2").value * 1;
            var sat3 = document.getElementById("inputSat3").value * 1;
            var sat4 = document.getElementById("inputSat4").value * 1;
            var sat5 = document.getElementById("inputSat5").value * 1;

            var sun1 = document.getElementById("inputSun1").value * 1;
            var sun2 = document.getElementById("inputSun2").value * 1;
            var sun3 = document.getElementById("inputSun3").value * 1;
            var sun4 = document.getElementById("inputSun4").value * 1;
            var sun5 = document.getElementById("inputSun5").value * 1;

            var monTotal = ((mon1) + (mon2) + (mon3) + (mon4) + (mon5));
            document.getElementById("labelMonTotal").innerHTML = monTotal;


            var tueTotal = ((tue1) + (tue2) + (tue3) + (tue4) + (tue5));
            document.getElementById("labelTueTotal").innerHTML = tueTotal;


            var wedTotal = ((wed1) + (wed2) + (wed3) + (wed4) + (wed5));
            document.getElementById("labelWedTotal").innerHTML = wedTotal;


            var thrTotal = ((thr1) + (thr2) + (thr3) + (thr4) + (thr5));
            document.getElementById("labelThrTotal").innerHTML = thrTotal;


            var friTotal = ((fri1) + (fri2) + (fri3) + (fri4) + (fri5));
            document.getElementById("labelFriTotal").innerHTML = friTotal;


            var satTotal = ((sat1) + (sat2) + (sat3) + (sat4) + (sat5));
            document.getElementById("labelSatTotal").innerHTML = satTotal;


            var sunTotal = ((sun1) + (sun2) + (sun3) + (sun4) + (sun5));
            document.getElementById("labelSunTotal").innerHTML = sunTotal;

            var rowTotal1 = (mon1 + tue1 + wed1 + thr1 + fri1 + sat1 + sun1);
            document.getElementById("labelRowTotal1").innerHTML = rowTotal1;

            var rowTotal2 = (mon2 + tue2 + wed2 + thr2 + fri2 + sat2 + sun2);
            document.getElementById("labelRowTotal2").innerHTML = rowTotal2;

            var rowTotal3 = (mon3 + tue3 + wed3 + thr3 + fri3 + sat3 + sun3);
            document.getElementById("labelRowTotal3").innerHTML = rowTotal3;

            var rowTotal4 = (mon4 + tue4 + wed4 + thr4 + fri4 + sat4 + sun4);
            document.getElementById("labelRowTotal4").innerHTML = rowTotal4;

            var rowTotal5 = (mon5 + tue5 + wed5 + thr5 + fri5 + sat5 + sun5);
            document.getElementById("labelRowTotal5").innerHTML = rowTotal5;

            var GrandTotal = (rowTotal1 + rowTotal2 + rowTotal3 + rowTotal4 + rowTotal5);
            document.getElementById("labelGrandTotal").innerText = GrandTotal;

        }
        function CheckForErrors() {
            //check all fields for red text. if none found, clear validation message
            f = document.forms[0];
            var err = false;

            for (i = 0; i < f.elements.length; i++) {
                if (f[i].name.match("^input")) {
                    if (f[i].style.color == 'red') {
                        err = true;
                        return true;
                        break;
                    }
                }
            }
            if (err == false) {
                var obj = document.getElementById("labelMessage");
                obj.innerText = '';
                return false;

            }
        }
    </script>
    <div>
        <div>
            Week of
            <asp:DropDownList ID="ddlWeekOf" CssClass="largedropdown" runat="server" AutoPostBack="True"
                OnSelectedIndexChanged="ddlWeekOf_SelectedIndexChanged">
            </asp:DropDownList>
            &nbsp;Person
            <asp:DropDownList ID="ddlUserList" CssClass="largedropdown" runat="server" AutoPostBack="True"
                OnSelectedIndexChanged="ddlUserList_SelectedIndexChanged">
            </asp:DropDownList>
        </div>
        <hr />
        <div class="bold">
            Add Time Entries:</div>
        <div>
            <table id="Table1" cellspacing="1" cellpadding="1" border="0">
                <tr>
                    <td style="height: 24px" class="subsubheads">
                        Project
                    </td>
                    <td style="height: 24px" class="subsubheads">
                        Billable
                    </td>
                    <td style="height: 24px" class="subsubheads">
                        <asp:Label ID="labelMon" runat="server">Mon</asp:Label>
                    </td>
                    <td style="height: 24px" class="subsubheads">
                        <asp:Label ID="labelTue" runat="server">Tue</asp:Label>
                    </td>
                    <td style="height: 24px" class="subsubheads">
                        <asp:Label ID="labelWed" runat="server">Wed</asp:Label>
                    </td>
                    <td style="height: 24px" class="subsubheads">
                        <asp:Label ID="labelThr" runat="server">Thr</asp:Label>
                    </td>
                    <td style="height: 24px" class="subsubheads">
                        <asp:Label ID="labelFri" runat="server">Fri</asp:Label>
                    </td>
                    <td style="height: 24px" class="subsubheads">
                        <asp:Label ID="labelSat" runat="server">Sat</asp:Label>
                    </td>
                    <td style="width: 53px; height: 24px" class="subsubheads">
                        <asp:Label ID="labelSun" runat="server">Sun</asp:Label>
                    </td>
                    <td style="width: 43px; height: 24px" class="subsubheads">
                        Total
                    </td>
                    <td style="height: 24px" class="subsubheads">
                        Milestone
                    </td>
                    <td style="height: 24px" class="subsubheads">
                        Task
                    </td>
                    <td style="height: 24px" class="subsubheads">
                        Description
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:DropDownList ID="inputProject1" CssClass="dropdown" runat="server" OnSelectedIndexChanged="inputProject1_SelectedIndexChanged"
                            AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                    <td style="width: 41px">
                        <asp:CheckBox ID="inputBillable1" runat="server"></asp:CheckBox>
                    </td>
                    <td style="width: 13px">
                        <input class="small" id="inputMon1" type="text" maxlength="5" onclick="this.select()" onchange="Validate(this)" onkeypress="return numericOnly(this)"
                            size="1" value="0" name="inputMon1">
                    </td>
                    <td>
                        <input class="small" id="inputTue1" type="text" maxlength="5" onclick="this.select()" onchange="Validate(this)" onkeypress="return numericOnly(this)" onkeypress="return numericOnly(this)"
                            size="1" value="0" name="inputTue1">
                    </td>
                    <td>
                        <input class="small" id="inputWed1" type="text" maxlength="5" onclick="this.select()" onchange="Validate(this)" onkeypress="return numericOnly(this)"
                            size="1" value="0" name="inputWed1">
                    </td>
                    <td>
                        <input class="small" id="inputThr1" type="text" maxlength="5" onclick="this.select()" onchange="Validate(this)" onkeypress="return numericOnly(this)"
                            size="1" value="0" name="inputThr1">
                    </td>
                    <td>
                        <input class="small" id="inputFri1" type="text" maxlength="5" onclick="this.select()" onchange="Validate(this)" onkeypress="return numericOnly(this)"
                            size="1" value="0" name="inputFri1">
                    </td>
                    <td>
                        <input class="small" id="inputSat1" type="text" maxlength="5" onclick="this.select()" onchange="Validate(this)" onkeypress="return numericOnly(this)"
                            size="1" value="0" name="inputSat1">
                    </td>
                    <td style="width: 53px">
                        <input class="small" id="inputSun1" type="text" maxlength="5" onclick="this.select()" onchange="Validate(this)" onkeypress="return numericOnly(this)"
                            size="1" value="0" name="inputSun1">
                    </td>
                    <td style="width: 43px">
                        <div class="small" id="labelRowTotal1" style="display: inline; width: 30px; height: 15px">
                            0</div>
                    </td>
                    <td>
                        <asp:DropDownList ID="inputMilestone1" CssClass="dropdown" runat="server" AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:DropDownList ID="inputTask1" CssClass="dropdown" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:TextBox ID="inputDescription1" CssClass="dropdown" runat="server" 
                            Width="260px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:DropDownList ID="inputProject2" CssClass="dropdown" runat="server" OnSelectedIndexChanged="inputProject2_SelectedIndexChanged"
                            AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                    <td style="width: 41px">
                        <asp:CheckBox ID="inputBillable2" runat="server"></asp:CheckBox>
                    </td>
                    <td style="width: 13px">
                        <input class="small" id="inputMon2" type="text" maxlength="5" onclick="this.select()" onchange="Validate(this)" onkeypress="return numericOnly(this)"
                            size="1" value="0" name="inputMon2">
                    </td>
                    <td>
                        <input class="small" id="inputTue2" type="text" maxlength="5" onclick="this.select()" onchange="Validate(this)" onkeypress="return numericOnly(this)"
                            size="1" value="0" name="inputTue2">
                    </td>
                    <td>
                        <input class="small" id="inputWed2" type="text" maxlength="5" onclick="this.select()" onchange="Validate(this)" onkeypress="return numericOnly(this)"
                            size="1" value="0" name="inputWed2">
                    </td>
                    <td>
                        <input class="small" id="inputThr2" type="text" maxlength="5" onclick="this.select()" onchange="Validate(this)" onkeypress="return numericOnly(this)"
                            size="1" value="0" name="inputThr2">
                    </td>
                    <td>
                        <input class="small" id="inputFri2" type="text" maxlength="5" onclick="this.select()" onchange="Validate(this)" onkeypress="return numericOnly(this)"
                            size="1" value="0" name="inputFri2">
                    </td>
                    <td>
                        <input class="small" id="inputSat2" type="text" maxlength="5" onclick="this.select()" onchange="Validate(this)" onkeypress="return numericOnly(this)"
                            size="1" value="0" name="inputSat2">
                    </td>
                    <td style="width: 53px">
                        <input class="small" id="inputSun2" type="text" maxlength="5" onclick="this.select()" onchange="Validate(this)" onkeypress="return numericOnly(this)"
                            size="1" value="0" name="inputSun2">
                    </td>
                    <td style="width: 43px">
                        <div class="small" id="labelRowTotal2" style="display: inline; width: 30px; height: 15px">
                            0</div>
                    </td>
                    <td>
                        <asp:DropDownList ID="inputMilestone2" CssClass="dropdown" runat="server" AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:DropDownList ID="inputTask2" CssClass="dropdown" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:TextBox ID="inputDescription2" CssClass="dropdown" runat="server" 
                            Width="260px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:DropDownList ID="inputProject3" CssClass="dropdown" runat="server" OnSelectedIndexChanged="inputProject3_SelectedIndexChanged"
                            AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                    <td style="width: 41px">
                        <asp:CheckBox ID="inputBillable3" runat="server"></asp:CheckBox>
                    </td>
                    <td style="width: 13px">
                        <input class="small" id="inputMon3" type="text" maxlength="5" onclick="this.select()" onchange="Validate(this)" onkeypress="return numericOnly(this)"
                            size="1" value="0" name="inputMon3">
                    </td>
                    <td>
                        <input class="small" id="inputTue3" type="text" maxlength="5" onclick="this.select()" onchange="Validate(this)" onkeypress="return numericOnly(this)"
                            size="1" value="0" name="Text6">
                    </td>
                    <td>
                        <input class="small" id="inputWed3" type="text" maxlength="5" onclick="this.select()" onchange="Validate(this)" onkeypress="return numericOnly(this)"
                            size="1" value="0" name="inputWed3">
                    </td>
                    <td>
                        <input class="small" id="inputThr3" type="text" maxlength="5" onclick="this.select()" onchange="Validate(this)" onkeypress="return numericOnly(this)"
                            size="1" value="0" name="inputThr3">
                    </td>
                    <td>
                        <input class="small" id="inputFri3" type="text" maxlength="5" onclick="this.select()" onchange="Validate(this)" onkeypress="return numericOnly(this)"
                            size="1" value="0" name="inputFri3">
                    </td>
                    <td>
                        <input class="small" id="inputSat3" type="text" maxlength="5" onclick="this.select()" onchange="Validate(this)" onkeypress="return numericOnly(this)"
                            size="1" value="0" name="inputSat3">
                    </td>
                    <td style="width: 53px">
                        <input class="small" id="inputSun3" type="text" maxlength="5" onclick="this.select()" onchange="Validate(this)" onkeypress="return numericOnly(this)"
                            size="1" value="0" name="inputSun3">
                    </td>
                    <td style="width: 43px">
                        <div class="small" id="labelRowTotal3" style="display: inline; width: 30px; height: 15px">
                            0</div>
                    </td>
                    <td>
                        <asp:DropDownList ID="inputMilestone3" CssClass="dropdown" runat="server" AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:DropDownList ID="inputTask3" CssClass="dropdown" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:TextBox ID="inputDescription3" CssClass="dropdown" runat="server" 
                            Width="260px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="height: 15px">
                        <asp:DropDownList ID="inputProject4" CssClass="dropdown" runat="server" OnSelectedIndexChanged="inputProject4_SelectedIndexChanged"
                            AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                    <td style="width: 41px; height: 15px">
                        <asp:CheckBox ID="inputBillable4" runat="server"></asp:CheckBox>
                    </td>
                    <td style="width: 13px; height: 15px">
                        <input class="small" id="inputMon4" type="text" maxlength="5" onclick="this.select()" onchange="Validate(this)" onkeypress="return numericOnly(this)"
                            size="1" value="0" name="inputMon4">
                    </td>
                    <td style="height: 15px">
                        <input class="small" id="inputTue4" type="text" maxlength="5" onclick="this.select()" onchange="Validate(this)" onkeypress="return numericOnly(this)"
                            size="1" value="0" name="Text7">
                    </td>
                    <td style="height: 15px">
                        <input class="small" id="inputWed4" type="text" maxlength="5" onclick="this.select()" onchange="Validate(this)" onkeypress="return numericOnly(this)"
                            size="1" value="0" name="inputWed4">
                    </td>
                    <td style="height: 15px">
                        <input class="small" id="inputThr4" type="text" maxlength="5" onclick="this.select()" onchange="Validate(this)" onkeypress="return numericOnly(this)"
                            size="1" value="0" name="inputThr4">
                    </td>
                    <td style="height: 15px">
                        <input class="small" id="inputFri4" type="text" maxlength="5" onclick="this.select()" onchange="Validate(this)" onkeypress="return numericOnly(this)"
                            size="1" value="0" name="inputFri4">
                    </td>
                    <td style="height: 15px">
                        <input class="small" id="inputSat4" type="text" maxlength="5" onclick="this.select()" onchange="Validate(this)" onkeypress="return numericOnly(this)"
                            size="1" value="0" name="inputSat4">
                    </td>
                    <td style="width: 53px; height: 15px">
                        <input class="small" id="inputSun4" type="text" maxlength="5" onclick="this.select()" onchange="Validate(this)" onkeypress="return numericOnly(this)"
                            size="1" value="0" name="inputSun4">
                    </td>
                    <td style="width: 43px; height: 15px">
                        <div class="small" id="labelRowTotal4" style="display: inline; width: 30px; height: 15px">
                            0</div>
                    </td>
                    <td style="height: 15px">
                        <asp:DropDownList ID="inputMilestone4" CssClass="dropdown" runat="server" AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                    <td style="height: 15px">
                        <asp:DropDownList ID="inputTask4" CssClass="dropdown" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td style="height: 15px">
                        <asp:TextBox ID="inputDescription4" CssClass="dropdown" runat="server" 
                            Width="260px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="height: 14px">
                        <asp:DropDownList ID="inputProject5" CssClass="dropdown" runat="server" OnSelectedIndexChanged="inputProject5_SelectedIndexChanged"
                            AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                    <td style="height: 14px">
                        <asp:CheckBox ID="inputBillable5" runat="server"></asp:CheckBox>
                    </td>
                    <td style="width: 13px; height: 14px">
                        <input class="small" id="inputMon5" type="text" maxlength="5" onclick="this.select()" onchange="Validate(this)" onkeypress="return numericOnly(this)"
                            size="1" value="0" name="inputMon5">
                    </td>
                    <td style="height: 14px">
                        <input class="small" id="inputTue5" type="text" maxlength="5" onclick="this.select()" onchange="Validate(this)" onkeypress="return numericOnly(this)"
                            size="1" value="0" name="Text8">
                    </td>
                    <td style="height: 14px">
                        <input class="small" id="inputWed5" type="text" maxlength="5" onclick="this.select()" onchange="Validate(this)" onkeypress="return numericOnly(this)"
                            size="1" value="0" name="inputWed5">
                    </td>
                    <td style="height: 14px">
                        <input class="small" id="inputThr5" type="text" maxlength="5" onclick="this.select()" onchange="Validate(this)" onkeypress="return numericOnly(this)"
                            size="1" value="0" name="inputThr5">
                    </td>
                    <td style="height: 14px">
                        <input class="small" id="inputFri5" type="text" maxlength="5" onclick="this.select()" onchange="Validate(this)" onkeypress="return numericOnly(this)"
                            size="1" value="0" name="inputFri5">
                    </td>
                    <td style="height: 14px">
                        <input class="small" id="inputSat5" type="text" maxlength="5" onclick="this.select()" onchange="Validate(this)" onkeypress="return numericOnly(this)"
                            size="1" value="0" name="inputSat5">
                    </td>
                    <td style="width: 53px; height: 14px">
                        <input class="small" id="inputSun5" type="text" maxlength="5" onclick="this.select()" onchange="Validate(this)" onkeypress="return numericOnly(this)"
                            size="1" value="0" name="inputSun5">
                    </td>
                    <td style="width: 43px; height: 14px">
                        <div class="small" id="labelRowTotal5" style="display: inline; width: 30px; height: 15px">
                            0</div>
                    </td>
                    <td style="height: 14px">
                        <asp:DropDownList ID="inputMilestone5" CssClass="dropdown" runat="server" AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                    <td style="height: 14px">
                        <asp:DropDownList ID="inputTask5" CssClass="dropdown" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td style="height: 14px">
                        <asp:TextBox ID="inputDescription5" CssClass="dropdown" runat="server" 
                            Width="260px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td style="width: 422px" colspan="8">
                        <hr width="100%" size="1">
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td style="width: 41px">
                    </td>
                    <td style="width: 13px">
                        <div class="small" id="labelMonTotal" style="display: inline; width: 30px; height: 22px">
                            0</div>
                    </td>
                    <td>
                        <div class="small" id="labelTueTotal" style="display: inline; width: 30px; height: 22px">
                            0</div>
                    </td>
                    <td>
                        <div class="small" id="labelWedTotal" style="display: inline; width: 30px; height: 22px">
                            0</div>
                    </td>
                    <td>
                        <div class="small" id="labelThrTotal" style="display: inline; width: 30px; height: 22px">
                            0</div>
                    </td>
                    <td>
                        <div class="small" id="labelFriTotal" style="display: inline; width: 30px; height: 22px">
                            0</div>
                    </td>
                    <td>
                        <div class="small" id="labelSatTotal" style="display: inline; width: 30px; height: 22px">
                            0</div>
                    </td>
                    <td style="width: 53px">
                        <div class="small" id="labelSunTotal" style="display: inline; width: 30px; height: 22px">
                            0</div>
                    </td>
                    <td style="width: 43px">
                        <input id="labelGrandTotal" style="border-left-color: #ffffff; border-bottom-color: #ffffff;
                            width: 100%; color: black; border-top-style: solid; border-top-color: #ffffff;
                            border-right-style: solid; border-left-style: solid; border-right-color: #ffffff;
                            border-bottom-style: solid" readonly type="text" size="5" name="labelGrandTotal">
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
            <div>
                <input id="labelMessage" style="border-left-color: #ffffff; border-bottom-color: #ffffff;
                    width: 100%; color: red; border-top-style: solid; border-top-color: #ffffff;
                    border-right-style: solid; border-left-style: solid; border-right-color: #ffffff;
                    border-bottom-style: solid" readonly type="text" size="60" name="labelMessage">
                <asp:Label ID="labelSaveMessage" runat="server" Visible="False" ForeColor="Red"></asp:Label>
            </div>
            <div style="text-align: center;">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />&nbsp;
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
            </div>
        </div>
        <hr />
        <div class="bold">
            Current Time Entries:</div>
        <asp:GridView ID="gvTime" runat="server" AutoGenerateColumns="false" DataKeyNames="Billable,Project,Milestone,Task,Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday,MonDescription,TuesDescription,WedDescription,ThursDescription,FriDescription,SatDescription,SunDescription"
            OnRowDataBound="gvTime_RowDataBound" OnRowEditing="gvTime_Edit" OnRowDeleting="gvTime_Delete"
            OnRowUpdating="gvTime_Updating" GridLines="None" OnSelectedIndexChanged="gvTime_SelectedIndexChanged"
            OnRowCancelingEdit="gvTime_Cancelling" ShowFooter="True" EmptyDataText="No Entries">
            <Columns>
                <asp:BoundField Visible="False" DataField="Person" HeaderText="Person"></asp:BoundField>
                <asp:BoundField DataField="ProjectName" ReadOnly="True" HeaderText="Project">
                    <FooterStyle ForeColor="Blue" CssClass="subheads" BackColor="#FFFF99"></FooterStyle>
                </asp:BoundField>
                <asp:TemplateField>
                    <HeaderTemplate>
                        Billable</HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="Billable" Checked='<%#Convert.ToBoolean(DataBinder.Eval(Container.DataItem, "Billable"))%>'
                            Enabled="False" CssClass="small" runat="server"></asp:CheckBox>
                    </ItemTemplate>
                    <FooterStyle ForeColor="Blue" CssClass="subsubheads" BackColor="#FFFF99"></FooterStyle>
                    <EditItemTemplate>
                        <asp:CheckBox ID="BillableEdit" Checked='<%#Convert.ToBoolean(DataBinder.Eval(Container.DataItem, "Billable"))%>'
                            Enabled="False" CssClass="small" runat="server"></asp:CheckBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Mon">
                    <ItemTemplate>
                        <%#FormatHours(DataBinder.Eval(Container.DataItem, "Monday").ToString())%>
                        <br>
                        
                        <asp:TextBox CssClass="small" ID="inputMonDescription" runat="server" MaxLength="1000" 
                            Width="100px" TextMode="MultiLine" Height="25px" ReadOnly="True" Text='<%#DataBinder.Eval(Container.DataItem, "MonDescription")%>'>
                        </asp:TextBox>
                        
                    </ItemTemplate>
                    <FooterStyle ForeColor="Blue" CssClass="subsubheads" BackColor="#FFFF99"></FooterStyle>
                    <EditItemTemplate>
                        <asp:TextBox CssClass="small" ID="Monday" runat="server" onclick="this.select()" onkeypress="return numericOnly(this)" Width="50" Text='<%#FormatHours(DataBinder.Eval(Container.DataItem, "Monday").ToString())%>'>
                        </asp:TextBox><asp:HiddenField ID="hidMon" runat="server" Value='<%#FormatHours(DataBinder.Eval(Container.DataItem, "Monday").ToString())%>' />
                        <asp:HiddenField ID="hidMonDesc" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "MonDescription")%>' />
                        <br>
                        <asp:TextBox CssClass="small" ID="editMonDescription" runat="server" MaxLength="1000"
                            Width="100px" TextMode="MultiLine" Height="25px" Text='<%#DataBinder.Eval(Container.DataItem, "MonDescription")%>'>
                        </asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tue">
                    <ItemTemplate>
                        <%#FormatHours(DataBinder.Eval(Container.DataItem, "Tuesday").ToString())%>
                        <br>
                        <asp:TextBox CssClass="small" ID="inputTuesDescription" runat="server" MaxLength="1000"
                            Width="100px" TextMode="MultiLine" Height="25px" ReadOnly="True" Text='<%#DataBinder.Eval(Container.DataItem, "TuesDescription")%>'>
                        </asp:TextBox>
                    </ItemTemplate>
                    <FooterStyle ForeColor="Blue" CssClass="subsubheads" BackColor="#FFFF99"></FooterStyle>
                    <EditItemTemplate>
                        <asp:TextBox CssClass="small" ID="Tuesday" onclick="this.select()" onkeypress="return numericOnly(this)" runat="server" Width="50" Text='<%#FormatHours(DataBinder.Eval(Container.DataItem, "Tuesday").ToString())%>'>
                        </asp:TextBox>
                        <asp:HiddenField ID="hidTue" runat="server" Value='<%#FormatHours(DataBinder.Eval(Container.DataItem, "Tuesday").ToString())%>' />
                         <asp:HiddenField ID="hidTueDesc" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "TuesDescription")%>' />
                        <br>
                        <asp:TextBox CssClass="small" ID="editTuesDescription" runat="server" MaxLength="1000"
                            Width="100px" TextMode="MultiLine" Height="25px" Text='<%#DataBinder.Eval(Container.DataItem, "TuesDescription")%>'>
                        </asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Wed">
                    <ItemTemplate>
                        <%#FormatHours(DataBinder.Eval(Container.DataItem, "Wednesday").ToString())%>
                        <br>
                        <asp:TextBox CssClass="small" ID="inputWedDescription" runat="server" Width="100px"
                            TextMode="MultiLine" Height="25px" ReadOnly="True" Text='<%#DataBinder.Eval(Container.DataItem, "WedDescription")%>'>
                        </asp:TextBox>
                    </ItemTemplate>
                    <FooterStyle ForeColor="Blue" CssClass="subsubheads" BackColor="#FFFF99"></FooterStyle>
                    <EditItemTemplate>
                        <asp:TextBox CssClass="small" ID="Wednesday" onclick="this.select()" onkeypress="return numericOnly(this)" runat="server" Width="50" Text='<%#FormatHours(DataBinder.Eval(Container.DataItem, "Wednesday").ToString())%>'>
                        </asp:TextBox>
                        <asp:HiddenField ID="hidWed" runat="server" Value='<%#FormatHours(DataBinder.Eval(Container.DataItem, "Wednesday").ToString())%>' />
                        <asp:HiddenField ID="hidWedDesc" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "WedDescription")%>' />
                        <br>
                        <asp:TextBox CssClass="small" ID="editWedDescription" runat="server" MaxLength="1000"
                            Width="100px" TextMode="MultiLine" Height="25px" Text='<%#DataBinder.Eval(Container.DataItem, "WedDescription")%>'>
                        </asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Thr">
                    <ItemTemplate>
                        <%#FormatHours(DataBinder.Eval(Container.DataItem, "Thursday").ToString())%>
                        <br>
                        <asp:TextBox CssClass="small" ID="inputThursDescription" runat="server" MaxLength="1000"
                            Width="100px" TextMode="MultiLine" ReadOnly="True" Height="25px" Text='<%#DataBinder.Eval(Container.DataItem, "ThursDescription")%>'>
                        </asp:TextBox>
                    </ItemTemplate>
                    <FooterStyle ForeColor="Blue" CssClass="subsubheads" BackColor="#FFFF99"></FooterStyle>
                    <EditItemTemplate>
                        <asp:TextBox CssClass="small" ID="Thursday" onclick="this.select()" onkeypress="return numericOnly(this)" runat="server" Width="50" Text='<%#FormatHours(DataBinder.Eval(Container.DataItem, "Thursday").ToString())%>'>
                        </asp:TextBox>
                        <asp:HiddenField ID="hidThr" runat="server" Value='<%#FormatHours(DataBinder.Eval(Container.DataItem, "Thursday").ToString())%>' />
                        <asp:HiddenField ID="hidThrDesc" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "ThursDescription")%>' />
                        <br>
                        <asp:TextBox CssClass="small" ID="editThursDescription" runat="server" MaxLength="1000"
                            Width="100px" TextMode="MultiLine" Height="25px" Text='<%#DataBinder.Eval(Container.DataItem, "ThursDescription")%>'>
                        </asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Fri">
                    <ItemTemplate>
                        <%#FormatHours(DataBinder.Eval(Container.DataItem, "Friday").ToString())%>
                        <br>
                        <asp:TextBox CssClass="small" ID="inputFriDescription" runat="server" MaxLength="1000"
                            Width="100px" TextMode="MultiLine" ReadOnly="True" Height="25px" Text='<%#DataBinder.Eval(Container.DataItem, "FriDescription")%>'>
                        </asp:TextBox>
                    </ItemTemplate>
                    <FooterStyle ForeColor="Blue" CssClass="subsubheads" BackColor="#FFFF99"></FooterStyle>
                    <EditItemTemplate>
                        <asp:TextBox CssClass="small" ID="Friday" onclick="this.select()" onkeypress="return numericOnly(this)" runat="server" Width="50" Text='<%#FormatHours(DataBinder.Eval(Container.DataItem, "Friday").ToString())%>'>
                        </asp:TextBox>
                        <br>
                        <asp:HiddenField ID="hidFri" runat="server" Value='<%#FormatHours(DataBinder.Eval(Container.DataItem, "Friday").ToString())%>' />
                         <asp:HiddenField ID="hidFriDesc" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "FriDescription")%>' />
                        <asp:TextBox CssClass="small" ID="editFriDescription" runat="server" MaxLength="1000"
                            Width="100px" TextMode="MultiLine" Height="25px" Text='<%#DataBinder.Eval(Container.DataItem, "FriDescription")%>'>
                        </asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Sat">
                    <ItemTemplate>
                        <%#FormatHours(DataBinder.Eval(Container.DataItem, "Saturday").ToString())%>
                        <br>
                        <asp:TextBox ID="inputSatDescription" runat="server" Width="100px" Text='<%#DataBinder.Eval(Container.DataItem, "SatDescription")%>'
                            Height="25px" ReadOnly="True" TextMode="MultiLine" MaxLength="1000" CssClass="small">
                        </asp:TextBox>
                    </ItemTemplate>
                    <FooterStyle ForeColor="Blue" CssClass="subsubheads" BackColor="#FFFF99"></FooterStyle>
                    <EditItemTemplate>
                        <asp:TextBox ID="Saturday" runat="server" onclick="this.select()" onkeypress="return numericOnly(this)" Width="50" Text='<%#FormatHours(DataBinder.Eval(Container.DataItem, "Saturday").ToString())%>'
                            CssClass="small">
                        </asp:TextBox><br>
                        <asp:HiddenField ID="hidSat" runat="server" Value='<%#FormatHours(DataBinder.Eval(Container.DataItem, "Saturday").ToString())%>' />
                        <asp:HiddenField ID="hidSatDesc" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "SatDescription")%>' />
                        <asp:TextBox ID="editSatDescription" runat="server" Width="100px" Text='<%#DataBinder.Eval(Container.DataItem, "SatDescription")%>'
                            Height="25px" TextMode="MultiLine" MaxLength="1000" CssClass="small">
                        </asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Sun">
                    <ItemTemplate>
                        <%#FormatHours(DataBinder.Eval(Container.DataItem, "Sunday").ToString())%>
                        <br>
                        <asp:TextBox ID="inputSunDescription" runat="server" Width="100px" Text='<%#DataBinder.Eval(Container.DataItem, "SunDescription")%>'
                            Height="25px" ReadOnly="True" TextMode="MultiLine" MaxLength="1000" CssClass="small">
                        </asp:TextBox>
                    </ItemTemplate>
                    <FooterStyle ForeColor="Blue" CssClass="subsubheads" BackColor="#FFFF99"></FooterStyle>
                    <EditItemTemplate>
                        <asp:TextBox ID="Sunday" runat="server" onclick="this.select()" onkeypress="return numericOnly(this)" Width="50" Text='<%#FormatHours(DataBinder.Eval(Container.DataItem, "Sunday").ToString())%>'
                            CssClass="small"></asp:TextBox>
                        <asp:HiddenField ID="hidSun" runat="server" Value='<%#FormatHours(DataBinder.Eval(Container.DataItem, "Sunday").ToString())%>' />
                        <asp:HiddenField ID="hidSunDesc" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "SunDescription")%>' />
                        <br>
                        <asp:TextBox ID="editSunDescription" runat="server" Width="100px" Text='<%#DataBinder.Eval(Container.DataItem, "SunDescription")%>'
                            Height="25px" TextMode="MultiLine" MaxLength="1000" CssClass="small">
                        </asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                <ItemTemplate>
                    <asp:Label ID="lblTotal" runat="server" Text='<%#FormatHours(DataBinder.Eval(Container.DataItem, "Total").ToString())%>'></asp:Label>
                </ItemTemplate>
                <FooterStyle ForeColor="Blue" CssClass="subheads" BackColor="#FFFF99"></FooterStyle>
                
                </asp:TemplateField>
                <asp:BoundField DataField="Total" ReadOnly="True" HeaderText="Total">
                    <FooterStyle ForeColor="Blue" CssClass="subheads" BackColor="#FFFF99"></FooterStyle>
                </asp:BoundField>
                <asp:BoundField DataField="PHASENAME" ReadOnly="True" HeaderText="Milestone">
                    <FooterStyle ForeColor="Blue" CssClass="subsubheads" BackColor="#FFFF99"></FooterStyle>
                </asp:BoundField>
                <asp:BoundField DataField="TASKNAME" ReadOnly="True" HeaderText="Task">
                    <FooterStyle ForeColor="Blue" CssClass="subsubheads" BackColor="#FFFF99"></FooterStyle>
                </asp:BoundField>
                <asp:BoundField Visible="False" DataField="MILESTONE" HeaderText="Phase ID"></asp:BoundField>
                <asp:BoundField Visible="False" DataField="TASK" HeaderText="TaskID"></asp:BoundField>
                <asp:TemplateField Visible="False">
                    <ItemTemplate>
                        <asp:TextBox Visible="False" CssClass="small" ID="txtPhaseID" runat="server" Width="50"
                            Text='<%#DataBinder.Eval(Container.DataItem, "Milestone")%>'>
                        </asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField Visible="False">
                    <ItemTemplate>
                        <asp:TextBox Visible="False" CssClass="small" ID="txtTaskID" runat="server" Width="50"
                            Text='<%#DataBinder.Eval(Container.DataItem, "Task")%>'>
                        </asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField Visible="False">
                    <ItemTemplate>
                        <asp:TextBox Visible="False" CssClass="small" ID="txtProjectID" runat="server" Width="50"
                            Text='<%#DataBinder.Eval(Container.DataItem, "Project")%>'>
                        </asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="true" ShowCancelButton="true" ShowDeleteButton="true" 
                    EditText="Edit" CancelText="Cancel" UpdateText="Save" ButtonType="Link" />
                <asp:BoundField Visible="False" DataField="DESCRIPTION" HeaderText="Description">
                </asp:BoundField>
            </Columns>
        </asp:GridView>
        <hr />
        <div id="pto" style="display:none;">
        <div>
            PTO Hours Available:&nbsp;<asp:Label ID="lblPTOAvailable" runat="server" CssClass="small">0</asp:Label>
        </div>
        <div>
            <asp:HyperLink ID="urlRequestPTO" runat="server" NavigateUrl="~/manageUserPto.aspx">Request PTO</asp:HyperLink>
        </div>
        </div>
    </div>
</asp:Content>
