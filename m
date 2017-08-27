From: "Su, Yunde" <su.526-Fg7SviYvi7p1eIqQ5PyeMpVzexx5G7lz@public.gmane.org>
Subject: Re: glx error with nouveau
Date: Sun, 27 Aug 2017 03:20:43 +0000
Message-ID: <DM5PR01MB23617BD644CF4D1CAD385F0291990@DM5PR01MB2361.prod.exchangelabs.com>
References: <DM5PR01MB23614484ABB840515916DA73919A0@DM5PR01MB2361.prod.exchangelabs.com>
 <CAKb7UvjP5chD6tE7wub6r+tbrPcmgQVcv91i2-yEVyD5j_aTXg@mail.gmail.com>
 <DM5PR01MB2361C3BDAF968F458287C46491990@DM5PR01MB2361.prod.exchangelabs.com>
 <CAKb7Uvg3ueOmTZTuyzYW8wUaJCQx_augims070v69eb+KCYJLw@mail.gmail.com>,
 <CAKb7Uvj16aTmpKF5r02+WTBDaSCiwvpKWAxBJ4vMgpjPKvLaBg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0771249578=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7Uvj16aTmpKF5r02+WTBDaSCiwvpKWAxBJ4vMgpjPKvLaBg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============0771249578==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM5PR01MB23617BD644CF4D1CAD385F0291990DM5PR01MB2361prod_"

