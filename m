From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 96391] Payday: The Heist has rendering issues when
 anti-aliasing enabled
Date: Sun, 05 Jun 2016 17:07:17 +0000
Message-ID: <bug-96391-8800-ttemtmAK4t@http.bugs.freedesktop.org/>
References: <bug-96391-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0714139855=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-96391-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0714139855==
Content-Type: multipart/alternative; boundary="14651464370.c32aE.6523";
 charset="UTF-8"


--14651464370.c32aE.6523
Date: Sun, 5 Jun 2016 17:07:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D96391

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Reproduces on GT215 but not GK208. Kinda looks like one of those control fl=
ow
fail situations, or potentially one of the "loop stopped running" situations
that I never figured out. NV50_PROG_OPTIMIZE=3D0 had no effect, which it us=
ually
would in those situations (not to fix it, but just to alter how things look=
).
Interesting.

I *am* aware of an issue in using glReadPixels()/glDrawPixels() with a MSAA
winsys framebuffer, but ... let's hope they don't do that. And those issues
would be the same on the GK208.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14651464370.c32aE.6523
Date: Sun, 5 Jun 2016 17:07:17 +0000
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
   title=3D"NEW - Payday: The Heist has rendering issues when anti-aliasing=
 enabled"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96391#c1">Comment=
 # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Payday: The Heist has rendering issues when anti-aliasing=
 enabled"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96391">bug 96391<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Reproduces on GT215 but not GK208. Kinda looks like one of tho=
se control flow
fail situations, or potentially one of the &quot;loop stopped running&quot;=
 situations
that I never figured out. NV50_PROG_OPTIMIZE=3D0 had no effect, which it us=
ually
would in those situations (not to fix it, but just to alter how things look=
).
Interesting.

I *am* aware of an issue in using glReadPixels()/glDrawPixels() with a MSAA
winsys framebuffer, but ... let's hope they don't do that. And those issues
would be the same on the GK208.</pre>
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

--14651464370.c32aE.6523--

--===============0714139855==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0714139855==--
