From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98386] [NVE7] bus: MMIO write of FAULT at [ IBUS ],
 Pointer to {TDMS, flat panel} table invalid
Date: Wed, 21 Nov 2018 18:20:46 +0000
Message-ID: <bug-98386-8800-8ZQpxxihiN@http.bugs.freedesktop.org/>
References: <bug-98386-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0210262875=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98386-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0210262875==
Content-Type: multipart/alternative; boundary="15428244463.EeeB0.28546"
Content-Transfer-Encoding: 7bit


--15428244463.EeeB0.28546
Date: Wed, 21 Nov 2018 18:20:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98386

--- Comment #22 from Tolga Cakir <cevelnet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I also have this issue. Dell M3800 here, Intel Core i7-4702HQ, Nvidia Quadro
K1100M, Lynx Point PCH. As already stated earlier in this thread, this lapt=
op's
Nvidia GPU only provides 3D acceleration, but is neither directly connected=
 to
the screen, nor to any outputs (aka "muxless", iirc). I run Arch Linux, ker=
nel
4.19.2.

I also get the issue:
[   21.893456] nouveau 0000:02:00.0: bus: MMIO write of 00000002 FAULT at
4188ac [ IBUS ]

This happens during boot, aswell as after resume from S3. I've noticed power
usage is higher after S3 resume, since nouveau fails to power down the dGPU=
. It
successfully powers down the GPU on first boot though. Doesn't happen with
bbswitch.

I've tested kernel 4.14, where this issue doesn't happen. Nouveau successfu=
lly
powers down the GPU both on first boot and on S3 resume. This seems to be a
regression.

I'm not entirely sure, if this behaviour *really* is related to the nouveau
error message. Please let me know, if there are any patches I can test or a=
nd
debug information I can provide.

Cheers,
Tolga

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15428244463.EeeB0.28546
Date: Wed, 21 Nov 2018 18:20:46 +0000
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
          bz_status_REOPENED "
   title=3D"REOPENED - [NVE7] bus: MMIO write of FAULT at [ IBUS ], Pointer=
 to {TDMS,flat panel} table invalid"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98386#c22">Commen=
t # 22</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - [NVE7] bus: MMIO write of FAULT at [ IBUS ], Pointer=
 to {TDMS,flat panel} table invalid"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98386">bug 98386<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
cevelnet&#64;gmail.com" title=3D"Tolga Cakir &lt;cevelnet&#64;gmail.com&gt;=
"> <span class=3D"fn">Tolga Cakir</span></a>
</span></b>
        <pre>I also have this issue. Dell M3800 here, Intel Core i7-4702HQ,=
 Nvidia Quadro
K1100M, Lynx Point PCH. As already stated earlier in this thread, this lapt=
op's
Nvidia GPU only provides 3D acceleration, but is neither directly connected=
 to
the screen, nor to any outputs (aka &quot;muxless&quot;, iirc). I run Arch =
Linux, kernel
4.19.2.

I also get the issue:
[   21.893456] nouveau 0000:02:00.0: bus: MMIO write of 00000002 FAULT at
4188ac [ IBUS ]

This happens during boot, aswell as after resume from S3. I've noticed power
usage is higher after S3 resume, since nouveau fails to power down the dGPU=
. It
successfully powers down the GPU on first boot though. Doesn't happen with
bbswitch.

I've tested kernel 4.14, where this issue doesn't happen. Nouveau successfu=
lly
powers down the GPU both on first boot and on S3 resume. This seems to be a
regression.

I'm not entirely sure, if this behaviour *really* is related to the nouveau
error message. Please let me know, if there are any patches I can test or a=
nd
debug information I can provide.

Cheers,
Tolga</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15428244463.EeeB0.28546--

--===============0210262875==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0210262875==--
