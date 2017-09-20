From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99900] [NVC1] nouveau: freeze / crash after kernel
 update to 4.10
Date: Wed, 20 Sep 2017 22:08:30 +0000
Message-ID: <bug-99900-8800-AYoSkdyoE6@http.bugs.freedesktop.org/>
References: <bug-99900-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1775344586=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99900-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1775344586==
Content-Type: multipart/alternative; boundary="15059453107.90D79dd.8960";
 charset="UTF-8"


--15059453107.90D79dd.8960
Date: Wed, 20 Sep 2017 22:08:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99900

--- Comment #21 from andrewb03-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
4.13 throws on my Gentoo install (since it wasn't available on Arch yet):

nouveau 0000:0a:00.0: DRM: DDC responded, but no EDID for DP-4

When this happens the console freezes unless I disable KMS via the command =
line
(SSH works fine).

My GPUs are 660ti in the second PCI slot connected to DP-1 and 1080ti in the
first PCI slot connected to DP-4.

Are you saying 4.12.11+ was supposed to resolve the random freezing?

On Gentoo I don't even have X install so I think it freezes when nouveau tr=
ies
to load the FB console.

Would it be worth building nouveau in instead of as a kernel module?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15059453107.90D79dd.8960
Date: Wed, 20 Sep 2017 22:08:30 +0000
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
   title=3D"NEW - [NVC1] nouveau: freeze / crash after kernel update to 4.1=
0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99900#c21">Commen=
t # 21</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] nouveau: freeze / crash after kernel update to 4.1=
0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99900">bug 99900<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
andrewb03&#64;gmail.com" title=3D"andrewb03&#64;gmail.com">andrewb03&#64;gm=
ail.com</a>
</span></b>
        <pre>4.13 throws on my Gentoo install (since it wasn't available on=
 Arch yet):

nouveau 0000:0a:00.0: DRM: DDC responded, but no EDID for DP-4

When this happens the console freezes unless I disable KMS via the command =
line
(SSH works fine).

My GPUs are 660ti in the second PCI slot connected to DP-1 and 1080ti in the
first PCI slot connected to DP-4.

Are you saying 4.12.11+ was supposed to resolve the random freezing?

On Gentoo I don't even have X install so I think it freezes when nouveau tr=
ies
to load the FB console.

Would it be worth building nouveau in instead of as a kernel module?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15059453107.90D79dd.8960--

--===============1775344586==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1775344586==--
