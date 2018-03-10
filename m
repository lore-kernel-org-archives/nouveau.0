From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75985] [NVC1] HDMI audio device only visible after
 rescan
Date: Sat, 10 Mar 2018 19:42:15 +0000
Message-ID: <bug-75985-8800-pBrcwXNb4z@http.bugs.freedesktop.org/>
References: <bug-75985-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0921728768=="
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


--===============0921728768==
Content-Type: multipart/alternative; boundary="15207109352.5aa12e2E.5490"
Content-Transfer-Encoding: 7bit


--15207109352.5aa12e2E.5490
Date: Sat, 10 Mar 2018 19:42:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #66 from Lukas Wunner <lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org> ---
(In reply to Maik Freudenberg from comment #65)
> Now with the acpi bug fixed, I applied both of your v2 patchsets with some
> nip/tuck to a 4.16rc4+ kernel and ran into the next oddity: while the pci
> quirk in general works, re-reading the header type will always return 0x00
> so the hda device is not added.
> lspci confirms that the quirk is otherwise working:
> 00: de 10 92 12 07 00 10 00 a1 00 02 03 00 00 80 00
> 480: 00 00 00 00 17 00 00 00 00 00 00 02 00 00 00 00

Hm, the multifunction bit is set. Try adding an msleep(100) after setting t=
he
bit at offset 0x488 and before re-reading the header type register. 100 ms =
is
likely way too much, this is just to ensure it's not too short.

Also, try changing DECLARE_PCI_FIXUP_CLASS_HEADER to
DECLARE_PCI_FIXUP_CLASS_EARLY. Shouldn't make a difference but maybe I miss=
ed
something.

Does it work if you just set gpu->multifunction =3D 1?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15207109352.5aa12e2E.5490
Date: Sat, 10 Mar 2018 19:42:15 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c66">Commen=
t # 66</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
lukas&#64;wunner.de" title=3D"Lukas Wunner &lt;lukas&#64;wunner.de&gt;"> <s=
pan class=3D"fn">Lukas Wunner</span></a>
</span></b>
        <pre>(In reply to Maik Freudenberg from <a href=3D"show_bug.cgi?id=
=3D75985#c65">comment #65</a>)
<span class=3D"quote">&gt; Now with the acpi bug fixed, I applied both of y=
our v2 patchsets with some
&gt; nip/tuck to a 4.16rc4+ kernel and ran into the next oddity: while the =
pci
&gt; quirk in general works, re-reading the header type will always return =
0x00
&gt; so the hda device is not added.
&gt; lspci confirms that the quirk is otherwise working:
&gt; 00: de 10 92 12 07 00 10 00 a1 00 02 03 00 00 80 00
&gt; 480: 00 00 00 00 17 00 00 00 00 00 00 02 00 00 00 00</span >

Hm, the multifunction bit is set. Try adding an msleep(100) after setting t=
he
bit at offset 0x488 and before re-reading the header type register. 100 ms =
is
likely way too much, this is just to ensure it's not too short.

Also, try changing DECLARE_PCI_FIXUP_CLASS_HEADER to
DECLARE_PCI_FIXUP_CLASS_EARLY. Shouldn't make a difference but maybe I miss=
ed
something.

Does it work if you just set gpu-&gt;multifunction =3D 1?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15207109352.5aa12e2E.5490--

--===============0921728768==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0921728768==--
