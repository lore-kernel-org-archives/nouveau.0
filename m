From: Logan Anteau <logan.anteau-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Issues with GeForce 6800 Ultra (NV40) and nouveau on
	linux 4.4 (powerpc)
Date: Thu, 21 Jan 2016 00:35:39 -0500
Message-ID: <CAJiik2ZL03e9tRA+cDkR0cfirfGybgLfjne5en+SVaD7L=TTaA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1552734796=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1552734796==
Content-Type: multipart/alternative; boundary=047d7b47245a14c9090529d179af

--047d7b47245a14c9090529d179af
Content-Type: text/plain; charset=UTF-8

I recently acquired an old PowerMac G5 that has an AGP GeForce 6800 Ultra
(NV40) in it. I put debian stretch (testing) on it and am having issues
getting the 6800 Ultra working with nouveau.

Software versions:
linux: 4.4.0 (powerpc)
libdrm: 2.4.65
mesa: 11.0.8
nouveau: 1.0.12

On boot when the system starts Xorg I get an initially black screen that
finally changes to a screen that has distorted multicolored bars in the
screen.

Two interesting lines from dmesg:

[   25.965156] nouveau 0000:f0:10.0: gr: intr 00100000 [ERROR] nsource
00000010 [LIMIT_COLOR] nstatus 04000000 [PROTECTION_FAULT] ch 1 [0008e000
Xorg[847]] subc 4 class 009f mthd 0308 data 04380780


[   67.550355] nouveau 0000:f0:10.0: DRM: GPU lockup - switching to
software fbcon


Full dmesg:

http://pastebin.com/WhfMbu9M

Full Xorg.0.log:

http://pastebin.com/2nn4CVkx

lspci -v:

http://pastebin.com/wRK9PwdZ


Please let me know if there is any other information that would be helpful.
I hope someone has some ideas of what to try next. Thanks in advance for
everyone's time!


Logan

--047d7b47245a14c9090529d179af
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I recently acquired an old PowerMac G5 that has an AGP GeF=
orce 6800 Ultra (NV40) in it. I put debian stretch (testing) on it and am h=
aving issues getting the 6800 Ultra working with nouveau.<div><br></div><di=
v>Software versions:</div><div>linux: 4.4.0 (powerpc)</div><div>libdrm: 2.4=
.65</div><div>mesa: 11.0.8</div><div>nouveau: 1.0.12</div><div><br></div><d=
iv>On boot when the system starts Xorg I get an initially black screen that=
 finally changes to a screen that has distorted multicolored bars in the sc=
reen.</div><div><br></div><div>Two interesting lines from dmesg:</div><div>







<p class=3D""><span class=3D"">[ =C2=A0 25.965156] </span><span class=3D"">=
nouveau 0000:f0:10.0</span><span class=3D"">: gr: intr 00100000 [ERROR] nso=
urce 00000010 [LIMIT_COLOR] nstatus 04000000 [PROTECTION_FAULT] ch 1 [0008e=
000 Xorg[847]] subc 4 class 009f mthd 0308 data 04380780</span></p><p class=
=3D""><span class=3D""><br></span></p><p class=3D""><span class=3D"">







</span></p><p class=3D""><span class=3D"">[ =C2=A0 67.550355] </span><span =
class=3D"">nouveau 0000:f0:10.0</span><span class=3D"">: DRM: GPU lockup - =
switching to software fbcon</span></p><p class=3D""><span class=3D""><br></=
span></p><p class=3D""><span class=3D"">Full dmesg:</span></p><p class=3D""=
><span class=3D""><a href=3D"http://pastebin.com/WhfMbu9M">http://pastebin.=
com/WhfMbu9M</a></span></p><p class=3D""><span class=3D"">Full Xorg.0.log:<=
/span></p><p class=3D""><span class=3D""><a href=3D"http://pastebin.com/2nn=
4CVkx">http://pastebin.com/2nn4CVkx</a></span></p><p class=3D""><span class=
=3D"">lspci -v:</span></p><p class=3D""><span class=3D""><a href=3D"http://=
pastebin.com/wRK9PwdZ">http://pastebin.com/wRK9PwdZ</a><br></span></p><p cl=
ass=3D""><br></p><p class=3D"">Please let me know if there is any other inf=
ormation that would be helpful. I hope someone has some ideas of what to tr=
y next. Thanks in advance for everyone&#39;s time!</p><p class=3D""><br></p=
><p class=3D"">Logan</p></div></div>

--047d7b47245a14c9090529d179af--

--===============1552734796==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1552734796==--
