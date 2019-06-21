From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 110955] Mesa 18.2.8 implementation error: Invalid
 GLSL version in shading_language_version()
Date: Fri, 21 Jun 2019 17:41:23 +0000
Message-ID: <bug-110955-8800-PQOE0lzs0d@http.bugs.freedesktop.org/>
References: <bug-110955-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0455650674=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-110955-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0455650674==
Content-Type: multipart/alternative; boundary="15611388831.1A1CDdeA4.11454"
Content-Transfer-Encoding: 7bit


--15611388831.1A1CDdeA4.11454
Date: Fri, 21 Jun 2019 17:41:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110955

--- Comment #1 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
AFAICT there's a couple of things here:
 - the crash
Most likely a wine bug, since the GL spec clearly says that glGetString (the
only API which can give this message) can return 0/NULL on error.

 - nouveau/mesa complains about unknown GLSL version

That should not happen. What hardware are you running on, do you have any
changes to your drirc?

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15611388831.1A1CDdeA4.11454
Date: Fri, 21 Jun 2019 17:41:23 +0000
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
   title=3D"NEW - Mesa 18.2.8 implementation error: Invalid GLSL version in=
 shading_language_version()"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110955#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Mesa 18.2.8 implementation error: Invalid GLSL version in=
 shading_language_version()"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110955">bug 11095=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
emil.l.velikov&#64;gmail.com" title=3D"Emil Velikov &lt;emil.l.velikov&#64;=
gmail.com&gt;"> <span class=3D"fn">Emil Velikov</span></a>
</span></b>
        <pre>AFAICT there's a couple of things here:
 - the crash
Most likely a wine bug, since the GL spec clearly says that glGetString (the
only API which can give this message) can return 0/NULL on error.

 - nouveau/mesa complains about unknown GLSL version

That should not happen. What hardware are you running on, do you have any
changes to your drirc?</pre>
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

--15611388831.1A1CDdeA4.11454--

--===============0455650674==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0455650674==--
