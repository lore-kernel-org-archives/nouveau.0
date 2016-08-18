From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97367] k520 card produce high volume of IRQ
Date: Thu, 18 Aug 2016 08:22:08 +0000
Message-ID: <bug-97367-8800-g4fUMN6Lxi@http.bugs.freedesktop.org/>
References: <bug-97367-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1215169678=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-97367-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1215169678==
Content-Type: multipart/alternative; boundary="14715085281.5BB4b.12137";
 charset="UTF-8"


--14715085281.5BB4b.12137
Date: Thu, 18 Aug 2016 08:22:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97367

--- Comment #7 from Mathieu Maret <mmaret-LWXiaffTwBPZJqsBc5GL+g@public.gmane.org> ---
The irq file show that the IRQ on nvkm happens 140954 times in 1 sec.
The perf reports does not show things related to nvkm, but I may not have u=
se
the right options for perf

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14715085281.5BB4b.12137
Date: Thu, 18 Aug 2016 08:22:08 +0000
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
   title=3D"NEW - k520 card produce high volume of IRQ"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97367#c7">Comment=
 # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - k520 card produce high volume of IRQ"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97367">bug 97367<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mmaret&#64;genymobile.com" title=3D"Mathieu Maret &lt;mmaret&#64;genymobile=
.com&gt;"> <span class=3D"fn">Mathieu Maret</span></a>
</span></b>
        <pre>The irq file show that the IRQ on nvkm happens 140954 times in=
 1 sec.
The perf reports does not show things related to nvkm, but I may not have u=
se
the right options for perf</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14715085281.5BB4b.12137--

--===============1215169678==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1215169678==--
