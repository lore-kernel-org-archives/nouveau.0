From: Adrian Popa <adrian_gh.popa-W9Zz3XeOr4Mo9/FJvwSGXQ@public.gmane.org>
Subject: Re: Enabling TV-out with the nouveau driver
Date: Fri, 11 Jun 2010 08:40:18 +0300
Message-ID: <4C11CC42.3000705@romtelecom.ro>
References: <4C10A1F8.4010107@romtelecom.ro> <87k4q7mavl.fsf@riseup.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------040209030309060002080201"
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <87k4q7mavl.fsf-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--------------040209030309060002080201
Content-Type: multipart/alternative;
 boundary="------------090202030000050907060804"


--------------090202030000050907060804
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I've checked and i have a GeForce 4 MX 440, and i do see a TV-1 in 
xrandr but I didn't manage to configure it with xrandr.

I've looked over [2] and by using *xrandr --output TV-1 --right-of 
VGA-1* i managed to extend my desktop to my TV. Also, i see the window 
transparency effect keeps working ;)

The problem is  - I tried to configure xorg.conf but I didn't manage to 
add the displays side by side (the TV overlaps with the monitor from the 
top-left corner), even if they have different resolutions. I have 
attached my xorg.conf for reference. I realize I must be missing 
something trivial in the configuration. Anyone care to point it out?

Thanks,
Adrian


On 06/10/2010 01:37 PM, Francisco Jerez wrote:
> Adrian Popa<adrian_gh.popa-W9Zz3XeOr4Mo9/FJvwSGXQ@public.gmane.org>  writes:
>
>    
>> Hello everyone,
>>
>> First of all - congratulations on the success of your project. It was
>> about time the community did something about the nvidia drivers! :)
>>
>> Now, I'm still experimenting with nouveau and I have enabled it on a
>> test system that has a rather old Nvidia card (GeForce4 I think) with
>> tv-out. Everything works fine, but I haven't been able to find any
>> examples on how to configure tv-out so I can extend my desktop to my
>> TV.
>>      
> Which card exactly? nv1x-based gf4 cards should be fine but nv2x GPUs
> need an external TV encoder chip (and right now we only have a driver
> for ch7006 and similar external encoders). So, if your card has one of
> the supported encoders, you'll see a "TV-1" connector in the output of
> "xrandr".
>
>    
>> Can anyone help with a demo configuration of Xorg.conf?
>>
>>      
> It's configured as a regular RandR12 output, so it should just work with
> the minimal xorg.conf [1], if you need to do something fancier like
> changing the relative output positions or setting TV-specific
> properties, see [2] and [3] (check out the TV-related kernel module
> parameters too, see "modinfo nouveau").
>
>    
>> Also, I want to ask - if there is any chance of using two displays
>> *and* enabling compositing (window transparency effects) - either with
>> software or hardware acceleration?
>>      
> It should work, but keep in mind that nv1x cards have a rather crude
> pitch limitation (you'll get no hw accel if your desktop is larger than
> 2048x2048).
>
>    
>> By the way, I am using Xubuntu 10.04.
>>
>> Regards,
>> Adrian
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> http://lists.freedesktop.org/mailman/listinfo/nouveau
>>      
> [1] http://nouveau.freedesktop.org/wiki/InstallNouveau
> [2] http://nouveau.freedesktop.org/wiki/Randr12
> [3] http://wiki.debian.org/XStrikeForce/HowToRandR12
>    


-- 
---
Adrian Popa
NOC Division
Network Engineer
Divizia Centrul National de Operare Retea
Departament Transport IP&  Metro
Compartiment IP Core&  Backbone
Phone: +40 21 400 3099


