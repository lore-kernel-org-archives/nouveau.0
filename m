From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97620] [REGRESSION] KMS having issues after kernel
 upgrade (4.5.1-1 to 4.6.4-1)
Date: Mon, 19 Sep 2016 03:47:31 +0000
Message-ID: <bug-97620-8800-3IKpIAGwCh@http.bugs.freedesktop.org/>
References: <bug-97620-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1094991299=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-97620-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1094991299==
Content-Type: multipart/alternative; boundary="14742568511.bA6dE.15104";
 charset="UTF-8"


--14742568511.bA6dE.15104
Date: Mon, 19 Sep 2016 03:47:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97620

--- Comment #20 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Luke Tidd from comment #18)
> https://bugs.freedesktop.org/attachment.cgi?id=3D126609
> I don't see "bios: running init tables" but here is the entire dmesg.

Indeed. So the "working" state is to not run the VBIOS. Something in there =
is
upsetting matters (normally running the VBIOS a second time doesn't hurt
anything, it's just pointless work and can cause a flicker). Assuming that
disabling vesafb doesn't help (the way those legacy interfaces are implemen=
ted
can be pretty brittle), please include

(a) /sys/kernel/debug/dri/0/vbios.rom (from any boot)
(b) nouveau.debug=3Ddebug,bios=3Dtrace output from a *broken* kernel boot

Ideally that should provide some further things to look at.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14742568511.bA6dE.15104
Date: Mon, 19 Sep 2016 03:47:31 +0000
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
   title=3D"NEW - [REGRESSION] KMS having issues after kernel upgrade (4.5.=
1-1 to 4.6.4-1)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97620#c20">Commen=
t # 20</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [REGRESSION] KMS having issues after kernel upgrade (4.5.=
1-1 to 4.6.4-1)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97620">bug 97620<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Luke Tidd from <a href=3D"show_bug.cgi?id=3D97620=
#c18">comment #18</a>)
<span class=3D"quote">&gt; <a href=3D"https://bugs.freedesktop.org/attachme=
nt.cgi?id=3D126609">https://bugs.freedesktop.org/attachment.cgi?id=3D126609=
</a>
&gt; I don't see &quot;bios: running init tables&quot; but here is the enti=
re dmesg.</span >

Indeed. So the &quot;working&quot; state is to not run the VBIOS. Something=
 in there is
upsetting matters (normally running the VBIOS a second time doesn't hurt
anything, it's just pointless work and can cause a flicker). Assuming that
disabling vesafb doesn't help (the way those legacy interfaces are implemen=
ted
can be pretty brittle), please include

(a) /sys/kernel/debug/dri/0/vbios.rom (from any boot)
(b) nouveau.debug=3Ddebug,bios=3Dtrace output from a *broken* kernel boot

Ideally that should provide some further things to look at.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14742568511.bA6dE.15104--

--===============1094991299==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1094991299==--