--_000_DM5PR01MB23617BD644CF4D1CAD385F0291990DM5PR01MB2361prod_
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Hi IIia=1B$B!$=1B(B

Thank you very much for your help.  I will test the newer version.

Best,

Yunde

________________________________
From: ibmirkin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org <ibmirkin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> on behalf of Ilia Mirkin <imi=
rkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Sent: Saturday, August 26, 2017 10:40:50 PM
To: Su, Yunde
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Subject: Re: [Nouveau] glx error with nouveau

BTW, note that mesa-based drivers don't support above GL 3.0 for
compatibility contexts on any hardware. Most reasonable software that
requires advanced functionality uses core contexts though.

On Sat, Aug 26, 2017 at 10:38 PM, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:
> Depends on the hardware. You may be interested in looking at
> https://people.freedesktop.org/~imirkin/glxinfo/ for specifics.
>
> On Sat, Aug 26, 2017 at 9:42 PM, Su, Yunde <su.526-Fg7SviYvi7p1eIqQ5PyeMpVzexx5G7lz@public.gmane.org> w=
rote:
>> Hi IIia,
>>
>>
>> Thank you very much for your help.
>>
>> Does the distro released more recently than Dec 2009 support OPENGL 3.3 =
?
>>
>>
>> Best,
>>
>> Yunde
>>
>> ________________________________
>> From: ibmirkin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org <ibmirkin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> on behalf of Ilia Mirkin
>> <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
>> Sent: Friday, August 25, 2017 6:27:43 PM
>> To: Su, Yunde
>> Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> Subject: Re: [Nouveau] glx error with nouveau
>>
>> Nouveau was merged upstream into the kernel in 2.6.35 or so. The
>> 2.6.32-based system you have is a franken-kernel maintained by RedHat.
>> You should go to them for support.
>>
>> I'd recommend trying a distro based on a kernel that was released more
>> recently than Dec 2009.
>>
>> On Thu, Aug 24, 2017 at 1:29 PM, Su, Yunde <su.526-Fg7SviYvi7p1eIqQ5PyeMpVzexx5G7lz@public.gmane.org>
>> wrote:
>>> Hello all,
>>>
>>>
>>> My laptop has Nouveau installed as the graphic driver. The version is
>>> 2.6.32-573.12.1.el6.x86_64. And when I tried to run a software(CONVERGE
>>> STUDIO), I find such errors:
>>>
>>> Xlib:  extension "GLX" missing on display ":0.0".
>>> QGLTempContext: No GL capable X visuals available.
>>> Xlib:  extension "GLX" missing on display ":0.0".
>>> Xlib:  extension "GLX" missing on display ":0.0".
>>> Xlib:  extension "GLX" missing on display ":0.0".
>>> Xlib:  extension "GLX" missing on display ":0.0".
>>> Xlib:  extension "GLX" missing on display ":0.0".
>>>
>>>
>>> Could you give some suggestions on how to solve this problem?
>>>
>>>
>>> Thanks and best wishes.
>>>
>>>
>>> Best,
>>>
>>> Yunde
>>>
>>>
>>> _______________________________________________
>>> Nouveau mailing list
>>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>>> https://lists.freedesktop.org/mailman/listinfo/nouveau
>>>

--_000_DM5PR01MB23617BD644CF4D1CAD385F0291990DM5PR01MB2361prod_
Content-Type: text/html; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-2022-=
jp">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<meta content=3D"text/html; charset=3DUTF-8">
<style type=3D"text/css" style=3D"">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div id=3D"x_divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; col=
or:#000000; font-family:Calibri,Helvetica,sans-serif">
<p>Hi IIia=1B$B!$=1B(B</p>
<p>Thank you very much for your help.&nbsp; I will test the newer version. =
<br>
</p>
<p>Best,</p>
<p>Yunde<br>
</p>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> ibmirkin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org =
&lt;ibmirkin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org&gt; on behalf of Ilia Mirkin &lt;imirkin-FrUbXkNCsVen+EJxYGL2xA@public.gmane.org=
u&gt;<br>
<b>Sent:</b> Saturday, August 26, 2017 10:40:50 PM<br>
<b>To:</b> Su, Yunde<br>
<b>Cc:</b> nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org<br>
<b>Subject:</b> Re: [Nouveau] glx error with nouveau</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">BTW, note that mesa-based drivers don't support ab=
ove GL 3.0 for<br>
compatibility contexts on any hardware. Most reasonable software that<br>
requires advanced functionality uses core contexts though.<br>
<br>
On Sat, Aug 26, 2017 at 10:38 PM, Ilia Mirkin &lt;imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org&gt; =
wrote:<br>
&gt; Depends on the hardware. You may be interested in looking at<br>
&gt; <a href=3D"https://people.freedesktop.org/~imirkin/glxinfo/">https://p=
eople.freedesktop.org/~imirkin/glxinfo/</a> for specifics.<br>
&gt;<br>
&gt; On Sat, Aug 26, 2017 at 9:42 PM, Su, Yunde &lt;su.526-Fg7SviYvi7p1eIqQ5PyeMg@public.gmane.org=
edu&gt; wrote:<br>
&gt;&gt; Hi IIia,<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Thank you very much for your help.<br>
&gt;&gt;<br>
&gt;&gt; Does the distro released more recently than Dec 2009 support OPENG=
L 3.3 ?<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Best,<br>
&gt;&gt;<br>
&gt;&gt; Yunde<br>
&gt;&gt;<br>
&gt;&gt; ________________________________<br>
&gt;&gt; From: ibmirkin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org &lt;ibmirkin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org&gt; on behalf of I=
lia Mirkin<br>
&gt;&gt; &lt;imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org&gt;<br>
&gt;&gt; Sent: Friday, August 25, 2017 6:27:43 PM<br>
&gt;&gt; To: Su, Yunde<br>
&gt;&gt; Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org<br>
&gt;&gt; Subject: Re: [Nouveau] glx error with nouveau<br>
&gt;&gt;<br>
&gt;&gt; Nouveau was merged upstream into the kernel in 2.6.35 or so. The<b=
r>
&gt;&gt; 2.6.32-based system you have is a franken-kernel maintained by Red=
Hat.<br>
&gt;&gt; You should go to them for support.<br>
&gt;&gt;<br>
&gt;&gt; I'd recommend trying a distro based on a kernel that was released =
more<br>
&gt;&gt; recently than Dec 2009.<br>
&gt;&gt;<br>
&gt;&gt; On Thu, Aug 24, 2017 at 1:29 PM, Su, Yunde &lt;su.526@buckeyemail.=
osu.edu&gt;<br>
&gt;&gt; wrote:<br>
&gt;&gt;&gt; Hello all,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; My laptop has Nouveau installed as the graphic driver. The ver=
sion is<br>
&gt;&gt;&gt; 2.6.32-573.12.1.el6.x86_64. And when I tried to run a software=
(CONVERGE<br>
&gt;&gt;&gt; STUDIO), I find such errors:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Xlib:&nbsp; extension &quot;GLX&quot; missing on display &quot=
;:0.0&quot;.<br>
&gt;&gt;&gt; QGLTempContext: No GL capable X visuals available.<br>
&gt;&gt;&gt; Xlib:&nbsp; extension &quot;GLX&quot; missing on display &quot=
;:0.0&quot;.<br>
&gt;&gt;&gt; Xlib:&nbsp; extension &quot;GLX&quot; missing on display &quot=
;:0.0&quot;.<br>
&gt;&gt;&gt; Xlib:&nbsp; extension &quot;GLX&quot; missing on display &quot=
;:0.0&quot;.<br>
&gt;&gt;&gt; Xlib:&nbsp; extension &quot;GLX&quot; missing on display &quot=
;:0.0&quot;.<br>
&gt;&gt;&gt; Xlib:&nbsp; extension &quot;GLX&quot; missing on display &quot=
;:0.0&quot;.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Could you give some suggestions on how to solve this problem?<=
br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Thanks and best wishes.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Best,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Yunde<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; _______________________________________________<br>
&gt;&gt;&gt; Nouveau mailing list<br>
&gt;&gt;&gt; Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org<br>
&gt;&gt;&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouv=
eau">https://lists.freedesktop.org/mailman/listinfo/nouveau</a><br>
&gt;&gt;&gt;<br>
</div>
</span></font>
</body>
</html>

--_000_DM5PR01MB23617BD644CF4D1CAD385F0291990DM5PR01MB2361prod_--

--===============0771249578==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0771249578==--