--------------090202030000050907060804
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content=3D"text/html; charset=3DUTF-8" http-equiv=3D"Content-Type=
">
</head>
<body text=3D"#000000" bgcolor=3D"#ffffff">
Hello,<br>
<br>
I've checked and i have a GeForce 4 MX 440, and i do see a TV-1 in
xrandr but I didn't manage to configure it with xrandr.<br>
<br>
I've looked over [2] and by using <b>xrandr --output TV-1 --right-of
VGA-1</b> i managed to extend my desktop to my TV. Also, i see the
window transparency effect keeps working ;)<br>
<br>
The problem is=C2=A0 - I tried to configure xorg.conf but I didn't manage=
 to
add the displays side by side (the TV overlaps with the monitor from
the top-left corner), even if they have different resolutions. I have
attached my xorg.conf for reference. I realize I must be missing
something trivial in the configuration. Anyone care to point it out?<br>
<br>
Thanks,<br>
Adrian<br>
<br>
<br>
On 06/10/2010 01:37 PM, Francisco Jerez wrote:
<blockquote cite=3D"mid:87k4q7mavl.fsf-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org" type=3D"cite">
  <pre wrap=3D"">Adrian Popa <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:adrian_gh.popa-W9Zz3XeOr4Mo9/FJvwSGXQ@public.gmane.org">&lt;adrian_gh.popa-W9Zz3XeOr4Mo9/FJvwSGXQ@public.gmane.org&gt;<=
/a> writes:

  </pre>
  <blockquote type=3D"cite">
    <pre wrap=3D"">Hello everyone,

First of all - congratulations on the success of your project. It was
about time the community did something about the nvidia drivers! :)

Now, I'm still experimenting with nouveau and I have enabled it on a
test system that has a rather old Nvidia card (GeForce4 I think) with
tv-out. Everything works fine, but I haven't been able to find any
examples on how to configure tv-out so I can extend my desktop to my
TV.
    </pre>
  </blockquote>
  <pre wrap=3D"">
Which card exactly? nv1x-based gf4 cards should be fine but nv2x GPUs
need an external TV encoder chip (and right now we only have a driver
for ch7006 and similar external encoders). So, if your card has one of
the supported encoders, you'll see a "TV-1" connector in the output of
"xrandr".

  </pre>
  <blockquote type=3D"cite">
    <pre wrap=3D"">
Can anyone help with a demo configuration of Xorg.conf?

    </pre>
  </blockquote>
  <pre wrap=3D"">It's configured as a regular RandR12 output, so it shoul=
d just work with
the minimal xorg.conf [1], if you need to do something fancier like
changing the relative output positions or setting TV-specific
properties, see [2] and [3] (check out the TV-related kernel module
parameters too, see "modinfo nouveau").

  </pre>
  <blockquote type=3D"cite">
    <pre wrap=3D"">Also, I want to ask - if there is any chance of using =
two displays
*and* enabling compositing (window transparency effects) - either with
software or hardware acceleration?
    </pre>
  </blockquote>
  <pre wrap=3D"">
It should work, but keep in mind that nv1x cards have a rather crude
pitch limitation (you'll get no hw accel if your desktop is larger than
2048x2048).

  </pre>
  <blockquote type=3D"cite">
    <pre wrap=3D"">
By the way, I am using Xubuntu 10.04.

Regards,
Adrian
_______________________________________________
Nouveau mailing list
<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:Nouveau-PD4FTy7X32lMiVNPc3mojA@public.gmane.org=
sktop.org">Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org</a>
<a class=3D"moz-txt-link-freetext" href=3D"http://lists.freedesktop.org/m=
ailman/listinfo/nouveau">http://lists.freedesktop.org/mailman/listinfo/no=
uveau</a>
    </pre>
  </blockquote>
  <pre wrap=3D"">
[1] <a class=3D"moz-txt-link-freetext" href=3D"http://nouveau.freedesktop=
=2Eorg/wiki/InstallNouveau">http://nouveau.freedesktop.org/wiki/InstallNo=
uveau</a>
[2] <a class=3D"moz-txt-link-freetext" href=3D"http://nouveau.freedesktop=
=2Eorg/wiki/Randr12">http://nouveau.freedesktop.org/wiki/Randr12</a>
[3] <a class=3D"moz-txt-link-freetext" href=3D"http://wiki.debian.org/XSt=
rikeForce/HowToRandR12">http://wiki.debian.org/XStrikeForce/HowToRandR12<=
/a>
  </pre>
