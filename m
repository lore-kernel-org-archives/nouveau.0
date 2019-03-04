From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99968] [NV4C] System crashes reliably with glxinfo
Date: Mon, 04 Mar 2019 04:03:00 +0000
Message-ID: <bug-99968-8800-amjUwiYTqA@http.bugs.freedesktop.org/>
References: <bug-99968-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1676377481=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99968-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1676377481==
Content-Type: multipart/alternative; boundary="15516721801.aF6eBdD.7459"
Content-Transfer-Encoding: 7bit


--15516721801.aF6eBdD.7459
Date: Mon, 4 Mar 2019 04:03:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99968

--- Comment #5 from Dave Odell <dmo2118-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Tried again on the same hardware with Linux 5.0-rc8, and it's not any bette=
r.
But now on top of that I've got intermittent system pauses, probably associ=
ated
with "rcu_sched detected stalls on CPUs/tasks" that I see in dmesg. That's
probably unrelated to the problem at hand.

Resizing the glxdemo window repeatedly does it for me, too.

nouveau.config=3DNvMSI=3D0 didn't help me, either.

A twist: I normally run this machine with modprobe.blacklist=3Dnouveau, but=
 it
still happened (while running Linux 4.15.0-20 from Ubuntu)...except this ti=
me
the system hadn't crashed, and CTRL-ALT-F1 (to get to tty1) followed by
CTRL-ALT-F7 (to get back to X11) restored video.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.
You are on the CC list for the bug.=

--15516721801.aF6eBdD.7459
Date: Mon, 4 Mar 2019 04:03:00 +0000
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
   title=3D"NEW - [NV4C] System crashes reliably with glxinfo"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99968#c5">Comment=
 # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV4C] System crashes reliably with glxinfo"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99968">bug 99968<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
dmo2118&#64;gmail.com" title=3D"Dave Odell &lt;dmo2118&#64;gmail.com&gt;"> =
<span class=3D"fn">Dave Odell</span></a>
</span></b>
        <pre>Tried again on the same hardware with Linux 5.0-rc8, and it's =
not any better.
But now on top of that I've got intermittent system pauses, probably associ=
ated
with &quot;rcu_sched detected stalls on CPUs/tasks&quot; that I see in dmes=
g. That's
probably unrelated to the problem at hand.

Resizing the glxdemo window repeatedly does it for me, too.

nouveau.config=3DNvMSI=3D0 didn't help me, either.

A twist: I normally run this machine with modprobe.blacklist=3Dnouveau, but=
 it
still happened (while running Linux 4.15.0-20 from Ubuntu)...except this ti=
me
the system hadn't crashed, and CTRL-ALT-F1 (to get to tty1) followed by
CTRL-ALT-F7 (to get back to X11) restored video.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
          <li>You are on the CC list for the bug.</li>
      </ul>
    </body>
</html>=

--15516721801.aF6eBdD.7459--

--===============1676377481==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1676377481==--
