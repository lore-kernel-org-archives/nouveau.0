From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105344] Installation bug by video card modules
 conflict (nvidia GTX 950 M)
Date: Mon, 05 Mar 2018 17:28:17 +0000
Message-ID: <bug-105344-8800-uqH6bUzxH2@http.bugs.freedesktop.org/>
References: <bug-105344-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2144244848=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-105344-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2144244848==
Content-Type: multipart/alternative; boundary="15202708962.BE02aF.16142"
Content-Transfer-Encoding: 7bit


--15202708962.BE02aF.16142
Date: Mon, 5 Mar 2018 17:28:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105344

Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         QA Contact|mesa-dev-PD4FTy7X32lNgt0PjOBp9/rsn8yoX9R0@public.gmane.org |nouveau-PD4FTy7X32lNgt0PjOBp93rCq3LdnpKM@public.gmane.org
                   |org                         |rg
           Severity|blocker                     |normal
          Component|Other                       |Drivers/DRI/nouveau
           Assignee|mesa-dev-PD4FTy7X32lNgt0PjOBp9/rsn8yoX9R0@public.gmane.org |nouveau-PD4FTy7X32lNgt0PjOBp93rCq3LdnpKM@public.gmane.org
                   |org                         |rg

--- Comment #4 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Considering that nouveau.modeset=3D0 helps, I'm flipping this to component
nouveau. Feel free to revert.

> kernel is: 4.13.0-36-generic
> mesa: OpenGL version string: 3.0 Mesa 17.2.8
FWIW these two are EOL. You might want to try something newer.

> libdrm: could not find
> xf86-video-nouveau: could not find.
>=20
Exact names might differ across distros - please search carefully.

> ---------------------
>=20
> Follow the "kernel_log.txt" output:
>=20
Please make sure you _attach_ logs.

> [    1.333868] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at
> 612004 [ IBUS ]
> [    1.335248] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at
> 10ac08 [ IBUS ]

These two look mildly interesting. Not sure how much it matters sunce the
nvidia device is a 3D controller - there should be no outputs wired/plugged.

Potential next steps include:
 - using xserver or wayland - try the former
 - [it using xserver] - flip between the modesetting and nouveau DDX
 - attach the respective logs - xserver -> Xorg.*.log, wayland -> no idea w=
here
kwin puts it

If the above are cryptic, do read through the wikis/googleit ;-)

https://nouveau.freedesktop.org/wiki/
https://nouveau.freedesktop.org/wiki/Optimus/
https://wiki.archlinux.org/index.php/nouveau

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15202708962.BE02aF.16142
Date: Mon, 5 Mar 2018 17:28:16 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:emil.l.ve=
likov&#64;gmail.com" title=3D"Emil Velikov &lt;emil.l.velikov&#64;gmail.com=
&gt;"> <span class=3D"fn">Emil Velikov</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Installation bug by video card modules conflict (nvidia G=
TX 950 M)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105344">bug 10534=
4</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">QA Contact</td>
           <td>mesa-dev&#64;lists.freedesktop.org
           </td>
           <td>nouveau&#64;lists.freedesktop.org
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Severity</td>
           <td>blocker
           </td>
           <td>normal
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Component</td>
           <td>Other
           </td>
           <td>Drivers/DRI/nouveau
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Assignee</td>
           <td>mesa-dev&#64;lists.freedesktop.org
           </td>
           <td>nouveau&#64;lists.freedesktop.org
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Installation bug by video card modules conflict (nvidia G=
TX 950 M)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105344#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Installation bug by video card modules conflict (nvidia G=
TX 950 M)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105344">bug 10534=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
emil.l.velikov&#64;gmail.com" title=3D"Emil Velikov &lt;emil.l.velikov&#64;=
gmail.com&gt;"> <span class=3D"fn">Emil Velikov</span></a>
</span></b>
        <pre>Considering that nouveau.modeset=3D0 helps, I'm flipping this =
to component
nouveau. Feel free to revert.

<span class=3D"quote">&gt; kernel is: 4.13.0-36-generic
&gt; mesa: OpenGL version string: 3.0 Mesa 17.2.8</span >
FWIW these two are EOL. You might want to try something newer.

<span class=3D"quote">&gt; libdrm: could not find
&gt; xf86-video-nouveau: could not find.
&gt; </span >
Exact names might differ across distros - please search carefully.

<span class=3D"quote">&gt; ---------------------
&gt;=20
&gt; Follow the &quot;kernel_log.txt&quot; output:
&gt; </span >
Please make sure you _attach_ logs.

<span class=3D"quote">&gt; [    1.333868] nouveau 0000:01:00.0: bus: MMIO r=
ead of 00000000 FAULT at
&gt; 612004 [ IBUS ]
&gt; [    1.335248] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT =
at
&gt; 10ac08 [ IBUS ]</span >

These two look mildly interesting. Not sure how much it matters sunce the
nvidia device is a 3D controller - there should be no outputs wired/plugged.

Potential next steps include:
 - using xserver or wayland - try the former
 - [it using xserver] - flip between the modesetting and nouveau DDX
 - attach the respective logs - xserver -&gt; Xorg.*.log, wayland -&gt; no =
idea where
kwin puts it

If the above are cryptic, do read through the wikis/googleit ;-)

<a href=3D"https://nouveau.freedesktop.org/wiki/">https://nouveau.freedeskt=
op.org/wiki/</a>
<a href=3D"https://nouveau.freedesktop.org/wiki/Optimus/">https://nouveau.f=
reedesktop.org/wiki/Optimus/</a>
<a href=3D"https://wiki.archlinux.org/index.php/nouveau">https://wiki.archl=
inux.org/index.php/nouveau</a></pre>
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

--15202708962.BE02aF.16142--

--===============2144244848==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2144244848==--
