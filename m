From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91632] Assert in nouveau_pushbuf_data
Date: Tue, 02 Aug 2016 23:09:54 +0000
Message-ID: <bug-91632-8800-OHXsBop22p@http.bugs.freedesktop.org/>
References: <bug-91632-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0236992360=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91632-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0236992360==
Content-Type: multipart/alternative; boundary="14701793943.a868a9cb1.23788";
 charset="UTF-8"


--14701793943.a868a9cb1.23788
Date: Tue, 2 Aug 2016 23:09:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D91632

--- Comment #8 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Unfortunately "this" issue is a lot of potential issues. The current leading
cause of such errors, assuming an up-to-date libdrm/etc, is multithreading =
in
the application. Nouveau does not handle this well.

I have a branch which tries to address this:

https://github.com/imirkin/mesa/commits/locking

However it's not quite there yet (although it's a good part of the way ther=
e),
and needs a rethink on some of the core mechanisms used. Unfortunately the
libdrm_nouveau api is really not well-suited to multithreading, kicks can e=
nd
up resulting implicitly from all kinds of seemingly innocuous actions.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14701793943.a868a9cb1.23788
Date: Tue, 2 Aug 2016 23:09:54 +0000
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
   title=3D"NEW - Assert in nouveau_pushbuf_data"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91632#c8">Comment=
 # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Assert in nouveau_pushbuf_data"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91632">bug 91632<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Unfortunately &quot;this&quot; issue is a lot of potential iss=
ues. The current leading
cause of such errors, assuming an up-to-date libdrm/etc, is multithreading =
in
the application. Nouveau does not handle this well.

I have a branch which tries to address this:

<a href=3D"https://github.com/imirkin/mesa/commits/locking">https://github.=
com/imirkin/mesa/commits/locking</a>

However it's not quite there yet (although it's a good part of the way ther=
e),
and needs a rethink on some of the core mechanisms used. Unfortunately the
libdrm_nouveau api is really not well-suited to multithreading, kicks can e=
nd
up resulting implicitly from all kinds of seemingly innocuous actions.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--14701793943.a868a9cb1.23788--

--===============0236992360==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0236992360==--
