From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89664] Nouveau fails to enter KMS with the Gigabyte
 G1 Gaming GTX970
Date: Fri, 28 Apr 2017 19:25:52 +0000
Message-ID: <bug-89664-8800-f5IE2GzoUe@http.bugs.freedesktop.org/>
References: <bug-89664-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0867597626=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89664-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0867597626==
Content-Type: multipart/alternative; boundary="14934075510.Cbd3b.8513";
 charset="UTF-8"


--14934075510.Cbd3b.8513
Date: Fri, 28 Apr 2017 19:25:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D89664

--- Comment #20 from Omar <omarpakker+freedesktop-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I suspect these are not the same problem tbh.
Anyway, I've tried to run nouveau once again. I've tried the default kernel,
the nouveau.config arguments on the default kernel, and using the linux-4.12
branch of github/skeggsb/linux.git.


Default kernel (Linux Omar-PC 4.10.13-1-ARCH #1 SMP PREEMPT Thu Apr 27 12:1=
5:09
CEST 2017 x86_64 GNU/Linux):
- Main GPU blinks with boot information on the first monitor. It then loses
signal and the second monitor turns on showing the top and bottom of the bo=
ot
information that was on screen, everything else is distorted and it shows t=
he
coloured stripes along the top (it does so in a higher resolution than the
monitor on the second GPU).
- Turning the first monitor off and back on makes the second monitor lose
signal and the contents displayed are now shown on the first monitor.
Turning the second off and on after that flips things around again. It seems
the last monitor to be turned on gets to display the (distorted) output.
- The monitor attached to the second GPU shows the coloured stripes. Turnin=
g it
off and back on again and it only shows black (it does have a signal).

Default kernel with module arguments gr+sec/secboot:
- Both monitors on the primary GPU lose signal. Turning them off and on cha=
nges
nothing.
- Monitor on the secondary GPU is black (does get a signal). Turning off and
back on again and it loses signal.

linux-4.12 branch of github/skeggsb/linux.git:
- Same as above with the module arguments, except the monitor on the second=
 GPU
does not lose signal after turning it off and on again.
I am assuming this is still the full kernel with the latest nouveau kernel
module as stated on the wiki? Otherwise I guess this test was pretty
meaningless.


If you want certain logs of any/all of the runs, please drop a message with
what you need and I'll do another run to get the requested information. I'm
also occasionally on the IRC so you can also reach me there :)
I did see some errors regarding "link training failed" (these have always b=
een
there for me every time iirc) and "DRM EVO timeout" (I believe these are ne=
w to
me. They do not ring a bell).
If I have some time this weekend I'll give things a shot when unplugging the
second GPU to see if this changes any behaviour with the 4.10 kernel or not.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14934075510.Cbd3b.8513
Date: Fri, 28 Apr 2017 19:25:51 +0000
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
   title=3D"NEW - Nouveau fails to enter KMS with the Gigabyte G1 Gaming GT=
X970"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D89664#c20">Commen=
t # 20</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau fails to enter KMS with the Gigabyte G1 Gaming GT=
X970"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D89664">bug 89664<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
omarpakker+freedesktop&#64;gmail.com" title=3D"Omar &lt;omarpakker+freedesk=
top&#64;gmail.com&gt;"> <span class=3D"fn">Omar</span></a>
</span></b>
        <pre>I suspect these are not the same problem tbh.
Anyway, I've tried to run nouveau once again. I've tried the default kernel,
the nouveau.config arguments on the default kernel, and using the linux-4.12
branch of github/skeggsb/linux.git.


Default kernel (Linux Omar-PC 4.10.13-1-ARCH #1 SMP PREEMPT Thu Apr 27 12:1=
5:09
CEST 2017 x86_64 GNU/Linux):
- Main GPU blinks with boot information on the first monitor. It then loses
signal and the second monitor turns on showing the top and bottom of the bo=
ot
information that was on screen, everything else is distorted and it shows t=
he
coloured stripes along the top (it does so in a higher resolution than the
monitor on the second GPU).
- Turning the first monitor off and back on makes the second monitor lose
signal and the contents displayed are now shown on the first monitor.
Turning the second off and on after that flips things around again. It seems
the last monitor to be turned on gets to display the (distorted) output.
- The monitor attached to the second GPU shows the coloured stripes. Turnin=
g it
off and back on again and it only shows black (it does have a signal).

Default kernel with module arguments gr+sec/secboot:
- Both monitors on the primary GPU lose signal. Turning them off and on cha=
nges
nothing.
- Monitor on the secondary GPU is black (does get a signal). Turning off and
back on again and it loses signal.

linux-4.12 branch of github/skeggsb/linux.git:
- Same as above with the module arguments, except the monitor on the second=
 GPU
does not lose signal after turning it off and on again.
I am assuming this is still the full kernel with the latest nouveau kernel
module as stated on the wiki? Otherwise I guess this test was pretty
meaningless.


If you want certain logs of any/all of the runs, please drop a message with
what you need and I'll do another run to get the requested information. I'm
also occasionally on the IRC so you can also reach me there :)
I did see some errors regarding &quot;link training failed&quot; (these hav=
e always been
there for me every time iirc) and &quot;DRM EVO timeout&quot; (I believe th=
ese are new to
me. They do not ring a bell).
If I have some time this weekend I'll give things a shot when unplugging the
second GPU to see if this changes any behaviour with the 4.10 kernel or not=
.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14934075510.Cbd3b.8513--

--===============0867597626==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0867597626==--
