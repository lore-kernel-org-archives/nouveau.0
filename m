From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99068] Screen hangs when running a 3D app. GTX 660
Date: Wed, 14 Dec 2016 22:16:27 +0000
Message-ID: <bug-99068-8800-0qgcVrPvBj@http.bugs.freedesktop.org/>
References: <bug-99068-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1315286328=="
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


--===============1315286328==
Content-Type: multipart/alternative; boundary="14817537870.8eaE.1990";
 charset="UTF-8"


--14817537870.8eaE.1990
Date: Wed, 14 Dec 2016 22:16:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99068

--- Comment #7 from Nicol=C3=A1s Luciano B=C3=A9rtolo <nicolasbertolo@gmail=
.com> ---
What happens is that the file is actually there, but it is 0 bytes long.

This is the script that I am using to extract the files:

#! /bin/bash

rmmod nvidia_drm
rmmod nvidia_modeset
rmmod nvidia

echo 64000 > /sys/kernel/debug/tracing/buffer_size_kb
echo mmiotrace > /sys/kernel/debug/tracing/current_tracer
cat /sys/kernel/debug/tracing/trace_pipe > mmiotrace.log &

modprobe nvidia

xinit -e sh -c "glxgears & sleep 10"

sleep 5
echo nop > /sys/kernel/debug/tracing/current_tracer
wait

This line fails:
echo nop > /sys/kernel/debug/tracing/current_tracer
It outputs: Resource or device busy.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14817537870.8eaE.1990
Date: Wed, 14 Dec 2016 22:16:27 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99068#c7">Comment=
 # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Screen hangs when running a 3D app. GTX 660"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99068">bug 99068<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
nicolasbertolo&#64;gmail.com" title=3D"Nicol=C3=A1s Luciano B=C3=A9rtolo &l=
t;nicolasbertolo&#64;gmail.com&gt;"> <span class=3D"fn">Nicol=C3=A1s Lucian=
o B=C3=A9rtolo</span></a>
</span></b>
        <pre>What happens is that the file is actually there, but it is 0 b=
ytes long.

This is the script that I am using to extract the files:

#! /bin/bash

rmmod nvidia_drm
rmmod nvidia_modeset
rmmod nvidia

echo 64000 &gt; /sys/kernel/debug/tracing/buffer_size_kb
echo mmiotrace &gt; /sys/kernel/debug/tracing/current_tracer
cat /sys/kernel/debug/tracing/trace_pipe &gt; mmiotrace.log &amp;

modprobe nvidia

xinit -e sh -c &quot;glxgears &amp; sleep 10&quot;

sleep 5
echo nop &gt; /sys/kernel/debug/tracing/current_tracer
wait

This line fails:
echo nop &gt; /sys/kernel/debug/tracing/current_tracer
It outputs: Resource or device busy.</pre>
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

--14817537870.8eaE.1990--

--===============1315286328==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1315286328==--
