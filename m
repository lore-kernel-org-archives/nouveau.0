From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89247] [NVE7] short display freeze on xrandr --query
Date: Tue, 05 May 2015 20:30:45 +0000
Message-ID: <bug-89247-8800-ReKXfLd9iO@http.bugs.freedesktop.org/>
References: <bug-89247-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1254541532=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89247-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1254541532==
Content-Type: multipart/alternative; boundary="1430857845.32e71.31714"; charset="UTF-8"


--1430857845.32e71.31714
Date: Tue, 5 May 2015 20:30:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D89247

--- Comment #12 from exi+freedesktop-LwM2R4sIHAOzQB+pC5nmwQ@public.gmane.org ---
I just switched to Optimus mode in the bios.
When I boot Linux, the Intel driver takes over immediately.
In this mode, no external displays are recognized for both VGA and DP ports.
In 'Intel only' mode, Windows is unable to recognize any external displays =
too,
so i think it is hard wired.
In 'Nvidia only' mode, all external ports are working, except for the bug
described in this ticket.

=E2=94=94> xrandr --listproviders
Providers: number : 2
Provider 0: id: 0x8f cap: 0xb, Source Output, Sink Output, Sink Offload crt=
cs:
4 outputs: 3 associated providers: 0 name:Intel
Provider 1: id: 0x68 cap: 0x7, Source Output, Sink Output, Source Offload
crtcs: 4 outputs: 5 associated providers: 0 name:nouveau

=E2=94=94> xrandr -q
Screen 0: minimum 8 x 8, current 1920 x 1080, maximum 32767 x 32767
LVDS2 connected primary 1920x1080+0+0 (normal left inverted right x axis y
axis) 344mm x 193mm
   1920x1080     60.02*+  50.03=20=20
   1400x1050     59.98=20=20
   1280x1024     60.02=20=20
   1280x960      60.00=20=20
   1024x768      60.00=20=20
   800x600       60.32    56.25=20=20
   640x480       59.94=20=20
VGA2 disconnected (normal left inverted right x axis y axis)
VIRTUAL1 disconnected (normal left inverted right x axis y axis)

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1430857845.32e71.31714
Date: Tue, 5 May 2015 20:30:45 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE7] short display freeze on xrandr --query"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D89247#c12">Commen=
t # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE7] short display freeze on xrandr --query"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D89247">bug 89247<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
exi+freedesktop&#64;wthack.de" title=3D"exi+freedesktop&#64;wthack.de">exi+=
freedesktop&#64;wthack.de</a>
</span></b>
        <pre>I just switched to Optimus mode in the bios.
When I boot Linux, the Intel driver takes over immediately.
In this mode, no external displays are recognized for both VGA and DP ports.
In 'Intel only' mode, Windows is unable to recognize any external displays =
too,
so i think it is hard wired.
In 'Nvidia only' mode, all external ports are working, except for the bug
described in this ticket.

=E2=94=94&gt; xrandr --listproviders
Providers: number : 2
Provider 0: id: 0x8f cap: 0xb, Source Output, Sink Output, Sink Offload crt=
cs:
4 outputs: 3 associated providers: 0 name:Intel
Provider 1: id: 0x68 cap: 0x7, Source Output, Sink Output, Source Offload
crtcs: 4 outputs: 5 associated providers: 0 name:nouveau

=E2=94=94&gt; xrandr -q
Screen 0: minimum 8 x 8, current 1920 x 1080, maximum 32767 x 32767
LVDS2 connected primary 1920x1080+0+0 (normal left inverted right x axis y
axis) 344mm x 193mm
   1920x1080     60.02*+  50.03=20=20
   1400x1050     59.98=20=20
   1280x1024     60.02=20=20
   1280x960      60.00=20=20
   1024x768      60.00=20=20
   800x600       60.32    56.25=20=20
   640x480       59.94=20=20
VGA2 disconnected (normal left inverted right x axis y axis)
VIRTUAL1 disconnected (normal left inverted right x axis y axis)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1430857845.32e71.31714--

--===============1254541532==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1254541532==--
