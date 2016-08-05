From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 31122] Cannot control backlight intensity on
	Powerbook
Date: Fri, 05 Aug 2016 16:37:34 +0000
Message-ID: <bug-31122-8800-YNthPCKXEd@http.bugs.freedesktop.org/>
References: <bug-31122-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2110972287=="
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


--===============2110972287==
Content-Type: multipart/alternative; boundary="14704150543.Ca3Abaf.17148";
 charset="UTF-8"


--14704150543.Ca3Abaf.17148
Date: Fri, 5 Aug 2016 16:37:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D31122

--- Comment #11 from A. Chaud <nvbugz-ZdXa/xnzD07wXD0AkxfrAg@public.gmane.org> ---
nvagetbios wasn't able to extract the bios.  From what I gathered after
searching, openfirmware handles vbios differently (ie: no checksums, smaller
vbios, etc).  I found a nv34 openfirmware bios someone else dumped and nvbi=
os
is unable to decode the GPIO section.

However, if the aim is ensuring the device has a backlight, I believe it's
already done.  In nouveau_backlight_init, it first checks to ensure there's=
 a
display on either LVDS or eDP.  Can we not reasonably assume that if the gpu
has a LVDS or eDP panel attached that it also has a backlight?  My init
function is a slightly altered version of the existing nv40_backlight_init
function which doesn't have a backlight check either.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14704150543.Ca3Abaf.17148
Date: Fri, 5 Aug 2016 16:37:34 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D31122#c11">Commen=
t # 11</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Cannot control backlight intensity on Powerbook"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D31122">bug 31122<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
nvbugz&#64;sparklabs.me" title=3D"A. Chaud &lt;nvbugz&#64;sparklabs.me&gt;"=
> <span class=3D"fn">A. Chaud</span></a>
</span></b>
        <pre>nvagetbios wasn't able to extract the bios.  From what I gathe=
red after
searching, openfirmware handles vbios differently (ie: no checksums, smaller
vbios, etc).  I found a nv34 openfirmware bios someone else dumped and nvbi=
os
is unable to decode the GPIO section.

However, if the aim is ensuring the device has a backlight, I believe it's
already done.  In nouveau_backlight_init, it first checks to ensure there's=
 a
display on either LVDS or eDP.  Can we not reasonably assume that if the gpu
has a LVDS or eDP panel attached that it also has a backlight?  My init
function is a slightly altered version of the existing nv40_backlight_init
function which doesn't have a backlight check either.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14704150543.Ca3Abaf.17148--

--===============2110972287==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2110972287==--
