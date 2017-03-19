From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99584] XVMC on nv43 class card broken with recent
 mesa + kernel.
Date: Sun, 19 Mar 2017 02:24:35 +0000
Message-ID: <bug-99584-8800-kED18kd8M2@http.bugs.freedesktop.org/>
References: <bug-99584-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0962409494=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99584-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0962409494==
Content-Type: multipart/alternative; boundary="14898902751.73D3CdFD.3400";
 charset="UTF-8"


--14898902751.73D3CdFD.3400
Date: Sun, 19 Mar 2017 02:24:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99584

--- Comment #4 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
FWIW with mesa 17.0.1 and kernel 4.10.4, I'm unable to fully reproduce the
issue. I have a NV4A, which uses the nv44 mpeg object, which in turn is rat=
her
different than the "plain" nv40 one which you have.

I get a ton of warnings in dmesg:

[15871.309494] nouveau 0000:09:00.0: mpeg: ch 4 [00060530 mplayer[26300]]
01000000 00000010 000001b0 00006051
[15871.309516] nouveau 0000:09:00.0: mpeg: ch 4 [00060530 mplayer[26300]]
01000000 00000020 00000380 0058b000
[15871.309531] nouveau 0000:09:00.0: mpeg: ch 4 [00060530 mplayer[26300]]
01000000 00000020 0000038c 0068b000
[15871.326326] nouveau 0000:09:00.0: mpeg: ch 4 [00060530 mplayer[26300]]
01000000 00000020 00000380 0058b000
[15871.326356] nouveau 0000:09:00.0: mpeg: ch 4 [00060530 mplayer[26300]]
01000000 00000020 00000384 0000b350
[15871.326371] nouveau 0000:09:00.0: mpeg: ch 4 [00060530 mplayer[26300]]
01000000 00000020 0000038c 0068b000
[15871.326385] nouveau 0000:09:00.0: mpeg: ch 4 [00060530 mplayer[26300]]
01000000 00000020 00000390 000467e8
[15871.372669] nouveau 0000:09:00.0: mpeg: ch 4 [00060530 mplayer[26300]]
01000000 00000020 00000380 0058b000
[15871.372690] nouveau 0000:09:00.0: mpeg: ch 4 [00060530 mplayer[26300]]
01000000 00000020 00000384 000069c0
[15871.372708] nouveau 0000:09:00.0: mpeg: ch 4 [00060530 mplayer[26300]]
01000000 00000020 0000038c 0068b000
[15871.372723] nouveau 0000:09:00.0: mpeg: ch 4 [00060530 mplayer[26300]]
01000000 00000020 00000390 00010604

and so on. The first one is harmless (simple bug that causes it to be print=
ed
instead of hidden), but the rest are harmful. The end-result is random junk=
 on
the screen, but that makes perfect sense given the above errors. I have fix=
es
for some things, but not others. Will update when I have fixed my setup.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14898902751.73D3CdFD.3400
Date: Sun, 19 Mar 2017 02:24:35 +0000
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
          bz_status_NEW "
   title=3D"NEW - XVMC on nv43 class card broken with recent mesa + kernel."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99584#c4">Comment=
 # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - XVMC on nv43 class card broken with recent mesa + kernel."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99584">bug 99584<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>FWIW with mesa 17.0.1 and kernel 4.10.4, I'm unable to fully r=
eproduce the
issue. I have a NV4A, which uses the nv44 mpeg object, which in turn is rat=
her
different than the &quot;plain&quot; nv40 one which you have.

I get a ton of warnings in dmesg:

[15871.309494] nouveau 0000:09:00.0: mpeg: ch 4 [00060530 mplayer[26300]]
01000000 00000010 000001b0 00006051
[15871.309516] nouveau 0000:09:00.0: mpeg: ch 4 [00060530 mplayer[26300]]
01000000 00000020 00000380 0058b000
[15871.309531] nouveau 0000:09:00.0: mpeg: ch 4 [00060530 mplayer[26300]]
01000000 00000020 0000038c 0068b000
[15871.326326] nouveau 0000:09:00.0: mpeg: ch 4 [00060530 mplayer[26300]]
01000000 00000020 00000380 0058b000
[15871.326356] nouveau 0000:09:00.0: mpeg: ch 4 [00060530 mplayer[26300]]
01000000 00000020 00000384 0000b350
[15871.326371] nouveau 0000:09:00.0: mpeg: ch 4 [00060530 mplayer[26300]]
01000000 00000020 0000038c 0068b000
[15871.326385] nouveau 0000:09:00.0: mpeg: ch 4 [00060530 mplayer[26300]]
01000000 00000020 00000390 000467e8
[15871.372669] nouveau 0000:09:00.0: mpeg: ch 4 [00060530 mplayer[26300]]
01000000 00000020 00000380 0058b000
[15871.372690] nouveau 0000:09:00.0: mpeg: ch 4 [00060530 mplayer[26300]]
01000000 00000020 00000384 000069c0
[15871.372708] nouveau 0000:09:00.0: mpeg: ch 4 [00060530 mplayer[26300]]
01000000 00000020 0000038c 0068b000
[15871.372723] nouveau 0000:09:00.0: mpeg: ch 4 [00060530 mplayer[26300]]
01000000 00000020 00000390 00010604

and so on. The first one is harmless (simple bug that causes it to be print=
ed
instead of hidden), but the rest are harmful. The end-result is random junk=
 on
the screen, but that makes perfect sense given the above errors. I have fix=
es
for some things, but not others. Will update when I have fixed my setup.</p=
re>
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

--14898902751.73D3CdFD.3400--

--===============0962409494==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0962409494==--
