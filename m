From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: Re: Bug or not?
Date: Sun, 15 Feb 2015 11:13:57 +0100
Message-ID: <C7A4BB62-0BF8-4DDF-B62E-856C7C803762@free.fr>
References: <CAM2RGhQxbgxRssR5vbK1=GKK9MEANK8W=_k3C=+SC4MBvxaGLw@mail.gmail.com>
 <CAKb7UvgE=OjzC8ZKBcaWcYQgefa5WJ76J=MwAJRUc719oHpDgw@mail.gmail.com>
 <CAM2RGhSqJe-UZkUg==53qUjEBnuWwxyDufbkRJeNs7OSGNNmTw@mail.gmail.com>
 <CAM2RGhQ-ud4QjDYwP+2o4w2SELp3NG=33q=G5Fwk3V-hUqHNTQ@mail.gmail.com>
 <CAM2RGhSkauuCp2y5Jt3DHX5_cWTfiCRLq1HhZatK6FC2KFgmjg@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
Content-Type: multipart/mixed; boundary="===============1414536754=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAM2RGhSkauuCp2y5Jt3DHX5_cWTfiCRLq1HhZatK6FC2KFgmjg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Evan Foss <evanfoss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org


--===============1414536754==
Content-Type: multipart/signed; boundary="Apple-Mail=_C066CADB-1B34-4BFB-A6C2-00B018079877"; protocol="application/pgp-signature"; micalg=pgp-sha512


--Apple-Mail=_C066CADB-1B34-4BFB-A6C2-00B018079877
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_EF2FBF31-585D-422E-B53D-217CFB573629"


--Apple-Mail=_EF2FBF31-585D-422E-B53D-217CFB573629
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Does the Nvidia card auto-suspends or do you have to force it? If not, =
does it report some =E2=80=9Cfailed to parse _DSM=E2=80=9D message?
I have a mid 2009 MBP who uses a different _DSM handles than the ones =
Nouveau currently supports, and I wondered if they were related to the =
Apple Gmux or not. So, as you have a different model with a different =
Nvidia card but still with an Apple Gmux, I=E2=80=99d be interested to =
know if you have the same _DSM handles as I have.

Pierre

> On 15 Feb 2015, at 06:44, Evan Foss <evanfoss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>=20
> Thanks again.
>=20
> This works and the heat has dropped substantially. It is still not as
> cool as I would like but this will do for now. I still need to file a
> bug report with the intel / apple gmux people.
>=20
> -Evan
>=20
> On Sat, Feb 14, 2015 at 10:42 PM, Evan Foss <evanfoss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org =
<mailto:evanfoss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>> wrote:
>> On the older kernel
>>=20
>> [    6.494956] nouveau  [     CLK][0000:01:00.0] 07: core 270-405 MHz
>> memory 838 MHz
>> [    6.494989] nouveau  [     CLK][0000:01:00.0] 0a: core 270-774 MHz
>> memory 1560 MHz
>> [    6.495015] nouveau  [     CLK][0000:01:00.0] 0e: core 270-774 MHz
>> memory 4000 MHz
>> [    6.495182] nouveau  [     CLK][0000:01:00.0] --: core 405 MHz =
memory 680 MHz
>>=20
>> On Sat, Feb 14, 2015 at 10:35 PM, Evan Foss <evanfoss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =
wrote:
>>> Because I am on a macbook the VBIOS might be wonky.
>>>=20
>>> I tried turning off nVidia and using intel. The result was a blank
>>> screen. I know other people had the same bug which was something to =
do
>>> with reprobing lvds?! I saw patches go by and every time I tried one
>>> the results were the same. fail. I was actually about to post a bug
>>> report to the intel (i915) people about it.
>>>=20
>>> I tried to work out how to get optimus to work. After trying several
>>> different sets of instructions I never found a working configuration
>>> and put it aside. I never used to use opengl but lately my pcb
>>> software has adopted it so my needs changed.
>>>=20
>>> I will get back to you with more results on this matter after I get
>>> the newer kernel up.
>>>=20
>>>=20
>>> On Sat, Feb 14, 2015 at 10:09 PM, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> =
wrote:
>>>> On Sat, Feb 14, 2015 at 9:56 PM, Evan Foss <evanfoss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =
wrote:
>>>>> I have a side question which may be the subject of a future second =
bug
>>>>> report. I have been lurking on the nouveau mailing list for some =
time.
>>>>> I understand from various posts that the nvidia gpu clock speed =
right
>>>>> now is set to the lowest possible setting. Why does my machine run =
so
>>>>=20
>>>> Often but not always the case -- the clock speed is whatever the =
VBIOS
>>>> leaves it in. For kepler, that is usually the lowest setting.
>>>>=20
>>>>> much hotter in linux than macos? I turned off the intel graphics =
and
>>>>> the cpu clock is set to the lowest available speed.
>>>>=20
>>>> You should instead turn off the nvidia graphics and run off intel =
--
>>>> intel is much less power-hungry than nvidia, even at the lowest
>>>> clocks. If it's an optimus setup, the nvidia gpu should =
automatically
>>>> power off until needed (either because some display is connected to
>>>> it, or for offloading).
>>>>=20
>>>>>=20
>>>>> How do I get a display of the GPU clocking speeds?
>>>>=20
>>>> You should see it in dmesg... look for CLK lines. The ones with -- =
(or
>>>> AC/DC) will show the current setting. Or boot with nouveau.pstate=3D1=

