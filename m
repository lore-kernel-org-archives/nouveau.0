From: =?UTF-8?Q?Jes=C3=BAs_J=2E_Guerrero_Botella?=
 <jesus.guerrero.botella-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: GPU lockup - switching to software fbcon
Date: Tue, 17 Jun 2014 17:04:29 +0200
Message-ID: <CAMix8LF7NRZm2gGDgv895tHbEdMKLC7o_H5pz_gWTekbSCYARQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2123644598=="
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

--===============2123644598==
Content-Type: multipart/alternative; boundary=001a1132f7e8de4bf804fc097504

--001a1132f7e8de4bf804fc097504
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi.

I am new to the listm so, first of all I'd like to say hello to everyone
here in the list.

I hope this list is an adequate place to post this; else, please, kindly
direct me to the right list :)

I write because I am having an issue with nouveau and mplayer. I have been
only able to reproduce it with mplayer, but I think the issue lies in
nouveau, either the kernel part or libdrm.

The thing goes as follows:

1) I run "mplayer <random video file>", I have tried mkv and regular divx
or mpeg video files, also youtube videos via the youtube-viewer tool, which
uses mplayer as a backend to play youtube videos. The result is always the
same, with independence of the video type.

2) The laptop seems to hang. However, I can still move the mouse. No
element in the UI reacts though.

3) If I wait enough time, I am suddenly thrown out to the VT, the pc still
seems quite laggy. Eventually, it recovers and I can write commands into
the VT.

4) At the end of dmesg I can see by now this output:

[  268.469736] nouveau E[     DRM] GPU lockup - switching to software fbcon
[  283.487035] nouveau E[ X[2154]] failed to idle channel 0xcccc0001
[X[2154]]
[  298.487016] nouveau E[ X[2154]] failed to idle channel 0xcccc0001
[X[2154]]
[  313.487034] nouveau E[ X[2154]] failed to idle channel 0xcccc0000
[X[2154]]
[  328.487016] nouveau E[ X[2154]] failed to idle channel 0xcccc0000
[X[2154]]
[  343.587031] nouveau E[chrome[2279]] failed to idle channel 0xcccc0000
[chrome[2279]]
[  358.587019] nouveau E[chrome[2279]] failed to idle channel 0xcccc0000
[chrome[2279]]
[  373.589020] nouveau E[mplayer[2314]] failed to idle channel 0xcccc0000
[mplayer[2314]]
[  388.589031] nouveau E[mplayer[2314]] failed to idle channel 0xcccc0000
[mplayer[2314]]

5) In the X log I can see this:

(EE) [mi] EQ overflowing.  Additional events will be discarded until
existing events are processed.
(EE)
(EE) Backtrace:
(EE) 0: /usr/bin/X (xorg_backtrace+0x42) [0x592d42]
(EE) 1: /usr/bin/X (mieqEnqueue+0x26b) [0x5741fb]
(EE) 2: /usr/bin/X (0x400000+0x50fc2) [0x450fc2]
(EE) 3: /usr/bin/X (xf86PostMotionEvent+0xc0) [0x489eb0]
(EE) 4: /usr/lib64/xorg/modules/input/synaptics_drv.so
(0x7ff5f046c000+0x535c) [0x7ff5f047135c]
(EE) 5: /usr/lib64/xorg/modules/input/synaptics_drv.so
(0x7ff5f046c000+0x6f32) [0x7ff5f0472f32]
(EE) 6: /usr/bin/X (0x400000+0x7a087) [0x47a087]
(EE) 7: /usr/bin/X (0x400000+0xa3518) [0x4a3518]
(EE) 8: /lib64/libpthread.so.0 (0x7ff5f6f47000+0x10b10) [0x7ff5f6f57b10]
(EE) 9: /lib64/libc.so.6 (ioctl+0x7) [0x7ff5f5c8e897]
(EE) 10: /usr/lib64/libdrm.so.2 (drmIoctl+0x28) [0x7ff5f6d3f258]
(EE) 11: /usr/lib64/libdrm.so.2 (drmCommandWrite+0x1b) [0x7ff5f6d4162b]
(EE) 12: /usr/lib64/libdrm_nouveau.so.2 (nouveau_bo_wait+0x89)
[0x7ff5f301b959]
(EE) 13: /usr/lib64/xorg/modules/drivers/nouveau_drv.so
(0x7ff5f3220000+0x7bb3) [0x7ff5f3227bb3]
(EE) 14: /usr/lib64/xorg/modules/libexa.so (0x7ff5f2bdb000+0xbba0)
[0x7ff5f2be6ba0]
(EE) 15: /usr/bin/X (0x400000+0x183a73) [0x583a73]
(EE) 16: /usr/bin/X (0x400000+0xc8dc0) [0x4c8dc0]
(EE) 17: /usr/bin/X (0x400000+0x38eb8) [0x438eb8]
(EE) 18: /usr/bin/X (0x400000+0x3bd2e) [0x43bd2e]
(EE) 19: /usr/bin/X (0x400000+0x3faea) [0x43faea]
(EE) 20: /lib64/libc.so.6 (__libc_start_main+0xf5) [0x7ff5f5bcdbf5]
(EE) 21: /usr/bin/X (0x400000+0x2a541) [0x42a541]
(EE)
(EE) [mi] These backtraces from mieqEnqueue may point to a culprit higher
up the stack.
(EE) [mi] mieq is *NOT* the cause.  It is a victim.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D

