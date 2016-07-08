From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91954] "link training failed": nouveau does not
 recover from monitor suspend
Date: Fri, 08 Jul 2016 20:07:30 +0000
Message-ID: <bug-91954-8800-yeT7feQ1hA@http.bugs.freedesktop.org/>
References: <bug-91954-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1864445241=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91954-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1864445241==
Content-Type: multipart/alternative; boundary="14680084501.3133Ea.15306";
 charset="UTF-8"


--14680084501.3133Ea.15306
Date: Fri, 8 Jul 2016 20:07:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D91954

--- Comment #9 from roflawl2009-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
I'm still running into this issue. I posted more detailed information and t=
he
output of dmesg and journalctl on Fedoraforum, here:
http://forums.fedoraforum.org/showthread.php?t=3D310633

When my system is suspended and wakes back up, the primary LCD is stuck on a
blank white image and sometimes cannot recover when switching TTY's. Dmesg
fills up with this:
[ 270.115821] nouveau 0000:01:00.0: disp: outp 00:0006:0344: link training
failed
[ 270.122646] nouveau 0000:01:00.0: disp: outp 00:0006:0344: link training
failed
[ 270.123698] nouveau 0000:01:00.0: disp: outp 00:0006:0344: link not train=
ed
before attach

Hardware:
HP EliteBook 8440p, Legacy Boot
Nvidia GT218M (NVS 3100M)

Software:
Fedora 24, latest updates, Gnome 3.20.2
Gallium 0.4 on NVA8
Kernel - 4.6.3-300.fc24.x86_64

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14680084501.3133Ea.15306
Date: Fri, 8 Jul 2016 20:07:30 +0000
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
   title=3D"NEW - &quot;link training failed&quot;: nouveau does not recove=
r from monitor suspend"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91954#c9">Comment=
 # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - &quot;link training failed&quot;: nouveau does not recove=
r from monitor suspend"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D91954">bug 91954<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
roflawl2009&#64;gmail.com" title=3D"roflawl2009&#64;gmail.com">roflawl2009&=
#64;gmail.com</a>
</span></b>
        <pre>I'm still running into this issue. I posted more detailed info=
rmation and the
output of dmesg and journalctl on Fedoraforum, here:
<a href=3D"http://forums.fedoraforum.org/showthread.php?t=3D310633">http://=
forums.fedoraforum.org/showthread.php?t=3D310633</a>

When my system is suspended and wakes back up, the primary LCD is stuck on a
blank white image and sometimes cannot recover when switching TTY's. Dmesg
fills up with this:
[ 270.115821] nouveau 0000:01:00.0: disp: outp 00:0006:0344: link training
failed
[ 270.122646] nouveau 0000:01:00.0: disp: outp 00:0006:0344: link training
failed
[ 270.123698] nouveau 0000:01:00.0: disp: outp 00:0006:0344: link not train=
ed
before attach

Hardware:
HP EliteBook 8440p, Legacy Boot
Nvidia GT218M (NVS 3100M)

Software:
Fedora 24, latest updates, Gnome 3.20.2
Gallium 0.4 on NVA8
Kernel - 4.6.3-300.fc24.x86_64</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14680084501.3133Ea.15306--

--===============1864445241==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1864445241==--
