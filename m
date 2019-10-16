From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 111853] nouveau kernel module won't load (not
 available) on Sony laptop with NVIDIA G86M [GeForce 8400M GT] ID: 10de:0426
Date: Wed, 16 Oct 2019 16:44:08 +0000
Message-ID: <bug-111853-8800-86xfrJqcFE@http.bugs.freedesktop.org/>
References: <bug-111853-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0992839399=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-111853-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0992839399==
Content-Type: multipart/alternative; boundary="15712442480.7202099F.19628"
Content-Transfer-Encoding: 7bit


--15712442480.7202099F.19628
Date: Wed, 16 Oct 2019 16:44:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111853

--- Comment #10 from Felix Miata <mrmazda-ihVZJaRskl1bRRN4PJnoQQ@public.gmane.org> ---
Created attachment 145757
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145757&action=3Dedit
Xorg.0.log from live LMDE 2 Betsy boot

# uname -a
Linux stresslinux 2.6.37.6-0.5-default #1 SMP 2011-04-25 21:48:33 +0200 x86=
_64
x86_64 x86_64 GNU/Linux
# lsmod | sort | grep veau
button                  6797  1 nouveau
drm                   229676  3 nouveau,ttm,drm_kms_helper
drm_kms_helper         36630  1 nouveau
i2c_algo_bit            6342  1 nouveau
nouveau               678496  1=20
ttm                    72581  1 nouveau
video                  15865  1 nouveau

But Stresslinux 0.7.106 has no X :-(

# uname -a
Linux mint 3.16.0-4-amd64 #1 SMP Debian 3.16.7-ckt7-1 (2015-03-01) x86_64
GNU/Linux
# lsmod | sort | grep veau
button                 12944  1 nouveau
drm                   249955  3 ttm,drm_kms_helper,nouveau
drm_kms_helper         49210  1 nouveau
i2c_algo_bit           12751  1 nouveau
i2c_core               46012  7
drm,i2c_i801,drm_kms_helper,i2c_algo_bit,v4l2_common,nouveau,videodev
mxm_wmi                12515  1 nouveau
nouveau              1122419  0=20
ttm                    77862  1 nouveau
video                  18096  1 nouveau
wmi                    17339  2 mxm_wmi,nouveau
# inxi -GxxS
System:    Host: mint Kernel: 3.16.0-4-amd64 x86_64 (64 bit gcc: 4.8.4)
           Desktop: MATE 1.8.1 (Gtk 3.14.5+4) dm: mdm Distro: LinuxMint 2 b=
etsy
Graphics:  Card: NVIDIA G86M [GeForce 8400M GT] bus-ID: 01:00.0 chip-ID:
10de:0426
           Display Server: X.Org 1.16.4 drivers: fbdev,vesa,nouveau Resolut=
ion:
1024x768-0yhcPj3bK+8@public.gmane.org
           GLX Renderer: Gallium 0.4 on llvmpipe (LLVM 3.5, 128 bits)
           GLX Version: 3.0 Mesa 10.3.2 Direct Rendering: Yes

With this old live distro, nouveau loads, but there's no /dev/dri/card0 or
/dev/fb0, so it's stuck in VESA 1024x768.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15712442480.7202099F.19628
Date: Wed, 16 Oct 2019 16:44:08 +0000
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
   title=3D"NEW - nouveau kernel module won't load (not available) on Sony =
laptop with NVIDIA G86M [GeForce 8400M GT] ID: 10de:0426"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111853#c10">Comme=
nt # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nouveau kernel module won't load (not available) on Sony =
laptop with NVIDIA G86M [GeForce 8400M GT] ID: 10de:0426"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111853">bug 11185=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mrmazda&#64;earthlink.net" title=3D"Felix Miata &lt;mrmazda&#64;earthlink.n=
et&gt;"> <span class=3D"fn">Felix Miata</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145757=
" name=3D"attach_145757" title=3D"Xorg.0.log from live LMDE 2 Betsy boot">a=
ttachment 145757</a> <a href=3D"attachment.cgi?id=3D145757&amp;action=3Dedi=
t" title=3D"Xorg.0.log from live LMDE 2 Betsy boot">[details]</a></span>
Xorg.0.log from live LMDE 2 Betsy boot

# uname -a
Linux stresslinux 2.6.37.6-0.5-default #1 SMP 2011-04-25 21:48:33 +0200 x86=
_64
x86_64 x86_64 GNU/Linux
# lsmod | sort | grep veau
button                  6797  1 nouveau
drm                   229676  3 nouveau,ttm,drm_kms_helper
drm_kms_helper         36630  1 nouveau
i2c_algo_bit            6342  1 nouveau
nouveau               678496  1=20
ttm                    72581  1 nouveau
video                  15865  1 nouveau

But Stresslinux 0.7.106 has no X :-(

# uname -a
Linux mint 3.16.0-4-amd64 #1 SMP Debian 3.16.7-ckt7-1 (2015-03-01) x86_64
GNU/Linux
# lsmod | sort | grep veau
button                 12944  1 nouveau
drm                   249955  3 ttm,drm_kms_helper,nouveau
drm_kms_helper         49210  1 nouveau
i2c_algo_bit           12751  1 nouveau
i2c_core               46012  7
drm,i2c_i801,drm_kms_helper,i2c_algo_bit,v4l2_common,nouveau,videodev
mxm_wmi                12515  1 nouveau
nouveau              1122419  0=20
ttm                    77862  1 nouveau
video                  18096  1 nouveau
wmi                    17339  2 mxm_wmi,nouveau
# inxi -GxxS
System:    Host: mint Kernel: 3.16.0-4-amd64 x86_64 (64 bit gcc: 4.8.4)
           Desktop: MATE 1.8.1 (Gtk 3.14.5+4) dm: mdm Distro: LinuxMint 2 b=
etsy
Graphics:  Card: NVIDIA G86M [GeForce 8400M GT] bus-ID: 01:00.0 chip-ID:
10de:0426
           Display Server: X.Org 1.16.4 drivers: fbdev,vesa,nouveau Resolut=
ion:
<a href=3D"mailto:1024x768&#64;61.00hz">1024x768&#64;61.00hz</a>
           GLX Renderer: Gallium 0.4 on llvmpipe (LLVM 3.5, 128 bits)
           GLX Version: 3.0 Mesa 10.3.2 Direct Rendering: Yes

With this old live distro, nouveau loads, but there's no /dev/dri/card0 or
/dev/fb0, so it's stuck in VESA 1024x768.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15712442480.7202099F.19628--

--===============0992839399==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0992839399==--