>>>> and you should have a /sys/class/drm/card*/device/pstate file.
>>>>=20
>>>>  -ilia
>>>=20
>>>=20
>>>=20
>>> --
>>> Home
>>> http://evanfoss.googlepages.com/
>>> Work
>>> http://forge.abcd.harvard.edu/gf/project/epl_engineering/wiki/
>>=20
>>=20
>>=20
>> --
>> Home
>> http://evanfoss.googlepages.com/
>> Work
>> http://forge.abcd.harvard.edu/gf/project/epl_engineering/wiki/
>=20
>=20
>=20
> --
> Home
> http://evanfoss.googlepages.com/ <http://evanfoss.googlepages.com/>
> Work
> http://forge.abcd.harvard.edu/gf/project/epl_engineering/wiki/ =
<http://forge.abcd.harvard.edu/gf/project/epl_engineering/wiki/>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org <mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
> http://lists.freedesktop.org/mailman/listinfo/nouveau =
<http://lists.freedesktop.org/mailman/listinfo/nouveau>

--Apple-Mail=_EF2FBF31-585D-422E-B53D-217CFB573629
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D"">Does the Nvidia card auto-suspends or do you have to force =
it? If not, does it report some =E2=80=9Cfailed to parse _DSM=E2=80=9D =
message?<div class=3D"">I have a mid 2009 MBP who uses a different _DSM =
handles than the ones Nouveau currently supports, and I wondered if they =
were related to the Apple Gmux or not. So, as you have a different model =
with a different Nvidia card but still with an Apple Gmux, I=E2=80=99d =
be interested to know if you have the same _DSM handles as I =
have.</div><div class=3D""><br class=3D""></div><div =
class=3D"">Pierre</div><div class=3D""><br class=3D""><div><blockquote =
type=3D"cite" class=3D""><div class=3D"">On 15 Feb 2015, at 06:44, Evan =
Foss &lt;<a href=3D"mailto:evanfoss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" =
class=3D"">evanfoss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">Thanks again.</span><br style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><br style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><span style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">This works and the heat has dropped =
substantially. It is still not as</span><br style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><span style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">cool as I would like but this will do for now. I =
still need to file a</span><br style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: =
0px;" class=3D""><span style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: =
none; display: inline !important;" class=3D"">bug report with the intel =
/ apple gmux people.</span><br style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: =
0px;" class=3D""><br style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><span style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: =
none; display: inline !important;" class=3D"">-Evan</span><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" class=3D""><br style=3D"font-family:=
 Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><span style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">On Sat, Feb 14, 2015 at 10:42 PM, Evan Foss =
