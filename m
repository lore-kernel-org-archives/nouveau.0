From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89664] Nouveau fails to enter KMS with the Gigabyte
 G1 Gaming GTX970
Date: Mon, 10 Apr 2017 17:53:55 +0000
Message-ID: <bug-89664-8800-4Da8phRnpx@http.bugs.freedesktop.org/>
References: <bug-89664-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0977848916=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89664-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0977848916==
Content-Type: multipart/alternative; boundary="14918468350.DF7ccd.9567";
 charset="UTF-8"


--14918468350.DF7ccd.9567
Date: Mon, 10 Apr 2017 17:53:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D89664

--- Comment #18 from Jonas Nordlund <jonas.nordlund-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Is this perhaps bug 94990?

I also own an NVIDIA GTX 970 (Asus) and I can see the Gigabyte G1 Gaming GT=
X970
also has 4 GB VRAM. The problem here could be that NVIDIA made a controvers=
ial
decision in making 3.5 GB VRAM full speed, but a special, subpar configurat=
ion
for the remaining 0.5 GB making it approximately 7x slower than the "main"
VRAM.

And noveau doesn't support this.

There are some tries with a hack in the bug above to have nouveau only use =
the
initial 3.5 GB but I don't think it was successful yet as of April 2017.

It's too bad because it cripples the GTX 970 on most Linux distros, leaving=
 one
with the remaining option to add the nomodeset option to the Linux boot opt=
ions
to get an initial low resolution unaccelerated boot, and while running that,
blacklisting the nouveau driver and then finally installing the proprietary
NVIDIA driver. A reboot after this, and it will (should) work with the cave=
at
that caution is necessary with proprietary drivers and Kernel updates
especially if using so called "rolling release" distros.

I'm still having my hopes up for a fix! Would be the single most useful fix=
 for
the past two years for me.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14918468350.DF7ccd.9567
Date: Mon, 10 Apr 2017 17:53:55 +0000
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
   title=3D"NEW - Nouveau fails to enter KMS with the Gigabyte G1 Gaming GT=
X970"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D89664#c18">Commen=
t # 18</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau fails to enter KMS with the Gigabyte G1 Gaming GT=
X970"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D89664">bug 89664<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jonas.nordlund&#64;gmail.com" title=3D"Jonas Nordlund &lt;jonas.nordlund&#6=
4;gmail.com&gt;"> <span class=3D"fn">Jonas Nordlund</span></a>
</span></b>
        <pre>Is this perhaps <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GM204] GTX 970 + 4GB VRAM fails at secboot (v4.6+)"
   href=3D"show_bug.cgi?id=3D94990">bug 94990</a>?

I also own an NVIDIA GTX 970 (Asus) and I can see the Gigabyte G1 Gaming GT=
X970
also has 4 GB VRAM. The problem here could be that NVIDIA made a controvers=
ial
decision in making 3.5 GB VRAM full speed, but a special, subpar configurat=
ion
for the remaining 0.5 GB making it approximately 7x slower than the &quot;m=
ain&quot;
VRAM.

And noveau doesn't support this.

There are some tries with a hack in the bug above to have nouveau only use =
the
initial 3.5 GB but I don't think it was successful yet as of April 2017.

It's too bad because it cripples the GTX 970 on most Linux distros, leaving=
 one
with the remaining option to add the nomodeset option to the Linux boot opt=
ions
to get an initial low resolution unaccelerated boot, and while running that,
blacklisting the nouveau driver and then finally installing the proprietary
NVIDIA driver. A reboot after this, and it will (should) work with the cave=
at
that caution is necessary with proprietary drivers and Kernel updates
especially if using so called &quot;rolling release&quot; distros.

I'm still having my hopes up for a fix! Would be the single most useful fix=
 for
the past two years for me.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14918468350.DF7ccd.9567--

--===============0977848916==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0977848916==--
