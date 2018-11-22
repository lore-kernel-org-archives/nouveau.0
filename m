From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 108058] After resuming from suspend,
 discrete GPU is powered on and can't be turned off
Date: Thu, 22 Nov 2018 14:31:32 +0000
Message-ID: <bug-108058-8800-c3BsTB1EkJ@http.bugs.freedesktop.org/>
References: <bug-108058-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1557802794=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-108058-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1557802794==
Content-Type: multipart/alternative; boundary="15428970921.aDfc.24838"
Content-Transfer-Encoding: 7bit


--15428970921.aDfc.24838
Date: Thu, 22 Nov 2018 14:31:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108058

--- Comment #1 from Tolga Cakir <cevelnet-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I might have the same issue - I posted it under bug 98386. Happens on a Dell
M3800, Intel Core i7-4702HQ, Nvidia Quadro K1100M, Arch Linux w/ kernel 4.1=
9.2.

Same as you, after fresh boot I get around  ~7W in idle and after S3 resume=
 I
get 15W and more, no matter how long I wait. Contrary to your observations,
bbswitch works for me; nouveau doesn't.

I have found out, that echoing lowest pstate (/sys/kernel/debug/dri/*/pstat=
e)
after S3 resume solves this issue. Power consumption drops back to 7-8W in
idle.

I will post full dmidecode and dmesg in a couple of hours.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15428970921.aDfc.24838
Date: Thu, 22 Nov 2018 14:31:32 +0000
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
   title=3D"NEW - After resuming from suspend, discrete GPU is powered on a=
nd can't be turned off"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108058#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - After resuming from suspend, discrete GPU is powered on a=
nd can't be turned off"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108058">bug 10805=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
cevelnet&#64;gmail.com" title=3D"Tolga Cakir &lt;cevelnet&#64;gmail.com&gt;=
"> <span class=3D"fn">Tolga Cakir</span></a>
</span></b>
        <pre>I might have the same issue - I posted it under <a class=3D"bz=
_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - [NVE7] bus: MMIO write of FAULT at [ IBUS ], Pointer=
 to {TDMS,flat panel} table invalid"
   href=3D"show_bug.cgi?id=3D98386">bug 98386</a>. Happens on a Dell
M3800, Intel Core i7-4702HQ, Nvidia Quadro K1100M, Arch Linux w/ kernel 4.1=
9.2.

Same as you, after fresh boot I get around  ~7W in idle and after S3 resume=
 I
get 15W and more, no matter how long I wait. Contrary to your observations,
bbswitch works for me; nouveau doesn't.

I have found out, that echoing lowest pstate (/sys/kernel/debug/dri/*/pstat=
e)
after S3 resume solves this issue. Power consumption drops back to 7-8W in
idle.

I will post full dmidecode and dmesg in a couple of hours.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15428970921.aDfc.24838--

--===============1557802794==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1557802794==--
