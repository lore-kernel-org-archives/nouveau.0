From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 96876] system freeze "fifo: gr engine fault on
 channel 6" NVIDIA
Date: Sat, 23 Jul 2016 16:52:59 +0000
Message-ID: <bug-96876-8800-x32K2Z1LNM@http.bugs.freedesktop.org/>
References: <bug-96876-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1947222876=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-96876-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1947222876==
Content-Type: multipart/alternative; boundary="14692927780.9543.13699";
 charset="UTF-8"


--14692927780.9543.13699
Date: Sat, 23 Jul 2016 16:52:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D96876

--- Comment #4 from Ehsan Azar <dashesy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I finally have time today to try new kernel. But I just got this (no freeze,
just chrome got broken) and thought might be helpful.

[  685.293359] nouveau 0000:01:00.0: gr: TRAP ch 6 [007fb61000
systemd-logind[904]]
[  685.293368] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000200 [] x =3D =
896, y
=3D 128, format =3D 0, storage type =3D 0
[  685.293401] nouveau 0000:01:00.0: gr: TRAP ch 6 [007fb61000
systemd-logind[904]]
[  685.293408] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000200 [] x =3D =
896, y
=3D 136, format =3D 0, storage type =3D 0
[  685.293488] nouveau 0000:01:00.0: gr: TRAP ch 6 [007fb61000
systemd-logind[904]]
[  685.293494] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000200 [] x =3D =
896, y
=3D 144, format =3D 0, storage type =3D 0
[  685.293501] nouveau 0000:01:00.0: gr: TRAP ch 6 [007fb61000
systemd-logind[904]]
[  685.293506] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000200 [] x =3D =
896, y
=3D 152, format =3D 0, storage type =3D 0
[  685.293521] nouveau 0000:01:00.0: gr: TRAP ch 6 [007fb61000
systemd-logind[904]]
[  685.293526] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000200 [] x =3D =
896, y
=3D 160, format =3D 0, storage type =3D 0
[  685.293540] nouveau 0000:01:00.0: gr: TRAP ch 6 [007fb61000
systemd-logind[904]]
[  685.293545] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000200 [] x =3D =
896, y
=3D 168, format =3D 0, storage type =3D 0
[  685.293557] nouveau 0000:01:00.0: gr: TRAP ch 6 [007fb61000
systemd-logind[904]]
[  685.293563] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000200 [] x =3D =
896, y
=3D 176, format =3D 0, storage type =3D 0
[  685.293575] nouveau 0000:01:00.0: gr: TRAP ch 6 [007fb61000
systemd-logind[904]]
[  685.293581] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000200 [] x =3D =
896, y
=3D 184, format =3D 0, storage type =3D 0
[  685.293594] nouveau 0000:01:00.0: gr: TRAP ch 6 [007fb61000
systemd-logind[904]]
[  685.293620] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000200 [] x =3D =
896, y
=3D 192, format =3D 0, storage type =3D 0
[  685.293638] nouveau 0000:01:00.0: gr: TRAP ch 6 [007fb61000
systemd-logind[904]]
[  685.293645] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000200 [] x =3D =
896, y
=3D 208, format =3D 0, storage type =3D 0
[  685.293660] nouveau 0000:01:00.0: gr: TRAP ch 6 [007fb61000
systemd-logind[904]]
[  685.293666] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000200 [] x =3D =
896, y
=3D 216, format =3D 0, storage type =3D 0
[  685.293701] nouveau 0000:01:00.0: gr: TRAP ch 6 [007fb61000
systemd-logind[904]]
[  685.293707] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000200 [] x =3D =
896, y
=3D 224, format =3D 0, storage type =3D 0
[  685.293720] nouveau 0000:01:00.0: gr: TRAP ch 6 [007fb61000
systemd-logind[904]]
[  685.293726] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000200 [] x =3D =
896, y
=3D 232, format =3D 0, storage type =3D 0
[  685.293735] nouveau 0000:01:00.0: gr: TRAP ch 6 [007fb61000
systemd-logind[904]]
[  685.293741] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000200 [] x =3D =
896, y
=3D 240, format =3D 0, storage type =3D 0
[  685.293753] nouveau 0000:01:00.0: gr: TRAP ch 6 [007fb61000
systemd-logind[904]]
[  685.293758] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000200 [] x =3D =
896, y
=3D 248, format =3D 0, storage type =3D 0
[127998.748786] perf interrupt took too long (2501 > 2500), lowering
kernel.perf_event_max_sample_rate to 50000

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14692927780.9543.13699
Date: Sat, 23 Jul 2016 16:52:58 +0000
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
   title=3D"NEW - system freeze &quot;fifo: gr engine fault on channel 6&qu=
