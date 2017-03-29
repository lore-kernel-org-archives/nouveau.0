From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98383] X server is crashing/eats 100% cpu when
 turning on monitor
Date: Wed, 29 Mar 2017 08:30:27 +0000
Message-ID: <bug-98383-8800-zrBih3iJ7a@http.bugs.freedesktop.org/>
References: <bug-98383-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1987092192=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98383-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1987092192==
Content-Type: multipart/alternative; boundary="14907762272.c31BB5.13313";
 charset="UTF-8"


--14907762272.c31BB5.13313
Date: Wed, 29 Mar 2017 08:30:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98383

Mariusz Bia=C5=82o=C5=84czyk <manio-RFXG7K41k5GsTnJN9+BGXg@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Assignee|xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org       |nouveau-PD4FTy7X32lNgt0PjOBp93rCq3LdnpKM@public.gmane.org
                   |                            |rg
           Severity|major                       |critical
            Version|unspecified                 |git
           Priority|medium                      |high
          Component|Server/General              |Driver/nouveau
                 CC|                            |skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #7 from Mariusz Bia=C5=82o=C5=84czyk <manio-RFXG7K41k5GsTnJN9+BGXg@public.gmane.org> ---
Hello again,
Guys, recently I switched to the recent Xorg and nouveau from git.
The 100% cpu problem seems to be gone (at least so far), but the nouveau is
still crashing the xserver.

I still has to apply the following patch:
diff --git a/src/drmmode_display.c b/src/drmmode_display.c
index dd9fa27..a468223 100644
--- a/src/drmmode_display.c
+++ b/src/drmmode_display.c
@@ -1542,7 +1542,7 @@ drmmode_handle_uevents(ScrnInfoPtr scrn)
        if (!dev)
                return;

-       RRGetInfo(xf86ScrnToScreen(scrn), TRUE);
+       //RRGetInfo(xf86ScrnToScreen(scrn), TRUE);
        udev_device_unref(dev);
 }
 #endif

Otherwise - when I turn on the TV on other Xorg instance (with intel driver=
),
the xorg is crashing. Maybe nouveau is trying to do something wrong with the
randr event on other xorg instance?

It is now over a five months from the time when I reported it. Is it really=
 so
hard to cooperate with me to get rid of this bug? I can try your patches, g=
ive
you additional debug information, I have programming skills.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14907762272.c31BB5.13313
Date: Wed, 29 Mar 2017 08:30:27 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:manio&#64=
;skyboo.net" title=3D"Mariusz Bia=C5=82o=C5=84czyk &lt;manio&#64;skyboo.net=
&gt;"> <span class=3D"fn">Mariusz Bia=C5=82o=C5=84czyk</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - X server is crashing/eats 100% cpu when turning on monito=
r"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98383">bug 98383<=
/a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Assignee</td>
           <td>xorg-team&#64;lists.x.org
           </td>
           <td>nouveau&#64;lists.freedesktop.org
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Severity</td>
           <td>major
           </td>
           <td>critical
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Version</td>
           <td>unspecified
           </td>
           <td>git
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Priority</td>
           <td>medium
           </td>
           <td>high
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Component</td>
           <td>Server/General
           </td>
           <td>Driver/nouveau
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>skeggsb&#64;gmail.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - X server is crashing/eats 100% cpu when turning on monito=
r"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98383#c7">Comment=
 # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - X server is crashing/eats 100% cpu when turning on monito=
r"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98383">bug 98383<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
manio&#64;skyboo.net" title=3D"Mariusz Bia=C5=82o=C5=84czyk &lt;manio&#64;s=
kyboo.net&gt;"> <span class=3D"fn">Mariusz Bia=C5=82o=C5=84czyk</span></a>
</span></b>
        <pre>Hello again,
Guys, recently I switched to the recent Xorg and nouveau from git.
The 100% cpu problem seems to be gone (at least so far), but the nouveau is
still crashing the xserver.

I still has to apply the following patch:
diff --git a/src/drmmode_display.c b/src/drmmode_display.c
index dd9fa27..a468223 100644
--- a/src/drmmode_display.c
+++ b/src/drmmode_display.c
&#64;&#64; -1542,7 +1542,7 &#64;&#64; drmmode_handle_uevents(ScrnInfoPtr sc=
rn)
        if (!dev)
                return;

-       RRGetInfo(xf86ScrnToScreen(scrn), TRUE);
+       //RRGetInfo(xf86ScrnToScreen(scrn), TRUE);
        udev_device_unref(dev);
 }
 #endif

Otherwise - when I turn on the TV on other Xorg instance (with intel driver=
),
the xorg is crashing. Maybe nouveau is trying to do something wrong with the
randr event on other xorg instance?

It is now over a five months from the time when I reported it. Is it really=
 so
hard to cooperate with me to get rid of this bug? I can try your patches, g=
ive
you additional debug information, I have programming skills.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14907762272.c31BB5.13313--

--===============1987092192==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1987092192==--
