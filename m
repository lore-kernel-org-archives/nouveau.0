From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91413] fan alarm timer/update called from interrupt
 in an infinite loop
Date: Tue, 24 May 2016 15:16:42 +0000
Message-ID: <bug-91413-8800-gfGkjrDQum@http.bugs.freedesktop.org/>
References: <bug-91413-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1371990857=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91413-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1371990857==
Content-Type: multipart/alternative; boundary="14641030020.26ac8F.11075";
 charset="UTF-8"


--14641030020.26ac8F.11075
Date: Tue, 24 May 2016 15:16:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D91413

--- Comment #11 from Jim Paris <jim-XrPbb/hENzg@public.gmane.org> ---
FWIW, I've been running with the workaround patch in comment 6 for about 9
months now and haven't noticed any problems.  I hit the warning maybe 4 tim=
es a
day.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14641030020.26ac8F.11075
Date: Tue, 24 May 2016 15:16:42 +0000
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
   title=3D"NEW - fan alarm timer/update called from interrupt in an infini=
te loop"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91413#c11">Commen=
t # 11</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - fan alarm timer/update called from interrupt in an infini=
te loop"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91413">bug 91413<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jim&#64;jtan.com" title=3D"Jim Paris &lt;jim&#64;jtan.com&gt;"> <span class=
=3D"fn">Jim Paris</span></a>
</span></b>
        <pre>FWIW, I've been running with the workaround patch in <a href=
=3D"show_bug.cgi?id=3D91413#c6">comment 6</a> for about 9
months now and haven't noticed any problems.  I hit the warning maybe 4 tim=
es a
day.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14641030020.26ac8F.11075--

--===============1371990857==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1371990857==--
