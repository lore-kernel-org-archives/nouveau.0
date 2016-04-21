From: "Li, Stephen" <Steve.Li-w7aCiyBGonG08yh69ceOPQCym/hCvTLSAL8bYrjMMd8@public.gmane.org>
Subject: nouveau: kernel rejected pushbuf: Invalid argument
Date: Thu, 21 Apr 2016 15:17:29 +0000
Message-ID: <3CD7D8096827214EA72BFDC6B95C7CC931B6DFB5@VEREXCH02.harrisbroadcast.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0654901079=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============0654901079==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_3CD7D8096827214EA72BFDC6B95C7CC931B6DFB5VEREXCH02harris_"

--_000_3CD7D8096827214EA72BFDC6B95C7CC931B6DFB5VEREXCH02harris_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I am getting a crash in nouveau in my application. It's basically a java a=
pplication, and I am loading a bitmap into an opengl texture and showing i=
t in a panel. Below is a snippet of the console output. Sometimes I will g=
et a lock up instead of a crash. My whole desktop will lock up, but I can =
still move the mouse pointer around.

Please let me know if you need more information. Your help is appreciated.=


Thanks
Steve

#
# A fatal error has been detected by the Java Runtime Environment:
#
#  SIGSEGV (0xb) at pc=3D0x00007f38aa5da694, pid=3D26497, tid=3D1398811247=
30624
#
# JRE version: Java(TM) SE Runtime Environment (8.0_65-b17) (build 1.8.0_6=
5-b17)
# Java VM: Java HotSpot(TM) 64-Bit Server VM (25.65-b01 mixed mode linux-a=
md64 compressed oops)
# Problematic frame:
# C  [libdrm_nouveau.so.2+0x3694]
#
# Failed to write core dump. Core dumps have been disabled. To enable core=
 dumping, try "ulimit -c unlimited" before starting Java again
#
# An error report file with more information is saved as:
# /home/steve/Documents/hs_err_pid26497.log
nouveau: kernel rejected pushbuf: Invalid argument
nouveau: ch0: krec 0 pushes 1 bufs 36 relocs 0
nouveau: ch0: buf 00000000 00000003 00000004 00000004 00000000
nouveau: ch0: buf 00000001 00000003 00000004 00000004 00000000
nouveau: ch0: buf 00000002 0000000e 00000002 00000002 00000002
nouveau: ch0: buf 00000003 00000007 00000002 00000002 00000000

______________________________________________________________________
This email has been scanned by the Symantec Email Security.cloud service.
For more information please visit http://www.symanteccloud.com
______________________________________________________________________
--_000_3CD7D8096827214EA72BFDC6B95C7CC931B6DFB5VEREXCH02harris_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-mic=
rosoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word=
" xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"ht=
tp://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii=
">
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
=09{font-family:Calibri;
=09panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
=09{margin:0cm;
=09margin-bottom:.0001pt;
=09font-size:11.0pt;
=09font-family:"Calibri","sans-serif";
=09mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
=09{mso-style-priority:99;
=09color:blue;
=09text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
=09{mso-style-priority:99;
=09color:purple;
=09text-decoration:underline;}
span.EmailStyle17
=09{mso-style-type:personal-compose;
=09font-family:"Calibri","sans-serif";
=09color:windowtext;}
.MsoChpDefault
=09{mso-style-type:export-only;
=09font-family:"Calibri","sans-serif";
=09mso-fareast-language:EN-US;}
@page WordSection1
=09{size:612.0pt 792.0pt;
=09margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
=09{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-CA" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am getting a crash in nouveau in my application. =
It&#8217;s basically a java application, and I am loading a bitmap into an=
 opengl texture and showing it in a panel. Below is a snippet of the conso=
le output. Sometimes I will get a lock up instead
 of a crash. My whole desktop will lock up, but I can still move the mouse=
 pointer around.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Please let me know if you need more information. Yo=
ur help is appreciated.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks<o:p></o:p></p>
<p class=3D"MsoNormal">Steve<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">#<o:p></o:p></p>
<p class=3D"MsoNormal"># A fatal error has been detected by the Java Runti=
me Environment:<o:p></o:p></p>
<p class=3D"MsoNormal">#<o:p></o:p></p>
<p class=3D"MsoNormal">#&nbsp; SIGSEGV (0xb) at pc=3D0x00007f38aa5da694, p=
id=3D26497, tid=3D139881124730624<o:p></o:p></p>
<p class=3D"MsoNormal">#<o:p></o:p></p>
<p class=3D"MsoNormal"># JRE version: Java(TM) SE Runtime Environment (8.0=
_65-b17) (build 1.8.0_65-b17)<o:p></o:p></p>
<p class=3D"MsoNormal"># Java VM: Java HotSpot(TM) 64-Bit Server VM (25.65=
-b01 mixed mode linux-amd64 compressed oops)<o:p></o:p></p>
<p class=3D"MsoNormal"># Problematic frame:<o:p></o:p></p>
<p class=3D"MsoNormal"># C&nbsp; [libdrm_nouveau.so.2&#43;0x3694]<o:p></o:=
p></p>
<p class=3D"MsoNormal">#<o:p></o:p></p>
<p class=3D"MsoNormal"># Failed to write core dump. Core dumps have been d=
isabled. To enable core dumping, try &quot;ulimit -c unlimited&quot; befor=
e starting Java again<o:p></o:p></p>
<p class=3D"MsoNormal">#<o:p></o:p></p>
<p class=3D"MsoNormal"># An error report file with more information is sav=
ed as:<o:p></o:p></p>
<p class=3D"MsoNormal"># /home/steve/Documents/hs_err_pid26497.log<o:p></o=
:p></p>
<p class=3D"MsoNormal">nouveau: kernel rejected pushbuf: Invalid argument<=
o:p></o:p></p>
<p class=3D"MsoNormal">nouveau: ch0: krec 0 pushes 1 bufs 36 relocs 0<o:p>=
</o:p></p>
<p class=3D"MsoNormal">nouveau: ch0: buf 00000000 00000003 00000004 000000=
04 00000000<o:p></o:p></p>
<p class=3D"MsoNormal">nouveau: ch0: buf 00000001 00000003 00000004 000000=
04 00000000<o:p></o:p></p>
<p class=3D"MsoNormal">nouveau: ch0: buf 00000002 0000000e 00000002 000000=
02 00000002<o:p></o:p></p>
<p class=3D"MsoNormal">nouveau: ch0: buf 00000003 00000007 00000002 000000=
02 00000000<o:p></o:p></p>
</div>
<br clear=3D"both">
______________________________________________________________________<BR>=

This email has been scanned by the Symantec Email Security.cloud service.<=
BR>
For more information please visit http://www.symanteccloud.com<BR>
______________________________________________________________________<BR>=

</body>
</html>

--_000_3CD7D8096827214EA72BFDC6B95C7CC931B6DFB5VEREXCH02harris_--

--===============0654901079==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0654901079==--
