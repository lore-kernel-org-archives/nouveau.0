From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 95095] NV46 (G72) Full screen artifacts in Freespace
 2 SW OT mod
Date: Sun, 29 May 2016 15:54:19 +0000
Message-ID: <bug-95095-8800-Y1rEFSh5OB@http.bugs.freedesktop.org/>
References: <bug-95095-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0894213752=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-95095-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0894213752==
Content-Type: multipart/alternative; boundary="14645372590.0EC9.15289";
 charset="UTF-8"


--14645372590.0EC9.15289
Date: Sun, 29 May 2016 15:54:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D95095

--- Comment #8 from Mauro Rossi <issor.oruam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi Ilia,

I've seen there's an Issue on fs2open github about the need to set #version=
 120
header,

now I've done that and rebuilt fs2_open and collected a new trace.

All the errors in qapitrace disappeared, however the X-Wing and other affte=
cted
models are still causing the shaders  artifacts, so there is something else
inducing the artifacts.

Here is the apitrace file:
https://drive.google.com/open?id=3D0B_OFHiIqgpSFUUtnTXdWSEhoRnc

Is there a way I can get further logs to help?
Mauro

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14645372590.0EC9.15289
Date: Sun, 29 May 2016 15:54:19 +0000
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
   title=3D"NEW - NV46 (G72) Full screen artifacts in Freespace 2 SW OT mod"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D95095#c8">Comment=
 # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - NV46 (G72) Full screen artifacts in Freespace 2 SW OT mod"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D95095">bug 95095<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
issor.oruam&#64;gmail.com" title=3D"Mauro Rossi &lt;issor.oruam&#64;gmail.c=
om&gt;"> <span class=3D"fn">Mauro Rossi</span></a>
</span></b>
        <pre>Hi Ilia,

I've seen there's an Issue on fs2open github about the need to set #version=
 120
header,

now I've done that and rebuilt fs2_open and collected a new trace.

All the errors in qapitrace disappeared, however the X-Wing and other affte=
cted
models are still causing the shaders  artifacts, so there is something else
inducing the artifacts.

Here is the apitrace file:
<a href=3D"https://drive.google.com/open?id=3D0B_OFHiIqgpSFUUtnTXdWSEhoRnc"=
>https://drive.google.com/open?id=3D0B_OFHiIqgpSFUUtnTXdWSEhoRnc</a>

Is there a way I can get further logs to help?
Mauro</pre>
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

--14645372590.0EC9.15289--

--===============0894213752==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0894213752==--
