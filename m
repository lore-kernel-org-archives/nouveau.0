From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97620] [REGRESSION,
 bisected] KMS can't initialize GeForce GTX 460 after commit
 a6a0f67ca7aae2e6bec7ebf55d1e4853dc220816
Date: Tue, 31 Jan 2017 14:50:08 +0000
Message-ID: <bug-97620-8800-ufKk6JyM9Y@http.bugs.freedesktop.org/>
References: <bug-97620-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0073647854=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-97620-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0073647854==
Content-Type: multipart/alternative; boundary="14858742073.5AbAE0f.24330";
 charset="UTF-8"


--14858742073.5AbAE0f.24330
Date: Tue, 31 Jan 2017 14:50:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97620

--- Comment #37 from Carl Lucas <carl.lucas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Ben Skeggs from comment #36)
> Are you able to grab a mmiotrace[1] of the NVIDIA binary driver initialis=
ing
> this GPU for me please?
>=20
> Ben.
>=20
> [1] https://nouveau.freedesktop.org/wiki/MmioTrace/

Absolutely - I probably won't be able to get to it until this Saturday (2/4)
though. I'll post the results once I've got them.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14858742073.5AbAE0f.24330
Date: Tue, 31 Jan 2017 14:50:07 +0000
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
   title=3D"NEW - [REGRESSION, bisected] KMS can't initialize GeForce GTX 4=
60 after commit a6a0f67ca7aae2e6bec7ebf55d1e4853dc220816"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97620#c37">Commen=
t # 37</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [REGRESSION, bisected] KMS can't initialize GeForce GTX 4=
60 after commit a6a0f67ca7aae2e6bec7ebf55d1e4853dc220816"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97620">bug 97620<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
carl.lucas&#64;gmail.com" title=3D"Carl Lucas &lt;carl.lucas&#64;gmail.com&=
gt;"> <span class=3D"fn">Carl Lucas</span></a>
</span></b>
        <pre>(In reply to Ben Skeggs from <a href=3D"show_bug.cgi?id=3D9762=
0#c36">comment #36</a>)
<span class=3D"quote">&gt; Are you able to grab a mmiotrace[1] of the NVIDI=
A binary driver initialising
&gt; this GPU for me please?
&gt;=20
&gt; Ben.
&gt;=20
&gt; [1] <a href=3D"https://nouveau.freedesktop.org/wiki/MmioTrace/">https:=
//nouveau.freedesktop.org/wiki/MmioTrace/</a></span >

Absolutely - I probably won't be able to get to it until this Saturday (2/4)
though. I'll post the results once I've got them.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14858742073.5AbAE0f.24330--

--===============0073647854==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0073647854==--