</blockquote>
<br>
<br>
<pre class=3D"moz-signature" cols=3D"72">--=20
---=20
Adrian Popa
NOC Division
Network Engineer
Divizia Centrul National de Operare Retea
Departament Transport IP &amp; Metro
Compartiment IP Core &amp; Backbone
Phone: +40 21 400 3099
</pre>
</body>
</html>

--------------090202030000050907060804--

--------------040209030309060002080201
Content-Type: text/plain;
 name="xorg.conf"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="xorg.conf"

U2VjdGlvbiAiU2VydmVyTGF5b3V0IgoJSWRlbnRpZmllciAgICAgIlgub3JnIENvbmZpZ3Vy
ZWQiCglTY3JlZW4gICAgICAwICAiU2NyZWVuMCIgMCAwCglJbnB1dERldmljZSAgICAiTW91
c2UwIiAiQ29yZVBvaW50ZXIiCglJbnB1dERldmljZSAgICAiS2V5Ym9hcmQwIiAiQ29yZUtl
eWJvYXJkIgpFbmRTZWN0aW9uCgpTZWN0aW9uICJGaWxlcyIKCU1vZHVsZVBhdGggICAiL3Vz
ci9saWIveG9yZy9tb2R1bGVzIgoJRm9udFBhdGggICAgICIvdXNyL3NoYXJlL2ZvbnRzL1gx
MS9taXNjIgoJRm9udFBhdGggICAgICIvdXNyL3NoYXJlL2ZvbnRzL1gxMS9jeXJpbGxpYyIK
CUZvbnRQYXRoICAgICAiL3Vzci9zaGFyZS9mb250cy9YMTEvMTAwZHBpLzp1bnNjYWxlZCIK
CUZvbnRQYXRoICAgICAiL3Vzci9zaGFyZS9mb250cy9YMTEvNzVkcGkvOnVuc2NhbGVkIgoJ
Rm9udFBhdGggICAgICIvdXNyL3NoYXJlL2ZvbnRzL1gxMS9UeXBlMSIKCUZvbnRQYXRoICAg
ICAiL3Vzci9zaGFyZS9mb250cy9YMTEvMTAwZHBpIgoJRm9udFBhdGggICAgICIvdXNyL3No
YXJlL2ZvbnRzL1gxMS83NWRwaSIKCUZvbnRQYXRoICAgICAiL3Zhci9saWIvZGVmb21hL3gt
dHRjaWRmb250LWNvbmYuZC9kaXJzL1RydWVUeXBlIgoJRm9udFBhdGggICAgICJidWlsdC1p
bnMiCkVuZFNlY3Rpb24KClNlY3Rpb24gIk1vZHVsZSIKCUxvYWQgICJyZWNvcmQiCglMb2Fk
ICAiZHJpMiIKCUxvYWQgICJkcmkiCglMb2FkICAiZ2x4IgoJTG9hZCAgImV4dG1vZCIKCUxv
YWQgICJkYmUiCkVuZFNlY3Rpb24KClNlY3Rpb24gIklucHV0RGV2aWNlIgoJSWRlbnRpZmll
ciAgIktleWJvYXJkMCIKCURyaXZlciAgICAgICJrYmQiCkVuZFNlY3Rpb24KClNlY3Rpb24g
IklucHV0RGV2aWNlIgoJSWRlbnRpZmllciAgIk1vdXNlMCIKCURyaXZlciAgICAgICJtb3Vz
ZSIKCU9wdGlvbgkgICAgIlByb3RvY29sIiAiYXV0byIKCU9wdGlvbgkgICAgIkRldmljZSIg
Ii9kZXYvaW5wdXQvbWljZSIKCU9wdGlvbgkgICAgIlpBeGlzTWFwcGluZyIgIjQgNSA2IDci
CkVuZFNlY3Rpb24KClNlY3Rpb24gIk1vbml0b3IiCglEaXNwbGF5U2l6ZQkgIDM0MCAgIDI3
MAkjIG1tCglJZGVudGlmaWVyICAgIlZHQS0xIgoJVmVuZG9yTmFtZSAgICJORUMiCglNb2Rl
bE5hbWUgICAgIkxDRDcyVk0iCglIb3JpelN5bmMgICAgMzEuMCAtIDgxLjAKCVZlcnRSZWZy
ZXNoICA1Ni4wIC0gNzUuMAoJT3B0aW9uCSAgICAiRFBNUyIKRW5kU2VjdGlvbgoKU2VjdGlv
biAiTW9uaXRvciIKCUlkZW50aWZpZXIgICAiVFYtMSIgCiAgICAgICAgSG9yaXpTeW5jICAg
IDMwLTUwCglWZXJ0UmVmcmVzaCAgNjAKCU9wdGlvbiAiUmlnaHRPZiIgIk1vbml0b3IwIgoJ
IyA3MjB4NTc2IEAgNTBIeiwgMzEuMjVrSHosIGl0dS1yIGJ0LjEzNTggNjI1LzUwL3AvMTox
LCBSR0IsIFlQYlByLCBIRE1JCglNb2RlTGluZSAiNzIweDU3NkA1MCIgIDI3ICAgICA3MjAg
NzMyIDc5NSA4NjQgIDU3NiA1ODEgNTg2IDYyNSAtaHN5bmMgLXZzeW5jCgkjIG5vbnN0YW5k
YXJkIFBBTCAoV29ya3Mgd2l0aCBCT0IgZGVpbnRlcmxhY2UpIEl0IGlzIDYwSHogYnV0IHdv
cmtzIHdlbGwgd2l0aCBuVklESUEgUEFMLUIgVFYtT1VUCgkjIE52aWRpYSBvcHRpb246IE9w
dGlvbiAiVFZTdGFuZGFyZCIgIlBBTC1CIgoJTW9kZUxpbmUgIjcyMHg1NzZANjAiIDMyLjcg
IDcyMCA3NDQgODE2IDkxMiAgNTc2IDU3NyA1ODAgNTk3CgoJIyBUaGlzIG1vZGVsaW5lIGlz
IDUwSHogaW50ZXJsYWNlZCBhbmQgd29ya3Mgd2VsbCB3aXRoIGtlcm5lbGRlaW50OgoJTW9k
ZUxpbmUgIjcyMHg1NzZpIiAxMy44NzUgIDcyMCA3NDQgODA4IDg4OCAgNTc2IDU4MSA1ODYg
NjI1IC1oc3luYyAtdnN5bmMgaW50ZXJsYWNlCgkKRW5kU2VjdGlvbgkKU2VjdGlvbiAiRGV2
aWNlIgogICAgICAgICMjIyBBdmFpbGFibGUgRHJpdmVyIG9wdGlvbnMgYXJlOi0KICAgICAg
ICAjIyMgVmFsdWVzOiA8aT46IGludGVnZXIsIDxmPjogZmxvYXQsIDxib29sPjogIlRydWUi
LyJGYWxzZSIsCiAgICAgICAgIyMjIDxzdHJpbmc+OiAiU3RyaW5nIiwgPGZyZXE+OiAiPGY+
IEh6L2tIei9NSHoiCiAgICAgICAgIyMjIFthcmddOiBhcmcgb3B0aW9uYWwKICAgICAgICAj
T3B0aW9uICAgICAiU1djdXJzb3IiICAgICAgICAgICAJIyBbPGJvb2w+XQogICAgICAgICNP
cHRpb24gICAgICJIV2N1cnNvciIgICAgICAgICAgIAkjIFs8Ym9vbD5dCiAgICAgICAgI09w
dGlvbiAgICAgIk5vQWNjZWwiICAgICAgICAgICAgCSMgWzxib29sPl0KICAgICAgICAjT3B0
aW9uICAgICAiU2hhZG93RkIiICAgICAgICAgICAJIyBbPGJvb2w+XQogICAgICAgICNPcHRp
b24gICAgICJVc2VGQkRldiIgICAgICAgICAgIAkjIFs8Ym9vbD5dCiAgICAgICAgI09wdGlv
biAgICAgIlJvdGF0ZSIgICAgICAgICAgICAgCSMgWzxzdHI+XQogICAgICAgICNPcHRpb24g
ICAgICJWaWRlb0tleSIgICAgICAgICAgIAkjIDxpPgogICAgICAgICNPcHRpb24gICAgICJG
bGF0UGFuZWwiICAgICAgICAgIAkjIFs8Ym9vbD5dCiAgICAgICAgI09wdGlvbiAgICAgIkZQ
RGl0aGVyIiAgICAgICAgICAgCSMgWzxib29sPl0KICAgICAgICAjT3B0aW9uICAgICAiQ3J0
Y051bWJlciIgICAgICAgICAJIyA8aT4KICAgICAgICAjT3B0aW9uICAgICAiRlBTY2FsZSIg
ICAgICAgICAgICAJIyBbPGJvb2w+XQogICAgICAgICNPcHRpb24gICAgICJGUFR3ZWFrIiAg
ICAgICAgICAgIAkjIDxpPgogICAgICAgICNPcHRpb24gICAgICJEdWFsSGVhZCIgICAiVHJ1
ZSIgICAgICAgIAkjIFs8Ym9vbD5dCglJZGVudGlmaWVyICAiQ2FyZDAiCglEcml2ZXIgICAg
ICAibm91dmVhdSIKCVZlbmRvck5hbWUgICJuVmlkaWEgQ29ycG9yYXRpb24iCglCb2FyZE5h
bWUgICAiTlYxOCBbR2VGb3JjZTQgTVggNDQwIEFHUCA4eF0iCglCdXNJRCAgICAgICAiUENJ
OjI6MDowIgoJT3B0aW9uCSAgICAiTW9uaXRvci1WR0EtMSIgIlZHQS0xIgoJT3B0aW9uCSAg
ICAiTW9uaXRvci1UVi0xIiAiVFYtMSIKRW5kU2VjdGlvbgoKU2VjdGlvbiAiU2NyZWVuIgoJ
SWRlbnRpZmllciAiU2NyZWVuMCIKCURldmljZSAgICAgIkNhcmQwIgoJI01vbml0b3IgICAg
Ik1vbml0b3IwIgoJU3ViU2VjdGlvbiAiRGlzcGxheSIKCQlWaWV3cG9ydCAgIDAgMAoJCURl
cHRoICAgICAxCglFbmRTdWJTZWN0aW9uCglTdWJTZWN0aW9uICJEaXNwbGF5IgoJCVZpZXdw
b3J0ICAgMCAwCgkJRGVwdGggICAgIDQKCUVuZFN1YlNlY3Rpb24KCVN1YlNlY3Rpb24gIkRp
c3BsYXkiCgkJVmlld3BvcnQgICAwIDAKCQlEZXB0aCAgICAgOAoJRW5kU3ViU2VjdGlvbgoJ
U3ViU2VjdGlvbiAiRGlzcGxheSIKCQlWaWV3cG9ydCAgIDAgMAoJCURlcHRoICAgICAxNQoJ
RW5kU3ViU2VjdGlvbgoJU3ViU2VjdGlvbiAiRGlzcGxheSIKCQlWaWV3cG9ydCAgIDAgMAoJ
CURlcHRoICAgICAxNgoJRW5kU3ViU2VjdGlvbgoJU3ViU2VjdGlvbiAiRGlzcGxheSIKCQlW
aWV3cG9ydCAgIDAgMAoJCURlcHRoICAgICAyNAoJRW5kU3ViU2VjdGlvbgpFbmRTZWN0aW9u
Cgo=
--------------040209030309060002080201
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------040209030309060002080201--
