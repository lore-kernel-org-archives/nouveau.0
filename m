From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101335] build failure: nouveau_screen.c:105:8:
 error:=?UTF-8?Q?=20implicit=20declaration=20of=20function=20=E2=80=98nouveau=5Fdrm=5Fnew=E2=80=99?=;
Date: Fri, 09 Jun 2017 17:55:52 +0000
Message-ID: <bug-101335-8800-2cPbeEamTt@http.bugs.freedesktop.org/>
References: <bug-101335-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1256892570=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-101335-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1256892570==
Content-Type: multipart/alternative; boundary="14970309520.5bFd10Ec.9409";
 charset="UTF-8"


--14970309520.5bFd10Ec.9409
Date: Fri, 9 Jun 2017 17:55:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101335

--- Comment #4 from David Ronis <David.Ronis-BAnzPxqWUM23NexWsGEg3A@public.gmane.org> ---
Thanks for the replies.  I am trying to build mesa (git/master) and have
rebuilt <span class=3D"hiddenSpellError" pre=3D"rebuilt ">drm (also the
git/master).
Here are the configure flags I use:

    drm  "--with-kernel-source=3D/<span class=3D"hiddenSpellError"
pre=3D"">usr/src/<span class=3D"hiddenSpellError" pre=3D"">linux --without-=
udev"

and

    mesa " --<span class=3D"hiddenSpellError" pre=3D"">enable-gbm --enable-=
opengl=20
--<span class=3D"hiddenSpellError" pre=3D"">enable-gles1 --enable-gles2
--with-gallium-drivers=3Dnouveau  --disable-glamor --<span
class=3D"hiddenSpellError" pre=3D"">disable-gallium-llvm"

An additional oddity.  I've tried building on two machines and i686 and an
x86_64.  The build fails on the <span class=3D"hiddenSpellError" pre=3D"the=
 ">i686
but succeeds on the x86_64.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14970309520.5bFd10Ec.9409
Date: Fri, 9 Jun 2017 17:55:52 +0000
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
   title=3D"NEW - build failure: nouveau_screen.c:105:8: error: implicit de=
claration of function =E2=80=98nouveau_drm_new=E2=80=99;"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101335#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - build failure: nouveau_screen.c:105:8: error: implicit de=
claration of function =E2=80=98nouveau_drm_new=E2=80=99;"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101335">bug 10133=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
David.Ronis&#64;McGill.CA" title=3D"David Ronis &lt;David.Ronis&#64;McGill.=
CA&gt;"> <span class=3D"fn">David Ronis</span></a>
</span></b>
        <pre>Thanks for the replies.  I am trying to build mesa (git/master=
) and have
rebuilt &lt;span class=3D&quot;hiddenSpellError&quot; pre=3D&quot;rebuilt &=
quot;&gt;drm (also the
git/master).
Here are the configure flags I use:

    drm  &quot;--with-kernel-source=3D/&lt;span class=3D&quot;hiddenSpellEr=
ror&quot;
pre=3D&quot;&quot;&gt;usr/src/&lt;span class=3D&quot;hiddenSpellError&quot;=
 pre=3D&quot;&quot;&gt;linux --without-udev&quot;

and

    mesa &quot; --&lt;span class=3D&quot;hiddenSpellError&quot; pre=3D&quot=
;&quot;&gt;enable-gbm --enable-opengl=20
--&lt;span class=3D&quot;hiddenSpellError&quot; pre=3D&quot;&quot;&gt;enabl=
e-gles1 --enable-gles2
--with-gallium-drivers=3Dnouveau  --disable-glamor --&lt;span
class=3D&quot;hiddenSpellError&quot; pre=3D&quot;&quot;&gt;disable-gallium-=
llvm&quot;

An additional oddity.  I've tried building on two machines and i686 and an
x86_64.  The build fails on the &lt;span class=3D&quot;hiddenSpellError&quo=
t; pre=3D&quot;the &quot;&gt;i686
but succeeds on the x86_64.</pre>
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

--14970309520.5bFd10Ec.9409--

--===============1256892570==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1256892570==--