This is on Gentoo, with kernel 3.15.0 (but it also happened with 3.14.5.
The arch is amd64. I am using nouveau 1.0.10, mesa 10.0.4, libdrm 2.4.52
and (probably irrelevant) mplayer 1.1.1.

The kernel is unpatched, from kernel.org (no Gentoo stuff nor anything like
that).

I have no idea how to start debugging this, so any pointer is welcome. Just
for the sake of completeness, I have tried the nvidia blob and then it
works without a problem. However I am not interested in using that. If
nouveau fails I'd rather stick to vesa.

Thanks for reading, and, please, forgive the long post. If you need some
more info, please, feel free to ask and I will try to do my best. I can
recompile anything and I can find my way around gdb as long as you tell me
what to look for :)

--=20
Jes=C3=BAs Guerrero Botella

--001a1132f7e8de4bf804fc097504
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi.<div><br></div><div>I am new to the listm so, first of =
all I&#39;d like to say hello to everyone here in the list.</div><div><br><=
/div><div>I hope this list is an adequate place to post this; else, please,=
 kindly direct me to the right list :)</div>
<div><br></div><div>I write because I am having an issue with nouveau and m=
player. I have been only able to reproduce it with mplayer, but I think the=
 issue lies in nouveau, either the kernel part or libdrm.</div><div><br>
</div><div>The thing goes as follows:</div><div><br></div><div>1) I run &qu=
ot;mplayer &lt;random video file&gt;&quot;, I have tried mkv and regular di=
vx or mpeg video files, also youtube videos via the youtube-viewer tool, wh=
ich uses mplayer as a backend to play youtube videos. The result is always =
the same, with independence of the video type.</div>
<div><br></div><div>2) The laptop seems to hang. However, I can still move =
the mouse. No element in the UI reacts though.</div><div><br></div><div>3) =
If I wait enough time, I am suddenly thrown out to the VT, the pc still see=
ms quite laggy. Eventually, it recovers and I can write commands into the V=
T.</div>
<div><br></div><div>4) At the end of dmesg I can see by now this output:</d=
iv><div><br></div><div><div>[ =C2=A0268.469736] nouveau E[ =C2=A0 =C2=A0 DR=
M] GPU lockup - switching to software fbcon</div><div>[ =C2=A0283.487035] n=
ouveau E[ X[2154]] failed to idle channel 0xcccc0001 [X[2154]]</div>
<div>[ =C2=A0298.487016] nouveau E[ X[2154]] failed to idle channel 0xcccc0=
001 [X[2154]]</div><div>[ =C2=A0313.487034] nouveau E[ X[2154]] failed to i=
dle channel 0xcccc0000 [X[2154]]</div><div>[ =C2=A0328.487016] nouveau E[ X=
[2154]] failed to idle channel 0xcccc0000 [X[2154]]</div>
<div>[ =C2=A0343.587031] nouveau E[chrome[2279]] failed to idle channel 0xc=
ccc0000 [chrome[2279]]</div><div>[ =C2=A0358.587019] nouveau E[chrome[2279]=
] failed to idle channel 0xcccc0000 [chrome[2279]]</div><div>[ =C2=A0373.58=
9020] nouveau E[mplayer[2314]] failed to idle channel 0xcccc0000 [mplayer[2=
314]]</div>
<div>[ =C2=A0388.589031] nouveau E[mplayer[2314]] failed to idle channel 0x=
cccc0000 [mplayer[2314]]</div><div><br></div><div>5) In the X log I can see=
 this:</div><div><br></div><div><div>(EE) [mi] EQ overflowing. =C2=A0Additi=
