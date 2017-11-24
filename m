From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101601] Nvidia GT 1030 (NV138/GP108) support
Date: Fri, 24 Nov 2017 11:59:51 +0000
Message-ID: <bug-101601-8800-qAMXefKIrY@http.bugs.freedesktop.org/>
References: <bug-101601-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1420739418=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-101601-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1420739418==
Content-Type: multipart/alternative; boundary="15115247912.1957cbf7A.16258";
 charset="UTF-8"


--15115247912.1957cbf7A.16258
Date: Fri, 24 Nov 2017 11:59:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101601

--- Comment #18 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
(In reply to Daniel Drake from comment #17)
> "disp/gf119-: avoid creating non-existent heads" is still not in linus tr=
ee,
> is there any news here?

It is definitely in Linus=E2=80=99 tree:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
h=3Dv4.14&id=3Deba5e56db65b7a44d57a98f5f382b2a2b9991321
and looking at the source from 4.14, the patch seems to be there as well:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/gpu/drm/nouveau/nv50_display.c?h=3Dv4.14#n4457

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15115247912.1957cbf7A.16258
Date: Fri, 24 Nov 2017 11:59:51 +0000
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
   title=3D"NEW - Nvidia GT 1030 (NV138/GP108) support"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101601#c18">Comme=
nt # 18</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nvidia GT 1030 (NV138/GP108) support"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101601">bug 10160=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pierre.morrow&#64;free.fr" title=3D"Pierre Moreau &lt;pierre.morrow&#64;fre=
e.fr&gt;"> <span class=3D"fn">Pierre Moreau</span></a>
</span></b>
        <pre>(In reply to Daniel Drake from <a href=3D"show_bug.cgi?id=3D10=
1601#c17">comment #17</a>)
<span class=3D"quote">&gt; &quot;disp/gf119-: avoid creating non-existent h=
eads&quot; is still not in linus tree,
&gt; is there any news here?</span >

It is definitely in Linus=E2=80=99 tree:
<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it/commit/?h=3Dv4.14&amp;id=3Deba5e56db65b7a44d57a98f5f382b2a2b9991321">htt=
ps://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=
=3Dv4.14&amp;id=3Deba5e56db65b7a44d57a98f5f382b2a2b9991321</a>
and looking at the source from 4.14, the patch seems to be there as well:
<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it/tree/drivers/gpu/drm/nouveau/nv50_display.c?h=3Dv4.14#n4457">https://git=
.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/dr=
m/nouveau/nv50_display.c?h=3Dv4.14#n4457</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15115247912.1957cbf7A.16258--

--===============1420739418==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1420739418==--
