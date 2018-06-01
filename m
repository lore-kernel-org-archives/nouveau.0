From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 106772] Xorg crashes with nouveau and dual screen
 setup
Date: Fri, 01 Jun 2018 20:55:50 +0000
Message-ID: <bug-106772-8800-8hnIR12C0i@http.bugs.freedesktop.org/>
References: <bug-106772-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1496832769=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-106772-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1496832769==
Content-Type: multipart/alternative; boundary="15278865500.07d4E.28566"
Content-Transfer-Encoding: 7bit


--15278865500.07d4E.28566
Date: Fri, 1 Jun 2018 20:55:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D106772

--- Comment #5 from Keith Packard <keithp-aN4HjG94KOLQT0dZR+AlfA@public.gmane.org> ---
Looks like Nouveau still parties like it's 1999. I don't think more recent
drivers do mode setting this early. However, it's easy enough to handle this
case by simply skipping the RRCrtcIsLeased and RROutputIsLeased calls when =
the
respective DIX objects haven't been created yet. Here's a patch which simply
wraps those functions in xf86 code that checks for NULL pointers before cal=
ling
the DIX code.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15278865500.07d4E.28566
Date: Fri, 1 Jun 2018 20:55:50 +0000
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
   title=3D"NEW - Xorg crashes with nouveau and dual screen setup"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106772#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Xorg crashes with nouveau and dual screen setup"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106772">bug 10677=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
keithp&#64;keithp.com" title=3D"Keith Packard &lt;keithp&#64;keithp.com&gt;=
"> <span class=3D"fn">Keith Packard</span></a>
</span></b>
        <pre>Looks like Nouveau still parties like it's 1999. I don't think=
 more recent
drivers do mode setting this early. However, it's easy enough to handle this
case by simply skipping the RRCrtcIsLeased and RROutputIsLeased calls when =
the
respective DIX objects haven't been created yet. Here's a patch which simply
wraps those functions in xf86 code that checks for NULL pointers before cal=
ling
the DIX code.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15278865500.07d4E.28566--

--===============1496832769==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1496832769==--