&lt;</span><a href=3D"mailto:evanfoss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D"">evanfoss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a><span =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">&gt; wrote:</span><br style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" class=3D"">On the older kernel<br =
class=3D""><br class=3D"">[ &nbsp;&nbsp;&nbsp;6.494956] nouveau &nbsp;[ =
&nbsp;&nbsp;&nbsp;&nbsp;CLK][0000:01:00.0] 07: core 270-405 MHz<br =
class=3D"">memory 838 MHz<br class=3D"">[ &nbsp;&nbsp;&nbsp;6.494989] =
nouveau &nbsp;[ &nbsp;&nbsp;&nbsp;&nbsp;CLK][0000:01:00.0] 0a: core =
270-774 MHz<br class=3D"">memory 1560 MHz<br class=3D"">[ =
&nbsp;&nbsp;&nbsp;6.495015] nouveau &nbsp;[ =
&nbsp;&nbsp;&nbsp;&nbsp;CLK][0000:01:00.0] 0e: core 270-774 MHz<br =
class=3D"">memory 4000 MHz<br class=3D"">[ &nbsp;&nbsp;&nbsp;6.495182] =
nouveau &nbsp;[ &nbsp;&nbsp;&nbsp;&nbsp;CLK][0000:01:00.0] --: core 405 =
MHz memory 680 MHz<br class=3D""><br class=3D"">On Sat, Feb 14, 2015 at =
10:35 PM, Evan Foss &lt;<a href=3D"mailto:evanfoss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" =
class=3D"">evanfoss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; wrote:<br class=3D""><blockquote =
type=3D"cite" class=3D"">Because I am on a macbook the VBIOS might be =
wonky.<br class=3D""><br class=3D"">I tried turning off nVidia and using =
intel. The result was a blank<br class=3D"">screen. I know other people =
had the same bug which was something to do<br class=3D"">with reprobing =
lvds?! I saw patches go by and every time I tried one<br class=3D"">the =
results were the same. fail. I was actually about to post a bug<br =
class=3D"">report to the intel (i915) people about it.<br class=3D""><br =
class=3D"">I tried to work out how to get optimus to work. After trying =
several<br class=3D"">different sets of instructions I never found a =
working configuration<br class=3D"">and put it aside. I never used to =
use opengl but lately my pcb<br class=3D"">software has adopted it so my =
needs changed.<br class=3D""><br class=3D"">I will get back to you with =
more results on this matter after I get<br class=3D"">the newer kernel =
up.<br class=3D""><br class=3D""><br class=3D"">On Sat, Feb 14, 2015 at =
10:09 PM, Ilia Mirkin &lt;<a href=3D"mailto:imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org" =
class=3D"">imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org</a>&gt; wrote:<br class=3D""><blockquote =
type=3D"cite" class=3D"">On Sat, Feb 14, 2015 at 9:56 PM, Evan Foss =
&lt;<a href=3D"mailto:evanfoss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" =
class=3D"">evanfoss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; wrote:<br class=3D""><blockquote =
type=3D"cite" class=3D"">I have a side question which may be the subject =
of a future second bug<br class=3D"">report. I have been lurking on the =
nouveau mailing list for some time.<br class=3D"">I understand from =
various posts that the nvidia gpu clock speed right<br class=3D"">now is =
set to the lowest possible setting. Why does my machine run so<br =
class=3D""></blockquote><br class=3D"">Often but not always the case -- =
the clock speed is whatever the VBIOS<br class=3D"">leaves it in. For =
kepler, that is usually the lowest setting.<br class=3D""><br =
class=3D""><blockquote type=3D"cite" class=3D"">much hotter in linux =
than macos? I turned off the intel graphics and<br class=3D"">the cpu =
clock is set to the lowest available speed.<br class=3D""></blockquote><br=
 class=3D"">You should instead turn off the nvidia graphics and run off =
intel --<br class=3D"">intel is much less power-hungry than nvidia, even =
at the lowest<br class=3D"">clocks. If it's an optimus setup, the nvidia =
gpu should automatically<br class=3D"">power off until needed (either =
because some display is connected to<br class=3D"">it, or for =
offloading).<br class=3D""><br class=3D""><blockquote type=3D"cite" =
class=3D""><br class=3D"">How do I get a display of the GPU clocking =
speeds?<br class=3D""></blockquote><br class=3D"">You should see it in =
dmesg... look for CLK lines. The ones with -- (or<br class=3D"">AC/DC) =
will show the current setting. Or boot with nouveau.pstate=3D1<br =
class=3D"">and you should have a /sys/class/drm/card*/device/pstate =
file.<br class=3D""><br class=3D"">&nbsp;-ilia<br =
class=3D""></blockquote><br class=3D""><br class=3D""><br class=3D"">--<br=
 class=3D"">Home<br class=3D""><a =
