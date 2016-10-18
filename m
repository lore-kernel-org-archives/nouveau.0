From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92961] Xorg freezes (only mouse and ssh are still
	working)
Date: Tue, 18 Oct 2016 16:21:26 +0000
Message-ID: <bug-92961-8800-n3lFxrUg1T@http.bugs.freedesktop.org/>
References: <bug-92961-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1329061877=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92961-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1329061877==
Content-Type: multipart/alternative; boundary="14768076860.7C8A.2213";
 charset="UTF-8"


--14768076860.7C8A.2213
Date: Tue, 18 Oct 2016 16:21:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D92961

--- Comment #7 from Marcelo Jimenez <marcelo.jimenez-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Recently I had to switch to nouveau due to a problem with the official nvid=
ia
drivers, and I have been experiencing ramdom gui freezes. The mouse still m=
oves
on the screen, but I cannot interact with the gui.

The nvidia modules are NOT installed in the system.

I usually can connect via ssh and reboot the machine.

The freeze happens at random times, there is no particular sequence to prod=
uce
it. I use KDE on opensuse 42.1.

lspci is:
01:00.0 VGA compatible controller: NVIDIA Corporation GF108 [GeForce GT 730]
(rev a1)

I will attach the pertinent kernel logs.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14768076860.7C8A.2213
Date: Tue, 18 Oct 2016 16:21:26 +0000
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
   title=3D"NEW - Xorg freezes (only mouse and ssh are still working)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D92961#c7">Comment=
 # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Xorg freezes (only mouse and ssh are still working)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D92961">bug 92961<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
marcelo.jimenez&#64;gmail.com" title=3D"Marcelo Jimenez &lt;marcelo.jimenez=
&#64;gmail.com&gt;"> <span class=3D"fn">Marcelo Jimenez</span></a>
</span></b>
        <pre>Recently I had to switch to nouveau due to a problem with the =
official nvidia
drivers, and I have been experiencing ramdom gui freezes. The mouse still m=
oves
on the screen, but I cannot interact with the gui.

The nvidia modules are NOT installed in the system.

I usually can connect via ssh and reboot the machine.

The freeze happens at random times, there is no particular sequence to prod=
uce
it. I use KDE on opensuse 42.1.

lspci is:
01:00.0 VGA compatible controller: NVIDIA Corporation GF108 [GeForce GT 730]
(rev a1)

I will attach the pertinent kernel logs.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14768076860.7C8A.2213--

--===============1329061877==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1329061877==--
