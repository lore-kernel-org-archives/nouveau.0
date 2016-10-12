From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70972] [NV67] Modesetting failure at 1280x800
Date: Wed, 12 Oct 2016 21:21:42 +0000
Message-ID: <bug-70972-8800-LeIGObuTmq@http.bugs.freedesktop.org/>
References: <bug-70972-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1720954182=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70972-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1720954182==
Content-Type: multipart/alternative; boundary="14763073020.a31E6f9F4.12089";
 charset="UTF-8"


--14763073020.a31E6f9F4.12089
Date: Wed, 12 Oct 2016 21:21:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D70972

--- Comment #29 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Nerijus Bali=C5=ABnas from comment #28)
> Booted to console, ran
> echo 64000 > /sys/kernel/debug/tracing/buffer_size_kb
> echo mmiotrace > /sys/kernel/debug/tracing/current_tracer
> cat /sys/kernel/debug/tracing/trace_pipe > mmiotrace.log &
> modprobe nouveau
> init 5
> xrandr -s 1024x768 - screen became OK
> xrandr -s 1280x800 - screen became garbled

Does the console not become garbled when you just run 'modprobe nouevau' an=
d it
flips to 1280x800 mode? Or does it go into some other mode?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14763073020.a31E6f9F4.12089
Date: Wed, 12 Oct 2016 21:21:42 +0000
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
   title=3D"NEW - [NV67] Modesetting failure at 1280x800"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D70972#c29">Commen=
t # 29</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV67] Modesetting failure at 1280x800"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D70972">bug 70972<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Nerijus Bali=C5=ABnas from <a href=3D"show_bug.cg=
i?id=3D70972#c28">comment #28</a>)
<span class=3D"quote">&gt; Booted to console, ran
&gt; echo 64000 &gt; /sys/kernel/debug/tracing/buffer_size_kb
&gt; echo mmiotrace &gt; /sys/kernel/debug/tracing/current_tracer
&gt; cat /sys/kernel/debug/tracing/trace_pipe &gt; mmiotrace.log &amp;
&gt; modprobe nouveau
&gt; init 5
&gt; xrandr -s 1024x768 - screen became OK
&gt; xrandr -s 1280x800 - screen became garbled</span >

Does the console not become garbled when you just run 'modprobe nouevau' an=
d it
flips to 1280x800 mode? Or does it go into some other mode?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14763073020.a31E6f9F4.12089--

--===============1720954182==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1720954182==--
