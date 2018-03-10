From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75985] [NVC1] HDMI audio device only visible after
 rescan
Date: Sat, 10 Mar 2018 19:14:11 +0000
Message-ID: <bug-75985-8800-yG712BBsL1@http.bugs.freedesktop.org/>
References: <bug-75985-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1852092374=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75985-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1852092374==
Content-Type: multipart/alternative; boundary="15207092522.96AaeC0FA.30635"
Content-Transfer-Encoding: 7bit


--15207092522.96AaeC0FA.30635
Date: Sat, 10 Mar 2018 19:14:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #65 from Maik Freudenberg <hhfeuer-Mmb7MZpHnFY@public.gmane.org> ---
I feel like I'm jumping from puddle to puddle now.
Lukas, I previously couldn't test your patches due to an acpica bug affecti=
ng
my machine rendering results useless. Luckily, this has been fixed now.

Meanwhile, I discovered that (at least) kernels 4.9-4.13 suffer from some p=
ci
config space bug making re-reading the header type impossible. The kernel w=
ill
always put out a cached version thus making it impossible to enable the hda=
 dev
with any method, even remove/rescan.
So a fair warning to users running a 4.9LTS kernel trying to turn on audio.
Kernel series 4.4 or 4.14+ work.

Now with the acpi bug fixed, I applied both of your v2 patchsets with some
nip/tuck to a 4.16rc4+ kernel and ran into the next oddity: while the pci q=
uirk
in general works, re-reading the header type will always return 0x00 so the=
 hda
device is not added.
lspci confirms that the quirk is otherwise working:
00: de 10 92 12 07 00 10 00 a1 00 02 03 00 00 80 00
480: 00 00 00 00 17 00 00 00 00 00 00 02 00 00 00 00

I'll investigate what's happening the next days.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15207092522.96AaeC0FA.30635
Date: Sat, 10 Mar 2018 19:14:12 +0000
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
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c65">Commen=
t # 65</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
hhfeuer&#64;gmx.de" title=3D"Maik Freudenberg &lt;hhfeuer&#64;gmx.de&gt;"> =
<span class=3D"fn">Maik Freudenberg</span></a>
</span></b>
        <pre>I feel like I'm jumping from puddle to puddle now.
Lukas, I previously couldn't test your patches due to an acpica bug affecti=
ng
my machine rendering results useless. Luckily, this has been fixed now.

Meanwhile, I discovered that (at least) kernels 4.9-4.13 suffer from some p=
ci
config space bug making re-reading the header type impossible. The kernel w=
ill
always put out a cached version thus making it impossible to enable the hda=
 dev
with any method, even remove/rescan.
So a fair warning to users running a 4.9LTS kernel trying to turn on audio.
Kernel series 4.4 or 4.14+ work.

Now with the acpi bug fixed, I applied both of your v2 patchsets with some
nip/tuck to a 4.16rc4+ kernel and ran into the next oddity: while the pci q=
uirk
in general works, re-reading the header type will always return 0x00 so the=
 hda
device is not added.
lspci confirms that the quirk is otherwise working:
00: de 10 92 12 07 00 10 00 a1 00 02 03 00 00 80 00
480: 00 00 00 00 17 00 00 00 00 00 00 02 00 00 00 00

I'll investigate what's happening the next days.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15207092522.96AaeC0FA.30635--

--===============1852092374==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1852092374==--
