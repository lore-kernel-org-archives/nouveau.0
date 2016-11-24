From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94990] [GM204] GTX 970 + 4GB VRAM fails at secboot
	(v4.6+)
Date: Thu, 24 Nov 2016 21:40:58 +0000
Message-ID: <bug-94990-8800-xhPNzokr4Q@http.bugs.freedesktop.org/>
References: <bug-94990-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1422794033=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94990-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1422794033==
Content-Type: multipart/alternative; boundary="148002365810.DfE2A8.14491";
 charset="UTF-8"


--148002365810.DfE2A8.14491
Date: Thu, 24 Nov 2016 21:40:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D94990

--- Comment #98 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Efrem McCrimon from comment #97)
> Created attachment 128179 [details]
> attachment-14321-0.html
>=20
> Hi all:
>=20
> Please help me understand the ram issue on the video card, is too many
> buffers created?  I did not have this problem on a 4.6 kernel, now the
> kernel has been upgraded twice, 4.8.5, and now 4.8.6.  No problems using a
> 960 GTX w/4GB DDR5 memory, plus I have a secondary 730 GTw/1GB RAM.

The issue is that the 4GB are laid out "funny" on a GTX 970 (but not other
models), and nouveau doesn't properly handle that.

You had this problem on a 4.6 kernel, as it was the first to provide the
secboot firmware loading functionality (assuming you had the firmware in
place). To get back to the previous behavior, remove the firmware, or boot =
with
nouveau.noaccel=3D1 nouveau.nofbaccel=3D1 which should avoid initializing t=
he
graphics accel engine. (And hopefully avoid secboot as well, but I'm not 10=
0%
sure.)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--148002365810.DfE2A8.14491
Date: Thu, 24 Nov 2016 21:40:58 +0000
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
   title=3D"NEW - [GM204] GTX 970 + 4GB VRAM fails at secboot (v4.6+)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94990#c98">Commen=
t # 98</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GM204] GTX 970 + 4GB VRAM fails at secboot (v4.6+)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94990">bug 94990<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Efrem McCrimon from <a href=3D"show_bug.cgi?id=3D=
94990#c97">comment #97</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D128179" name=3D"attach_128179" title=3D"attachment-14321-0.html">at=
tachment 128179</a> <a href=3D"attachment.cgi?id=3D128179&amp;action=3Dedit=
" title=3D"attachment-14321-0.html">[details]</a></span>
&gt; attachment-14321-0.html
&gt;=20
&gt; Hi all:
&gt;=20
&gt; Please help me understand the ram issue on the video card, is too many
&gt; buffers created?  I did not have this problem on a 4.6 kernel, now the
&gt; kernel has been upgraded twice, 4.8.5, and now 4.8.6.  No problems usi=
ng a
&gt; 960 GTX w/4GB DDR5 memory, plus I have a secondary 730 GTw/1GB RAM.</s=
pan >

The issue is that the 4GB are laid out &quot;funny&quot; on a GTX 970 (but =
not other
models), and nouveau doesn't properly handle that.

You had this problem on a 4.6 kernel, as it was the first to provide the
secboot firmware loading functionality (assuming you had the firmware in
place). To get back to the previous behavior, remove the firmware, or boot =
with
nouveau.noaccel=3D1 nouveau.nofbaccel=3D1 which should avoid initializing t=
he
graphics accel engine. (And hopefully avoid secboot as well, but I'm not 10=
0%
sure.)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--148002365810.DfE2A8.14491--

--===============1422794033==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1422794033==--
