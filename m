From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74992] [NVAA] gnome-shell freezes with vram_list
 validate fail, texture traps
Date: Sat, 24 May 2014 12:15:33 +0000
Message-ID: <bug-74992-8800-VSk3Bz9Ees@http.bugs.freedesktop.org/>
References: <bug-74992-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0999793093=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-74992-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0999793093==
Content-Type: multipart/alternative; boundary="1400933733.001d2.9277"; charset="us-ascii"


--1400933733.001d2.9277
Date: Sat, 24 May 2014 12:15:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D74992

--- Comment #8 from Martin Luke=C5=A1 <martin.meridius-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
So I resigned on using Nouveau and went back to nVidia, specially its 304xx
version on Arch Linux.=20

local/lib32-libcl 1.1-1
local/lib32-libvdpau 0.7-2
local/lib32-nvidia-304xx-libgl 304.121-2
local/lib32-nvidia-304xx-utils 304.121-2
local/lib32-opencl-nvidia 337.19-1
local/libcl 1.1-3
local/libvdpau 0.7-1
local/nvidia-304xx 304.121-3
local/nvidia-304xx-libgl 304.121-2
local/nvidia-304xx-utils 304.121-2
local/opencl-nvidia 337.19-1


I'm also using these Mesa libs:
local/glu 9.0.0-2
local/lib32-glu 9.0.0-2
local/lib32-mesa 10.1.3-1
local/lib32-mesa-demos 8.1.0-3
local/mesa 10.1.3-1
local/mesa-demos 8.1.0-2

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1400933733.001d2.9277
Date: Sat, 24 May 2014 12:15:33 +0000
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
   title=3D"NEW --- - [NVAA] gnome-shell freezes with vram_list validate fa=
il, texture traps"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D74992#c8">Comment=
 # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NVAA] gnome-shell freezes with vram_list validate fa=
il, texture traps"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D74992">bug 74992<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
martin.meridius&#64;gmail.com" title=3D"Martin Luke=C5=A1 &lt;martin.meridi=
us&#64;gmail.com&gt;"> <span class=3D"fn">Martin Luke=C5=A1</span></a>
</span></b>
        <pre>So I resigned on using Nouveau and went back to nVidia, specia=
lly its 304xx
version on Arch Linux.=20

local/lib32-libcl 1.1-1
local/lib32-libvdpau 0.7-2
local/lib32-nvidia-304xx-libgl 304.121-2
local/lib32-nvidia-304xx-utils 304.121-2
local/lib32-opencl-nvidia 337.19-1
local/libcl 1.1-3
local/libvdpau 0.7-1
local/nvidia-304xx 304.121-3
local/nvidia-304xx-libgl 304.121-2
local/nvidia-304xx-utils 304.121-2
local/opencl-nvidia 337.19-1


I'm also using these Mesa libs:
local/glu 9.0.0-2
local/lib32-glu 9.0.0-2
local/lib32-mesa 10.1.3-1
local/lib32-mesa-demos 8.1.0-3
local/mesa 10.1.3-1
local/mesa-demos 8.1.0-2</pre>
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

--1400933733.001d2.9277--

--===============0999793093==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0999793093==--
