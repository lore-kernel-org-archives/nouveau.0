From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 72952] [NV94] no HDMI output,
 xrands claims DVI-D-1 disconnected
Date: Sat, 21 Dec 2013 22:02:48 +0000
Message-ID: <bug-72952-8800-EebQ1ia02D@http.bugs.freedesktop.org/>
References: <bug-72952-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0104387119=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-72952-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0104387119==
Content-Type: multipart/alternative; boundary="1387663368.Bfa4Cc271.4367"; charset="us-ascii"


--1387663368.Bfa4Cc271.4367
Date: Sat, 21 Dec 2013 22:02:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D72952

J=C3=B6rg H=C3=B6hle <Joerg-Cyril.Hoehle-02uNIv46f66akBO8gow8eQ@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
  Attachment #91095|0                           |1
        is obsolete|                            |

--- Comment #3 from J=C3=B6rg H=C3=B6hle <Joerg-Cyril.Hoehle-02uNIv46f66akBO8gow8eQ@public.gmane.org>=
 ---
Created attachment 91105
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D91105&action=3Dedit
dmesg.log when booting with drm.debug=3D4, incl. suspend/resume cycle

Perhaps a dmesg.log including a suspend/resume cycle is more revealing?
I'm not sure whether I was entirely clear. I never observed a HDMI signal on
the monitor, but the weird behaviour at resume proves that at least the EDID
signals transit through the cable, some time. Perhaps that's 2 bugs?
 - No immediate EDID at boot time;
 - no HDMI out, even past resume where EDID happened

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1387663368.Bfa4Cc271.4367
Date: Sat, 21 Dec 2013 22:02:48 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:Joerg-Cyr=
il.Hoehle&#64;T-Systems.com" title=3D"J=C3=B6rg H=C3=B6hle &lt;Joerg-Cyril.=
Hoehle&#64;T-Systems.com&gt;"> <span class=3D"fn">J=C3=B6rg H=C3=B6hle</spa=
n></a>
</span> changed
              <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NV94] no HDMI output, xrands claims DVI-D-1 disconne=
cted"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D72952">bug 72952<=
/a>
        <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Attachment #91095 is obsolete</t=
d>
           <td>
               &nbsp;
           </td>
           <td>1
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NV94] no HDMI output, xrands claims DVI-D-1 disconne=
cted"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D72952#c3">Comment=
 # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NV94] no HDMI output, xrands claims DVI-D-1 disconne=
cted"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D72952">bug 72952<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
Joerg-Cyril.Hoehle&#64;T-Systems.com" title=3D"J=C3=B6rg H=C3=B6hle &lt;Joe=
rg-Cyril.Hoehle&#64;T-Systems.com&gt;"> <span class=3D"fn">J=C3=B6rg H=C3=
=B6hle</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D91105"=
 name=3D"attach_91105" title=3D"dmesg.log when booting with drm.debug=3D4, =
incl. suspend/resume cycle">attachment 91105</a> <a href=3D"attachment.cgi?=
id=3D91105&amp;action=3Dedit" title=3D"dmesg.log when booting with drm.debu=
g=3D4, incl. suspend/resume cycle">[details]</a></span>
dmesg.log when booting with drm.debug=3D4, incl. suspend/resume cycle

Perhaps a dmesg.log including a suspend/resume cycle is more revealing?
I'm not sure whether I was entirely clear. I never observed a HDMI signal on
the monitor, but the weird behaviour at resume proves that at least the EDID
signals transit through the cable, some time. Perhaps that's 2 bugs?
 - No immediate EDID at boot time;
 - no HDMI out, even past resume where EDID happened</pre>
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

--1387663368.Bfa4Cc271.4367--

--===============0104387119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0104387119==--
