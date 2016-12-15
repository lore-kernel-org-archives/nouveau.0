From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99068] Screen hangs when running a 3D app. GTX 660
Date: Thu, 15 Dec 2016 22:57:29 +0000
Message-ID: <bug-99068-8800-ry2EdAj3d9@http.bugs.freedesktop.org/>
References: <bug-99068-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0333624969=="
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


--===============0333624969==
Content-Type: multipart/alternative; boundary="14818426481.95d0374fA.766";
 charset="UTF-8"


--14818426481.95d0374fA.766
Date: Thu, 15 Dec 2016 22:57:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99068

--- Comment #10 from Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Nicol=C3=A1s Luciano B=C3=A9rtolo from comment #7)
> What happens is that the file is actually there, but it is 0 bytes long.
>=20
> This is the script that I am using to extract the files:
>=20
> #! /bin/bash
>=20
> rmmod nvidia_drm
> rmmod nvidia_modeset
> rmmod nvidia
>=20
> echo 64000 > /sys/kernel/debug/tracing/buffer_size_kb
> echo mmiotrace > /sys/kernel/debug/tracing/current_tracer
> cat /sys/kernel/debug/tracing/trace_pipe > mmiotrace.log &
>=20
> modprobe nvidia
>=20
> xinit -e sh -c "glxgears & sleep 10"
>=20
> sleep 5
> echo nop > /sys/kernel/debug/tracing/current_tracer
> wait
>=20
> This line fails:
> echo nop > /sys/kernel/debug/tracing/current_tracer
> It outputs: Resource or device busy.

That's normal, you need to kill the 'cat' process first.

Can you share your resulting trace please, I'll try and see what's differen=
t vs
my (working) board.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14818426481.95d0374fA.766
Date: Thu, 15 Dec 2016 22:57:28 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99068#c10">Commen=
t # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Screen hangs when running a 3D app. GTX 660"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99068">bug 99068<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
skeggsb&#64;gmail.com" title=3D"Ben Skeggs &lt;skeggsb&#64;gmail.com&gt;"> =
<span class=3D"fn">Ben Skeggs</span></a>
</span></b>
        <pre>(In reply to Nicol=C3=A1s Luciano B=C3=A9rtolo from <a href=3D=
"show_bug.cgi?id=3D99068#c7">comment #7</a>)
<span class=3D"quote">&gt; What happens is that the file is actually there,=
 but it is 0 bytes long.
&gt;=20
&gt; This is the script that I am using to extract the files:
&gt;=20
&gt; #! /bin/bash
&gt;=20
&gt; rmmod nvidia_drm
&gt; rmmod nvidia_modeset
&gt; rmmod nvidia
&gt;=20
&gt; echo 64000 &gt; /sys/kernel/debug/tracing/buffer_size_kb
&gt; echo mmiotrace &gt; /sys/kernel/debug/tracing/current_tracer
&gt; cat /sys/kernel/debug/tracing/trace_pipe &gt; mmiotrace.log &amp;
&gt;=20
&gt; modprobe nvidia
&gt;=20
&gt; xinit -e sh -c &quot;glxgears &amp; sleep 10&quot;
&gt;=20
&gt; sleep 5
&gt; echo nop &gt; /sys/kernel/debug/tracing/current_tracer
&gt; wait
&gt;=20
&gt; This line fails:
&gt; echo nop &gt; /sys/kernel/debug/tracing/current_tracer
&gt; It outputs: Resource or device busy.</span >

That's normal, you need to kill the 'cat' process first.

Can you share your resulting trace please, I'll try and see what's differen=
t vs
my (working) board.</pre>
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

--14818426481.95d0374fA.766--

--===============0333624969==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0333624969==--
