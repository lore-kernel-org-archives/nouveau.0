From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 31122] Cannot control backlight intensity on
	Powerbook
Date: Fri, 05 Aug 2016 18:17:52 +0000
Message-ID: <bug-31122-8800-uZpK6MinQH@http.bugs.freedesktop.org/>
References: <bug-31122-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0823545117=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-31122-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0823545117==
Content-Type: multipart/alternative; boundary="14704210720.6514e.26987";
 charset="UTF-8"


--14704210720.6514e.26987
Date: Fri, 5 Aug 2016 18:17:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D31122

--- Comment #13 from A. Chaud <nvbugz-ZdXa/xnzD07wXD0AkxfrAg@public.gmane.org> ---
Created attachment 125562
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D125562&action=3Dedit
backlight control w/ gpio check

Thanks for that tip. It was helpful.=20=20

The rom in debugfs worked in nvbios and this patch has a gpio check.  It se=
ems
to work but I've no idea whether or not this is correctly implemented.=20=20

However, I still believe this is unnecessary as the main init function alre=
ady
checks for LVDS and eDP.

I copied the GPIO table below for reference:

GPIO table at 0x0ac3 version 1.0
GPIO 0: line 1 tag 0x08 [HPD_1] IN
GPIO 1: line 2 tag 0x00 [PANEL_BACKLIGHT_ON] OUT param 1
GPIO 2: line 3 tag 0x01 [PANEL_POWER] OUT
GPIO 3: line 4 tag 0x0c [TVDAC_0] OUT
GPIO 4: line 6 tag 0x13 [???] IN
GPIO 5: line 9 tag 0x0a [???] OUT

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14704210720.6514e.26987
Date: Fri, 5 Aug 2016 18:17:52 +0000
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
   title=3D"NEW - Cannot control backlight intensity on Powerbook"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D31122#c13">Commen=
t # 13</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Cannot control backlight intensity on Powerbook"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D31122">bug 31122<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
nvbugz&#64;sparklabs.me" title=3D"A. Chaud &lt;nvbugz&#64;sparklabs.me&gt;"=
> <span class=3D"fn">A. Chaud</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D125562=
" name=3D"attach_125562" title=3D"backlight control w/ gpio check">attachme=
nt 125562</a> <a href=3D"attachment.cgi?id=3D125562&amp;action=3Dedit" titl=
e=3D"backlight control w/ gpio check">[details]</a></span> <a href=3D'page.=
cgi?id=3Dsplinter.html&amp;bug=3D31122&amp;attachment=3D125562'>[review]</a>
backlight control w/ gpio check

Thanks for that tip. It was helpful.=20=20

The rom in debugfs worked in nvbios and this patch has a gpio check.  It se=
ems
to work but I've no idea whether or not this is correctly implemented.=20=20

However, I still believe this is unnecessary as the main init function alre=
ady
checks for LVDS and eDP.

I copied the GPIO table below for reference:

GPIO table at 0x0ac3 version 1.0
GPIO 0: line 1 tag 0x08 [HPD_1] IN
GPIO 1: line 2 tag 0x00 [PANEL_BACKLIGHT_ON] OUT param 1
GPIO 2: line 3 tag 0x01 [PANEL_POWER] OUT
GPIO 3: line 4 tag 0x0c [TVDAC_0] OUT
GPIO 4: line 6 tag 0x13 [???] IN
GPIO 5: line 9 tag 0x0a [???] OUT</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14704210720.6514e.26987--

--===============0823545117==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0823545117==--