onal events will be discarded until existing events are processed.</div>
<div>(EE)</div><div>(EE) Backtrace:</div><div>(EE) 0: /usr/bin/X (xorg_back=
trace+0x42) [0x592d42]</div><div>(EE) 1: /usr/bin/X (mieqEnqueue+0x26b) [0x=
5741fb]</div><div>(EE) 2: /usr/bin/X (0x400000+0x50fc2) [0x450fc2]</div>
<div>(EE) 3: /usr/bin/X (xf86PostMotionEvent+0xc0) [0x489eb0]</div><div>(EE=
) 4: /usr/lib64/xorg/modules/input/synaptics_drv.so (0x7ff5f046c000+0x535c)=
 [0x7ff5f047135c]</div><div>(EE) 5: /usr/lib64/xorg/modules/input/synaptics=
_drv.so (0x7ff5f046c000+0x6f32) [0x7ff5f0472f32]</div>
<div>(EE) 6: /usr/bin/X (0x400000+0x7a087) [0x47a087]</div><div>(EE) 7: /us=
r/bin/X (0x400000+0xa3518) [0x4a3518]</div><div>(EE) 8: /lib64/libpthread.s=
o.0 (0x7ff5f6f47000+0x10b10) [0x7ff5f6f57b10]</div><div>(EE) 9: /lib64/libc=
.so.6 (ioctl+0x7) [0x7ff5f5c8e897]</div>
<div>(EE) 10: /usr/lib64/libdrm.so.2 (drmIoctl+0x28) [0x7ff5f6d3f258]</div>=
<div>(EE) 11: /usr/lib64/libdrm.so.2 (drmCommandWrite+0x1b) [0x7ff5f6d4162b=
]</div><div>(EE) 12: /usr/lib64/libdrm_nouveau.so.2 (nouveau_bo_wait+0x89) =
[0x7ff5f301b959]</div>
<div>(EE) 13: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (0x7ff5f322000=
0+0x7bb3) [0x7ff5f3227bb3]</div></div><div><div>(EE) 14: /usr/lib64/xorg/mo=
dules/libexa.so (0x7ff5f2bdb000+0xbba0) [0x7ff5f2be6ba0]</div><div>(EE) 15:=
 /usr/bin/X (0x400000+0x183a73) [0x583a73]</div>
<div>(EE) 16: /usr/bin/X (0x400000+0xc8dc0) [0x4c8dc0]</div><div>(EE) 17: /=
usr/bin/X (0x400000+0x38eb8) [0x438eb8]</div><div>(EE) 18: /usr/bin/X (0x40=
0000+0x3bd2e) [0x43bd2e]</div><div>(EE) 19: /usr/bin/X (0x400000+0x3faea) [=
0x43faea]</div>
<div>(EE) 20: /lib64/libc.so.6 (__libc_start_main+0xf5) [0x7ff5f5bcdbf5]</d=
iv><div>(EE) 21: /usr/bin/X (0x400000+0x2a541) [0x42a541]</div><div>(EE)</d=
iv><div>(EE) [mi] These backtraces from mieqEnqueue may point to a culprit =
higher up the stack.</div>
<div>(EE) [mi] mieq is *NOT* the cause. =C2=A0It is a victim.</div></div><d=
iv><br></div><div>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</div><div><br></div><div>This is=
 on Gentoo, with kernel 3.15.0 (but it also happened with 3.14.5. The arch =
is amd64. I am using nouveau 1.0.10, mesa 10.0.4, libdrm 2.4.52 and (probab=
ly irrelevant) mplayer 1.1.1.</div>
<div><br></div><div>The kernel is unpatched, from <a href=3D"http://kernel.=
org">kernel.org</a> (no Gentoo stuff nor anything like that).=C2=A0</div><d=
iv><br></div><div>I have no idea how to start debugging this, so any pointe=
r is welcome. Just for the sake of completeness, I have tried the nvidia bl=
ob and then it works without a problem. However I am not interested in usin=
g that. If nouveau fails I&#39;d rather stick to vesa.</div>
<div><br></div><div>Thanks for reading, and, please, forgive the long post.=
 If you need some more info, please, feel free to ask and I will try to do =
my best. I can recompile anything and I can find my way around gdb as long =
as you tell me what to look for :)</div>
<div><br></div>-- <br>Jes=C3=BAs Guerrero Botella
</div></div>

--001a1132f7e8de4bf804fc097504--

--===============2123644598==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2123644598==--
