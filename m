From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 88890] [nve7] Reclocking of core speed fails on
 non-reference ASUS GeForce GTX650
Date: Mon, 23 May 2016 17:59:34 +0000
Message-ID: <bug-88890-8800-D7TderlkKB@http.bugs.freedesktop.org/>
References: <bug-88890-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0517372944=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-88890-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0517372944==
Content-Type: multipart/alternative; boundary="14640263741.9CbBBb2a.8131";
 charset="UTF-8"


--14640263741.9CbBBb2a.8131
Date: Mon, 23 May 2016 17:59:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D88890

--- Comment #4 from Karol Herbst <freedesktop-lIBOoy2+GI7scQ4cX5LuPg@public.gmane.org> ---
sorry for the late answer

but you could try out building nouveau from here:

https://github.com/karolherbst/nouveau.git
branch: stable_reclocking_kepler_v5 (based upon linux 4.6)

this should fix those errors.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14640263741.9CbBBb2a.8131
Date: Mon, 23 May 2016 17:59:34 +0000
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
   title=3D"NEW - [nve7] Reclocking of core speed fails on non-reference AS=
US GeForce GTX650"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D88890#c4">Comment=
 # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [nve7] Reclocking of core speed fails on non-reference AS=
US GeForce GTX650"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D88890">bug 88890<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
freedesktop&#64;karolherbst.de" title=3D"Karol Herbst &lt;freedesktop&#64;k=
arolherbst.de&gt;"> <span class=3D"fn">Karol Herbst</span></a>
</span></b>
        <pre>sorry for the late answer

but you could try out building nouveau from here:

<a href=3D"https://github.com/karolherbst/nouveau.git">https://github.com/k=
arolherbst/nouveau.git</a>
branch: stable_reclocking_kepler_v5 (based upon linux 4.6)

this should fix those errors.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14640263741.9CbBBb2a.8131--

--===============0517372944==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0517372944==--
