From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105174] [GF108][Regression] Unable to handle NULL
 pointer dereference in nouveau_mem_host since kernel 4.15.3
Date: Tue, 20 Feb 2018 16:47:24 +0000
Message-ID: <bug-105174-8800-QGJz6vJsWb@http.bugs.freedesktop.org/>
References: <bug-105174-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0954280782=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-105174-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0954280782==
Content-Type: multipart/alternative; boundary="15191452431.dfFFEac.11138"
Content-Transfer-Encoding: 7bit


--15191452431.dfFFEac.11138
Date: Tue, 20 Feb 2018 16:47:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105174

--- Comment #4 from Dominik 'Rathann' Mierzejewski <dominik-IZ6Av6enwRKJQ7yn63+t2w@public.gmane.org>=
 ---
It happens on every login. My user display configuration is such that it
switches the HDMI output on and internal LCD off, while the login screen
(lightdm) uses the internal LCD only. Immediately after logging in, I get t=
he
display freeze when it tries to drive the HDMI output. The mouse cursor is
still moving.

Apparently the nternal LCD is driven by i915 directly while the HDMI output
goes via nouveau.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15191452431.dfFFEac.11138
Date: Tue, 20 Feb 2018 16:47:23 +0000
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
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - [GF108][Regression] Unable to handle NULL pointer de=
reference in nouveau_mem_host since kernel 4.15.3"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105174#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - [GF108][Regression] Unable to handle NULL pointer de=
reference in nouveau_mem_host since kernel 4.15.3"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105174">bug 10517=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
dominik&#64;greysector.net" title=3D"Dominik 'Rathann' Mierzejewski &lt;dom=
inik&#64;greysector.net&gt;"> <span class=3D"fn">Dominik 'Rathann' Mierzeje=
wski</span></a>
</span></b>
        <pre>It happens on every login. My user display configuration is su=
ch that it
switches the HDMI output on and internal LCD off, while the login screen
(lightdm) uses the internal LCD only. Immediately after logging in, I get t=
he
display freeze when it tries to drive the HDMI output. The mouse cursor is
still moving.

Apparently the nternal LCD is driven by i915 directly while the HDMI output
goes via nouveau.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15191452431.dfFFEac.11138--

--===============0954280782==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0954280782==--