ot; NVIDIA"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96876#c4">Comment=
 # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - system freeze &quot;fifo: gr engine fault on channel 6&qu=
ot; NVIDIA"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96876">bug 96876<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
dashesy&#64;gmail.com" title=3D"Ehsan Azar &lt;dashesy&#64;gmail.com&gt;"> =
<span class=3D"fn">Ehsan Azar</span></a>
</span></b>
        <pre>I finally have time today to try new kernel. But I just got th=
is (no freeze,
just chrome got broken) and thought might be helpful.

[  685.293359] nouveau 0000:01:00.0: gr: TRAP ch 6 [007fb61000
systemd-logind[904]]
[  685.293368] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000200 [] x =3D =
896, y
=3D 128, format =3D 0, storage type =3D 0
[  685.293401] nouveau 0000:01:00.0: gr: TRAP ch 6 [007fb61000
systemd-logind[904]]
[  685.293408] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000200 [] x =3D =
896, y
=3D 136, format =3D 0, storage type =3D 0
[  685.293488] nouveau 0000:01:00.0: gr: TRAP ch 6 [007fb61000
systemd-logind[904]]
[  685.293494] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000200 [] x =3D =
896, y
=3D 144, format =3D 0, storage type =3D 0
[  685.293501] nouveau 0000:01:00.0: gr: TRAP ch 6 [007fb61000
systemd-logind[904]]
[  685.293506] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000200 [] x =3D =
896, y
=3D 152, format =3D 0, storage type =3D 0
[  685.293521] nouveau 0000:01:00.0: gr: TRAP ch 6 [007fb61000
systemd-logind[904]]
[  685.293526] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000200 [] x =3D =
896, y
=3D 160, format =3D 0, storage type =3D 0
[  685.293540] nouveau 0000:01:00.0: gr: TRAP ch 6 [007fb61000
systemd-logind[904]]
[  685.293545] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000200 [] x =3D =
896, y
=3D 168, format =3D 0, storage type =3D 0
[  685.293557] nouveau 0000:01:00.0: gr: TRAP ch 6 [007fb61000
systemd-logind[904]]
[  685.293563] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000200 [] x =3D =
896, y
=3D 176, format =3D 0, storage type =3D 0
[  685.293575] nouveau 0000:01:00.0: gr: TRAP ch 6 [007fb61000
systemd-logind[904]]
[  685.293581] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000200 [] x =3D =
896, y
=3D 184, format =3D 0, storage type =3D 0
[  685.293594] nouveau 0000:01:00.0: gr: TRAP ch 6 [007fb61000
systemd-logind[904]]
[  685.293620] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000200 [] x =3D =
896, y
=3D 192, format =3D 0, storage type =3D 0
[  685.293638] nouveau 0000:01:00.0: gr: TRAP ch 6 [007fb61000
systemd-logind[904]]
[  685.293645] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000200 [] x =3D =
896, y
=3D 208, format =3D 0, storage type =3D 0
[  685.293660] nouveau 0000:01:00.0: gr: TRAP ch 6 [007fb61000
systemd-logind[904]]
[  685.293666] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000200 [] x =3D =
896, y
=3D 216, format =3D 0, storage type =3D 0
[  685.293701] nouveau 0000:01:00.0: gr: TRAP ch 6 [007fb61000
systemd-logind[904]]
[  685.293707] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000200 [] x =3D =
896, y
=3D 224, format =3D 0, storage type =3D 0
[  685.293720] nouveau 0000:01:00.0: gr: TRAP ch 6 [007fb61000
systemd-logind[904]]
[  685.293726] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000200 [] x =3D =
896, y
=3D 232, format =3D 0, storage type =3D 0
[  685.293735] nouveau 0000:01:00.0: gr: TRAP ch 6 [007fb61000
systemd-logind[904]]
[  685.293741] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000200 [] x =3D =
896, y
=3D 240, format =3D 0, storage type =3D 0
[  685.293753] nouveau 0000:01:00.0: gr: TRAP ch 6 [007fb61000
systemd-logind[904]]
[  685.293758] nouveau 0000:01:00.0: gr: GPC0/PROP trap: 00000200 [] x =3D =
896, y
=3D 248, format =3D 0, storage type =3D 0
[127998.748786] perf interrupt took too long (2501 &gt; 2500), lowering
kernel.perf_event_max_sample_rate to 50000</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14692927780.9543.13699--

--===============1947222876==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1947222876==--
