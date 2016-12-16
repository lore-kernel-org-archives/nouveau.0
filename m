From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99068] Screen hangs when running a 3D app. GTX 660
Date: Fri, 16 Dec 2016 00:10:50 +0000
Message-ID: <bug-99068-8800-oO9bCeI1UH@http.bugs.freedesktop.org/>
References: <bug-99068-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0048782802=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99068-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0048782802==
Content-Type: multipart/alternative; boundary="14818470490.CcaBe9CC.4341";
 charset="UTF-8"


--14818470490.CcaBe9CC.4341
Date: Fri, 16 Dec 2016 00:10:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99068

--- Comment #12 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Nicol=C3=A1s Luciano B=C3=A9rtolo from comment #11)
> Created attachment 128495 [details]
> mmiotrace

This trace is, effectively, empty. Among other things, it's not a good idea=
 to
have nvidia loaded at any time before grabbing the trace.

A successful trace should be 50-100MB uncompressed. (It compresses down qui=
te
nicely though.)

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14818470490.CcaBe9CC.4341
Date: Fri, 16 Dec 2016 00:10:49 +0000
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
   title=3D"NEW - Screen hangs when running a 3D app. GTX 660"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99068#c12">Commen=
t # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Screen hangs when running a 3D app. GTX 660"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99068">bug 99068<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Nicol=C3=A1s Luciano B=C3=A9rtolo from <a href=3D=
"show_bug.cgi?id=3D99068#c11">comment #11</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D128495" name=3D"attach_128495" title=3D"mmiotrace">attachment 12849=
5</a> <a href=3D"attachment.cgi?id=3D128495&amp;action=3Dedit" title=3D"mmi=
otrace">[details]</a></span>
&gt; mmiotrace</span >

This trace is, effectively, empty. Among other things, it's not a good idea=
 to
have nvidia loaded at any time before grabbing the trace.

A successful trace should be 50-100MB uncompressed. (It compresses down qui=
te
nicely though.)</pre>
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

--14818470490.CcaBe9CC.4341--

--===============0048782802==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0048782802==--
