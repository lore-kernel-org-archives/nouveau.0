From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54587] [NV1F] Flickering screen on Geforce 4
Date: Fri, 03 Jun 2016 04:33:07 +0000
Message-ID: <bug-54587-8800-Tsmg5I0SYJ@http.bugs.freedesktop.org/>
References: <bug-54587-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0857673528=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54587-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0857673528==
Content-Type: multipart/alternative; boundary="14649283874.d80888F.7996";
 charset="UTF-8"


--14649283874.d80888F.7996
Date: Fri, 3 Jun 2016 04:33:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D54587

--- Comment #35 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Patrick McMunn from comment #34)
> I wonder if this bug may either be related to, or may actually be the same
> as, bug 61537. I also have this same issue with a PC using an nVidia GeFo=
rce
> 4 MX IGP, and I know that the monitor attached to it has a bad EDID. I
> suspect Vesa may also have a monitor with a bad EDID; that would explain =
why
> his monitor's resolution was not correctly detected by Xorg (see comment
> #12).
>=20
> I applied the above patch to Linux 4.4.11 sources, recompiled my kernel, =
and
> rebooted. The problem is not completely fixed, but it is noticeably
> improved. Whereas before the whole screen would intermittently jump, now
> there are simply random flashes of horizontal lines on random places on t=
he
> screen. I generally run this box as a light-duty server, so I mainly ssh
> into it from my desktop, and I didn't boot into a GUI for testing. I just
> booted it and observed the text console.
>=20
> I wouldn't consider this patch a fix, but it is perhaps a mitigation. In =
any
> case, since I suspect that this may actually be the same as bug 61537, it
> would probably be wise to discuss with other devs, per Martin Peres'
> comment, before submitting any changes to the tree.

Thanks for testing. The other bug you reference is on very different hardwa=
re
(G80+) which has an *entirely* different display unit. The patch I wrote was
based on a few observations of the old xf86-video-nv code compared to nouve=
au.
There were other differences, but those seemed like the biggest ones.

Sounds like some of the other ones still matter though if you're still seei=
ng
flickering.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14649283874.d80888F.7996
Date: Fri, 3 Jun 2016 04:33:07 +0000
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
   title=3D"NEW - [NV1F] Flickering screen on Geforce 4"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D54587#c35">Commen=
t # 35</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV1F] Flickering screen on Geforce 4"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D54587">bug 54587<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Patrick McMunn from <a href=3D"show_bug.cgi?id=3D=
54587#c34">comment #34</a>)
<span class=3D"quote">&gt; I wonder if this bug may either be related to, o=
r may actually be the same
&gt; as, <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Screen flicker when using display with incorrect EDID"
   href=3D"show_bug.cgi?id=3D61537">bug 61537</a>. I also have this same is=
sue with a PC using an nVidia GeForce
&gt; 4 MX IGP, and I know that the monitor attached to it has a bad EDID. I
&gt; suspect Vesa may also have a monitor with a bad EDID; that would expla=
in why
&gt; his monitor's resolution was not correctly detected by Xorg (see comme=
nt
&gt; #12).
&gt;=20
&gt; I applied the above patch to Linux 4.4.11 sources, recompiled my kerne=
l, and
&gt; rebooted. The problem is not completely fixed, but it is noticeably
&gt; improved. Whereas before the whole screen would intermittently jump, n=
ow
&gt; there are simply random flashes of horizontal lines on random places o=
n the
&gt; screen. I generally run this box as a light-duty server, so I mainly s=
sh
&gt; into it from my desktop, and I didn't boot into a GUI for testing. I j=
ust
&gt; booted it and observed the text console.
&gt;=20
&gt; I wouldn't consider this patch a fix, but it is perhaps a mitigation. =
In any
&gt; case, since I suspect that this may actually be the same as <a class=
=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Screen flicker when using display with incorrect EDID"
   href=3D"show_bug.cgi?id=3D61537">bug 61537</a>, it
&gt; would probably be wise to discuss with other devs, per Martin Peres'
&gt; comment, before submitting any changes to the tree.</span >

Thanks for testing. The other bug you reference is on very different hardwa=
re
(G80+) which has an *entirely* different display unit. The patch I wrote was
based on a few observations of the old xf86-video-nv code compared to nouve=
au.
There were other differences, but those seemed like the biggest ones.

Sounds like some of the other ones still matter though if you're still seei=
ng
flickering.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14649283874.d80888F.7996--

--===============0857673528==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0857673528==--
