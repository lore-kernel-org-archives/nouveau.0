From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 96876] system freeze "fifo: gr engine fault on
 channel 6" NVIDIA
Date: Sun, 24 Jul 2016 15:28:35 +0000
Message-ID: <bug-96876-8800-gXO1J6TdnZ@http.bugs.freedesktop.org/>
References: <bug-96876-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1598438202=="
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


--===============1598438202==
Content-Type: multipart/alternative; boundary="14693741150.EbAEbA8cD.16033";
 charset="UTF-8"


--14693741150.EbAEbA8cD.16033
Date: Sun, 24 Jul 2016 15:28:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D96876

--- Comment #6 from Ehsan Azar <dashesy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Same lockup happens with 4.6.4, should I try some newer kernel?


Jul 23 21:50:16 dashesy.wavelet kernel: nouveau 0000:01:00.0: fifo: write f=
ault
at 0000260000 engine 00 [GR] client 0f [GPC0/PROP_0] reason 02 [PTE] on cha=
nnel
6 [007fb71000 systemd-logind[867]]
Jul 23 21:50:16 dashesy.wavelet kernel: nouveau 0000:01:00.0: fifo: gr engi=
ne
fault on channel 6, recovering...

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14693741150.EbAEbA8cD.16033
Date: Sun, 24 Jul 2016 15:28:35 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96876#c6">Comment=
 # 6</a>
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
        <pre>Same lockup happens with 4.6.4, should I try some newer kernel?


Jul 23 21:50:16 dashesy.wavelet kernel: nouveau 0000:01:00.0: fifo: write f=
ault
at 0000260000 engine 00 [GR] client 0f [GPC0/PROP_0] reason 02 [PTE] on cha=
nnel
6 [007fb71000 systemd-logind[867]]
Jul 23 21:50:16 dashesy.wavelet kernel: nouveau 0000:01:00.0: fifo: gr engi=
ne
fault on channel 6, recovering...</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14693741150.EbAEbA8cD.16033--

--===============1598438202==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1598438202==--
