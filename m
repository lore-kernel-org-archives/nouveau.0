From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105319] DRM: EVO timeout with kernel 4.15.x
Date: Fri, 20 Jul 2018 17:50:37 +0000
Message-ID: <bug-105319-8800-ftA6cuG6oX@http.bugs.freedesktop.org/>
References: <bug-105319-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1239785899=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-105319-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1239785899==
Content-Type: multipart/alternative; boundary="15321090361.3f2eA0d.2906"
Content-Transfer-Encoding: 7bit


--15321090361.3f2eA0d.2906
Date: Fri, 20 Jul 2018 17:50:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105319

--- Comment #21 from S=C3=A9rgio M. Basto <sergio-iCFKjj3otdHQT0dZR+AlfA@public.gmane.org> ---
(In reply to Karol Herbst from comment #20)
> (In reply to S=C3=A9rgio M. Basto from comment #15)
> > (In reply to S=C3=A9rgio M. Basto from comment #14)
> > > (*) I'm convinced my issue started before kernel-4.15-rc1
> >=20
> > I try bitsect kernel the patch-4.14-git2.xz is the first bad commit, I =
tried
> > the same commit [1] but with git1 and boots fine , so I assume is
> > exclusively a kernel code issue.=20
> >=20
> > I don't how numeration works so here is the resume,  kernel 4.15.0-git1
> > boots and kernel 4.15.0-git2 don't boot=20
> >=20
> > xzdiff -up patch-4.14-git1.xz patch-4.14-git2.xz , have 100 thousand li=
nes ,
> > where I find a git tree with these commits ?=20
> >=20
> >=20
> > [1]
> > https://src.fedoraproject.org/rpms/kernel/c/
> > 2ef4e8028f509354fb5a339bd2f8d0d1df8f2e8d?branch=3Dmaster
>=20
> that diff doesn't really help and because this is an upstream bug tracker
> you should rather git bisect the kernel itself, not some packages you
> installed on your system.
>=20
> If you can pinpoint to a specific git commit inside the kernel, that might
> be very helpful.


where I find a git tree with these commits (patch-4.14-git1.xz to
patch-4.14-git2.xz) ?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15321090361.3f2eA0d.2906
Date: Fri, 20 Jul 2018 17:50:36 +0000
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
   title=3D"NEW - DRM: EVO timeout with kernel 4.15.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105319#c21">Comme=
nt # 21</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - DRM: EVO timeout with kernel 4.15.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105319">bug 10531=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
sergio&#64;serjux.com" title=3D"S=C3=A9rgio M. Basto &lt;sergio&#64;serjux.=
com&gt;"> <span class=3D"fn">S=C3=A9rgio M. Basto</span></a>
</span></b>
        <pre>(In reply to Karol Herbst from <a href=3D"show_bug.cgi?id=3D10=
5319#c20">comment #20</a>)
<span class=3D"quote">&gt; (In reply to S=C3=A9rgio M. Basto from <a href=
=3D"show_bug.cgi?id=3D105319#c15">comment #15</a>)
&gt; &gt; (In reply to S=C3=A9rgio M. Basto from <a href=3D"show_bug.cgi?id=
=3D105319#c14">comment #14</a>)
&gt; &gt; &gt; (*) I'm convinced my issue started before kernel-4.15-rc1
&gt; &gt;=20
&gt; &gt; I try bitsect kernel the patch-4.14-git2.xz is the first bad comm=
it, I tried
&gt; &gt; the same commit [1] but with git1 and boots fine , so I assume is
&gt; &gt; exclusively a kernel code issue.=20
&gt; &gt;=20
&gt; &gt; I don't how numeration works so here is the resume,  kernel 4.15.=
0-git1
&gt; &gt; boots and kernel 4.15.0-git2 don't boot=20
&gt; &gt;=20
&gt; &gt; xzdiff -up patch-4.14-git1.xz patch-4.14-git2.xz , have 100 thous=
and lines ,
&gt; &gt; where I find a git tree with these commits ?=20
&gt; &gt;=20
&gt; &gt;=20
&gt; &gt; [1]
&gt; &gt; <a href=3D"https://src.fedoraproject.org/rpms/kernel/c/">https://=
src.fedoraproject.org/rpms/kernel/c/</a>
&gt; &gt; 2ef4e8028f509354fb5a339bd2f8d0d1df8f2e8d?branch=3Dmaster
&gt;=20
&gt; that diff doesn't really help and because this is an upstream bug trac=
ker
&gt; you should rather git bisect the kernel itself, not some packages you
&gt; installed on your system.
&gt;=20
&gt; If you can pinpoint to a specific git commit inside the kernel, that m=
ight
&gt; be very helpful.</span >


where I find a git tree with these commits (patch-4.14-git1.xz to
patch-4.14-git2.xz) ?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15321090361.3f2eA0d.2906--

--===============1239785899==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1239785899==--