href=3D"http://evanfoss.googlepages.com/" =
class=3D"">http://evanfoss.googlepages.com/</a><br class=3D"">Work<br =
class=3D"">http://forge.abcd.harvard.edu/gf/project/epl_engineering/wiki/<=
br class=3D""></blockquote><br class=3D""><br class=3D""><br =
class=3D"">--<br class=3D"">Home<br class=3D""><a =
href=3D"http://evanfoss.googlepages.com/" =
class=3D"">http://evanfoss.googlepages.com/</a><br class=3D"">Work<br =
class=3D"">http://forge.abcd.harvard.edu/gf/project/epl_engineering/wiki/<=
br class=3D""></blockquote><br style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: =
0px;" class=3D""><br style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><br style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><span style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: =
none; display: inline !important;" class=3D"">--<span =
class=3D"Apple-converted-space">&nbsp;</span></span><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">Home</span><br style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: =
0px;" class=3D""><a href=3D"http://evanfoss.googlepages.com/" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" =
class=3D"">http://evanfoss.googlepages.com/</a><br style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><span style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">Work</span><br style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: =
0px;" class=3D""><a =
href=3D"http://forge.abcd.harvard.edu/gf/project/epl_engineering/wiki/" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" =
class=3D"">http://forge.abcd.harvard.edu/gf/project/epl_engineering/wiki/<=
/a><br style=3D"font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant: normal; font-weight: normal; letter-spacing: =
normal; line-height: normal; orphans: auto; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; widows: =
auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><span=
 style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" =
class=3D"">_______________________________________________</span><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">Nouveau mailing list</span><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" class=3D""><a =
href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" =
class=3D"">Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org</a><br style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><a =
href=3D"http://lists.freedesktop.org/mailman/listinfo/nouveau" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-stroke-width: 0px;" =
class=3D"">http://lists.freedesktop.org/mailman/listinfo/nouveau</a></div>=
</blockquote></div><br class=3D""></div></body></html>=

--Apple-Mail=_EF2FBF31-585D-422E-B53D-217CFB573629--

--Apple-Mail=_C066CADB-1B34-4BFB-A6C2-00B018079877
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJU4HFrAAoJEPMR3LQnHIRJwygQAJXWPxndJuqSObsFT3xNk2DW
X6v5+sERkN3gFyfkUVsmO5b3El56RBxIR2lIe4d+2r0yQiiPZ3aKNmgDWddN/66K
f6GZD7Fekbds13/dOYDBbV4JjVbyDdJjIT/UEKihdydAIWNAj9gmjp6p66Mr+YlJ
dJG6BFvEGFWeQqILZa43MVDZIfWNpruHNhOhqbUlCM18gd8fK0hKTYfBRyIWnvPd
FBB6V7JDy1L2cGjGK0PNPuUnwOBV4aJb+SxJlpvNSmuOU5y4RhAXZAbZeY/DdYon
bKpc7RDr/9zzFumoZzTbRDQ4IjtyKiC5RU99q37eaIzZ7VtM8WR4RUIQFWWABO0k
m2xdrQlv2IjEpAOhV9KuIyG30s/thZeBU6EeGoa1p0SIP1rFH5q6HuCLk8EYUkp1
2uPIYrzmHINU+PYY6g9eYB6mp1p3ytCAlwwJktccYbWUIG6MlinWHBBLZfZj7bUR
SJRh9oGIBLCvQr2Z8La14S20VSaA0pSBOwEY1ynY+7QeKxrQM2Q1V7PBHTuqdH8N
58JgdFI4HbxzVKZ6tYObq/QMOJxuKLQbjD8BZAEByC7xLiqfrxp3Lt3eNdA+c32f
O+HjH9XAOQtdESD6eI0oH1MmhO3or+OmAfgKkYWJzv6j6XXiykLjuJM+4eiBF3Aa
HpXWQfqUEbP3cznDGQUS
=sZnB
-----END PGP SIGNATURE-----

--Apple-Mail=_C066CADB-1B34-4BFB-A6C2-00B018079877--

--===============1414536754==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1414536754==--
