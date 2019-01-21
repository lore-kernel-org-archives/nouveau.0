From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 109407] GTX 1050 fails to initialise acceleration
Date: Mon, 21 Jan 2019 20:28:40 +0000
Message-ID: <bug-109407-8800-zdYQOZCYUJ@http.bugs.freedesktop.org/>
References: <bug-109407-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0554990122=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-109407-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0554990122==
Content-Type: multipart/alternative; boundary="15481025192.A5E79.13052"
Content-Transfer-Encoding: 7bit


--15481025192.A5E79.13052
Date: Mon, 21 Jan 2019 20:28:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109407

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Hm - this is probably not good:

nouveau 0000:43:00.0: secboot: SEC2 failed to start

There's a comment in the code before this happens:

        /*
         * There is a bug where the LS firmware sometimes require to be sta=
rted
         * twice (this happens only on SEC). Detect and workaround that
         * condition.
         *
         * Once started, the falcon will end up in STOPPED condition (bit 5)
         * if successful, or in HALT condition (bit 4) if not.
         */

And then it goes on to try to re-start things, and when *that* fails, you g=
et
the "SEC2 failed to start" message. This code was contributed by NVIDIA, I
don't think we know much about it.

Make sure you have the latest firmware from linux-firmware, as it occasiona=
lly
does get updated. However I'm not sure I've seen this particular failure
before.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15481025192.A5E79.13052
Date: Mon, 21 Jan 2019 20:28:39 +0000
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
   title=3D"NEW - GTX 1050 fails to initialise acceleration"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109407#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GTX 1050 fails to initialise acceleration"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109407">bug 10940=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Hm - this is probably not good:

nouveau 0000:43:00.0: secboot: SEC2 failed to start

There's a comment in the code before this happens:

        /*
         * There is a bug where the LS firmware sometimes require to be sta=
rted
         * twice (this happens only on SEC). Detect and workaround that
         * condition.
         *
         * Once started, the falcon will end up in STOPPED condition (bit 5)
         * if successful, or in HALT condition (bit 4) if not.
         */

And then it goes on to try to re-start things, and when *that* fails, you g=
et
the &quot;SEC2 failed to start&quot; message. This code was contributed by =
NVIDIA, I
don't think we know much about it.

Make sure you have the latest firmware from linux-firmware, as it occasiona=
lly
does get updated. However I'm not sure I've seen this particular failure
before.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15481025192.A5E79.13052--

--===============0554990122==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0554990122==--
