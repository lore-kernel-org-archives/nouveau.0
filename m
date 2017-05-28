From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101199] nouveau_screen.c: undefined reference to
 `nouveau_drm_del'
Date: Sun, 28 May 2017 03:41:38 +0000
Message-ID: <bug-101199-8800-bAKovzLBnI@http.bugs.freedesktop.org/>
References: <bug-101199-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0532870500=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-101199-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0532870500==
Content-Type: multipart/alternative; boundary="14959428980.a1f7.11085";
 charset="UTF-8"


--14959428980.a1f7.11085
Date: Sun, 28 May 2017 03:41:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101199

Andrey <andrewponomarenko-o+MxOtu4lMCHXe+LvDLADg@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         QA Contact|nouveau-PD4FTy7X32lNgt0PjOBp93rCq3LdnpKM@public.gmane.org |mesa-dev-PD4FTy7X32lNgt0PjOBp9/rsn8yoX9R0@public.gmane.org
                   |rg                          |org
         Resolution|NOTOURBUG                   |---
             Status|RESOLVED                    |REOPENED
           Assignee|nouveau-PD4FTy7X32lNgt0PjOBp93rCq3LdnpKM@public.gmane.org |mesa-dev-PD4FTy7X32lNgt0PjOBp9/rsn8yoX9R0@public.gmane.org
                   |rg                          |org
          Component|Drivers/DRI/nouveau         |Other

--- Comment #4 from Andrey <andrewponomarenko-o+MxOtu4lMCHXe+LvDLADg@public.gmane.org> ---
This is an issue with the Mesa build system. The configure script should ch=
oose
right libdrm from PKG_CONFIG_PATH specified.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14959428980.a1f7.11085
Date: Sun, 28 May 2017 03:41:38 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:andrewpon=
omarenko&#64;yandex.ru" title=3D"Andrey &lt;andrewponomarenko&#64;yandex.ru=
&gt;"> <span class=3D"fn">Andrey</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - nouveau_screen.c: undefined reference to `nouveau_dr=
m_del'"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101199">bug 10119=
9</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">QA Contact</td>
           <td>nouveau&#64;lists.freedesktop.org
           </td>
           <td>mesa-dev&#64;lists.freedesktop.org
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>NOTOURBUG
           </td>
           <td>---
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>RESOLVED
           </td>
           <td>REOPENED
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Assignee</td>
           <td>nouveau&#64;lists.freedesktop.org
           </td>
           <td>mesa-dev&#64;lists.freedesktop.org
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Component</td>
           <td>Drivers/DRI/nouveau
           </td>
           <td>Other
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - nouveau_screen.c: undefined reference to `nouveau_dr=
m_del'"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101199#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - nouveau_screen.c: undefined reference to `nouveau_dr=
m_del'"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101199">bug 10119=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
andrewponomarenko&#64;yandex.ru" title=3D"Andrey &lt;andrewponomarenko&#64;=
yandex.ru&gt;"> <span class=3D"fn">Andrey</span></a>
</span></b>
        <pre>This is an issue with the Mesa build system. The configure scr=
ipt should choose
right libdrm from PKG_CONFIG_PATH specified.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--14959428980.a1f7.11085--

--===============0532870500==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0532870500==--
