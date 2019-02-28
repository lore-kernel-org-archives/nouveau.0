From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 109613] nouveau: KMS is broken on last kernels
 (9700M GT)
Date: Thu, 28 Feb 2019 10:21:43 +0000
Message-ID: <bug-109613-8800-dOHvd65ytW@http.bugs.freedesktop.org/>
References: <bug-109613-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1555971478=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-109613-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1555971478==
Content-Type: multipart/alternative; boundary="15513493031.eAe4f.10068"
Content-Transfer-Encoding: 7bit


--15513493031.eAe4f.10068
Date: Thu, 28 Feb 2019 10:21:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109613

--- Comment #6 from Evgeny Kurnevsky <kurnevsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Also removing call to nvkm_therm_update_linear_fallback on 4.20 branch fixes
the issue.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15513493031.eAe4f.10068
Date: Thu, 28 Feb 2019 10:21:43 +0000
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
   title=3D"NEW - nouveau: KMS is broken on last kernels (9700M GT)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109613#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nouveau: KMS is broken on last kernels (9700M GT)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109613">bug 10961=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
kurnevsky&#64;gmail.com" title=3D"Evgeny Kurnevsky &lt;kurnevsky&#64;gmail.=
com&gt;"> <span class=3D"fn">Evgeny Kurnevsky</span></a>
</span></b>
        <pre>Also removing call to nvkm_therm_update_linear_fallback on 4.2=
0 branch fixes
the issue.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15513493031.eAe4f.10068--

--===============1555971478==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1555971478==--
