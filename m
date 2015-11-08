From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92851] NV34: err: MEM_FAULT
Date: Sun, 08 Nov 2015 00:09:21 +0000
Message-ID: <bug-92851-8800-vGPDgwZkOs@http.bugs.freedesktop.org/>
References: <bug-92851-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0550075681=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92851-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0550075681==
Content-Type: multipart/alternative; boundary="1446941361.cbBD61.31427"; charset="UTF-8"


--1446941361.cbBD61.31427
Date: Sun, 8 Nov 2015 00:09:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92851

--- Comment #7 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---

[  401.172019] nouveau 0000:01:00.0: Xorg[503]: failed to idle channel
0xcccc0000 [Xorg[503]]
[  416.216018] nouveau 0000:01:00.0: Xorg[503]: failed to idle channel
0xcccc0000 [Xorg[503]]
[  431.445021] nouveau 0000:01:00.0: Xorg[503]: failed to idle channel
0xcccc0000 [Xorg[503]]
[  447.055020] nouveau 0000:01:00.0: Xorg[503]: failed to idle channel
0xcccc0000 [Xorg[503]]
[  448.789178] nouveau 0000:01:00.0: DRM: 0xDBBA: Parsing digital output script
table
[  451.068014] nouveau 0000:01:00.0: DRM: 0xDB7C: Parsing digital output script
table
[  451.070018] nouveau 0000:01:00.0: DRM: GPU lockup - switching to software
fbcon
[  460.407565] nouveau 0000:01:00.0: DRM: 0xDBBA: Parsing digital output script
table
[  463.793408] nouveau 0000:01:00.0: gr: intr 00000080 [] nsource 00000000 []
nstatus 00000000 [] ch 1 [Xorg[1358]] subc 0 class 0039 mthd 0100 data 00000000


[  419.496266] nouveau 0000:01:00.0: DRM: 0xDB7C: Parsing digital output script
table
[  422.236361] nouveau 0000:01:00.0: DRM: 0xDBBA: Parsing digital output script
table
[  477.174546] nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 1 [Xorg[1256]] subc
6 mthd 0000 data 80000013
[  477.174669] nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 1 [Xorg[1256]] subc
0 mthd 0184 data beef0202
[  477.174716] nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 1 [Xorg[1256]] subc
0 mthd 0188 data beef0201
[  477.174742] nouveau 0000:01:00.0: gr: intr 00100000 [ERROR] nsource 00000100
[DMA_W_PROTECTION] nstatus 04000000 [PROTECTION_FAULT] ch 1 [Xorg[1256]] subc 0
class 0039 mthd 0100 data 00000000
[  550.525020] nouveau 0000:01:00.0: Xorg[1256]: failed to idle channel
0xcccc0000 [Xorg[1256]]
[  550.785195] nouveau 0000:01:00.0: timeout at
drivers/gpu/drm/nouveau/nvkm/engine/gr/nv20.c:46/nv20_gr_chan_fini()!
[  565.785019] nouveau 0000:01:00.0: Xorg[1256]: failed to idle channel
0xcccc0000 [Xorg[1256]]
[  566.052328] nouveau 0000:01:00.0: DRM: 0xDB7C: Parsing digital output script
table
[  566.141817] nouveau 0000:01:00.0: DRM: GPU lockup - switching to software
fbcon
[  598.394019] nouveau 0000:01:00.0: timeout at
drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.c:1223/nv04_gr_idle()!
[  598.394019] nouveau 0000:01:00.0: gr: idle timed out with status 00023001
[  598.724013] nouveau 0000:01:00.0: timeout at
drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.c:1223/nv04_gr_idle()!
[  598.724013] nouveau 0000:01:00.0: gr: idle timed out with status 00023001
[  645.989021] nouveau 0000:01:00.0: Xorg[1667]: failed to idle channel
0xcccc0001 [Xorg[1667]]
[  660.995020] nouveau 0000:01:00.0: Xorg[1667]: failed to idle channel
0xcccc0001 [Xorg[1667]]
[  661.005399] nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 1 [Xorg[1667]] subc
2 mthd 0000 data 80000010
[  661.005430] nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 1 [Xorg[1667]] subc
2 mthd 0180 data 00000000
[  661.005453] nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 1 [Xorg[1667]] subc
2 mthd 0184 data beef0201
[  661.005474] nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 1 [Xorg[1667]] subc
2 mthd 0188 data beef0201
[  676.005020] nouveau 0000:01:00.0: Xorg[1667]: failed to idle channel
0xcccc0000 [Xorg[1667]]
[  691.016020] nouveau 0000:01:00.0: Xorg[1667]: failed to idle channel
0xcccc0000 [Xorg[1667]]
[  691.501018] nouveau 0000:01:00.0: timeout at
drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.c:1223/nv04_gr_idle()!
[  691.501018] nouveau 0000:01:00.0: gr: idle timed out with status 00023001
[  691.813010] nouveau 0000:01:00.0: timeout at
drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.c:1223/nv04_gr_idle()!
[  691.813010] nouveau 0000:01:00.0: gr: idle timed out with status 00023001
[  724.639020] nouveau 0000:01:00.0: Xorg[1758]: failed to idle channel
0xcccc0001 [Xorg[1758]]
[  739.645018] nouveau 0000:01:00.0: Xorg[1758]: failed to idle channel
0xcccc0001 [Xorg[1758]]
[  739.656336] nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 1 [Xorg[1758]] subc
2 mthd 0000 data 80000010
[  739.656368] nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 1 [Xorg[1758]] subc
2 mthd 0180 data 00000000
[  739.656392] nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 1 [Xorg[1758]] subc
2 mthd 0184 data beef0201
[  739.656414] nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 1 [Xorg[1758]] subc
2 mthd 0188 data beef0201
[  754.656018] nouveau 0000:01:00.0: Xorg[1758]: failed to idle channel
0xcccc0000 [Xorg[1758]]
[  769.663020] nouveau 0000:01:00.0: Xorg[1758]: failed to idle channel
0xcccc0000 [Xorg[1758]]
[  778.844018] nouveau 0000:01:00.0: timeout at
drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.c:1223/nv04_gr_idle()!
[  778.844018] nouveau 0000:01:00.0: gr: idle timed out with status 00023001
[  779.158005] nouveau 0000:01:00.0: timeout at
drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.c:1223/nv04_gr_idle()!
[  779.158005] nouveau 0000:01:00.0: gr: idle timed out with status 00023001
[  823.785020] nouveau 0000:01:00.0: Xorg[1925]: failed to idle channel
0xcccc0001 [Xorg[1925]]
[  838.789019] nouveau 0000:01:00.0: Xorg[1925]: failed to idle channel
0xcccc0001 [Xorg[1925]]
[  839.101568] nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 1 [Xorg[1925]] subc
2 mthd 0000 data 80000010
[  839.101599] nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 1 [Xorg[1925]] subc
2 mthd 0180 data 00000000
[  839.101622] nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 1 [Xorg[1925]] subc
2 mthd 0184 data beef0201
[  839.101643] nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 1 [Xorg[1925]] subc
2 mthd 0188 data beef0201
[  854.101015] nouveau 0000:01:00.0: Xorg[1925]: failed to idle channel
0xcccc0000 [Xorg[1925]]
[  869.107021] nouveau 0000:01:00.0: Xorg[1925]: failed to idle channel
0xcccc0000 [Xorg[1925]]
[  869.596017] nouveau 0000:01:00.0: timeout at
drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.c:1223/nv04_gr_idle()!
[  869.596017] nouveau 0000:01:00.0: gr: idle timed out with status 00023001
[  869.909003] nouveau 0000:01:00.0: timeout at
drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.c:1223/nv04_gr_idle()!
[  869.909003] nouveau 0000:01:00.0: gr: idle timed out with status 00023001


SW:
kernel-core-4.3.0-2.fc22.i686
xorg-x11-server-Xorg-1.18.0-0.6.20151027.fc22.i686
xorg-x11-drv-nouveau-1.0.12-0.4.fc22.i686
mesa-dri-drivers-11.1.0-0.devel.13.5ae37ae.fc22.i686
libdrm-2.4.65-1.fc22.i686
libepoxy-1.3.1-0.1.20150929gitb3b8bd9.fc22.i686
libXpresent-1.0.0-1.fc22.i686
xfwm4-4.12.3-17.2.glx.git20151106.fc22.i686
xfwm4-4.12.3-17.1.xpresent.nv34.git20151106.fc22.i686

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1446941361.cbBD61.31427
Date: Sun, 8 Nov 2015 00:09:21 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - NV34: err: MEM_FAULT"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92851#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - NV34: err: MEM_FAULT"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92851">bug 92851</a>
              from <span class="vcard"><a class="email" href="mailto:pomidorabelisima&#64;gmail.com" title="poma &lt;pomidorabelisima&#64;gmail.com&gt;"> <span class="fn">poma</span></a>
</span></b>
        <pre>
[  401.172019] nouveau 0000:01:00.0: Xorg[503]: failed to idle channel
0xcccc0000 [Xorg[503]]
[  416.216018] nouveau 0000:01:00.0: Xorg[503]: failed to idle channel
0xcccc0000 [Xorg[503]]
[  431.445021] nouveau 0000:01:00.0: Xorg[503]: failed to idle channel
0xcccc0000 [Xorg[503]]
[  447.055020] nouveau 0000:01:00.0: Xorg[503]: failed to idle channel
0xcccc0000 [Xorg[503]]
[  448.789178] nouveau 0000:01:00.0: DRM: 0xDBBA: Parsing digital output script
table
[  451.068014] nouveau 0000:01:00.0: DRM: 0xDB7C: Parsing digital output script
table
[  451.070018] nouveau 0000:01:00.0: DRM: GPU lockup - switching to software
fbcon
[  460.407565] nouveau 0000:01:00.0: DRM: 0xDBBA: Parsing digital output script
table
[  463.793408] nouveau 0000:01:00.0: gr: intr 00000080 [] nsource 00000000 []
nstatus 00000000 [] ch 1 [Xorg[1358]] subc 0 class 0039 mthd 0100 data 00000000


[  419.496266] nouveau 0000:01:00.0: DRM: 0xDB7C: Parsing digital output script
table
[  422.236361] nouveau 0000:01:00.0: DRM: 0xDBBA: Parsing digital output script
table
[  477.174546] nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 1 [Xorg[1256]] subc
6 mthd 0000 data 80000013
[  477.174669] nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 1 [Xorg[1256]] subc
0 mthd 0184 data beef0202
[  477.174716] nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 1 [Xorg[1256]] subc
0 mthd 0188 data beef0201
[  477.174742] nouveau 0000:01:00.0: gr: intr 00100000 [ERROR] nsource 00000100
[DMA_W_PROTECTION] nstatus 04000000 [PROTECTION_FAULT] ch 1 [Xorg[1256]] subc 0
class 0039 mthd 0100 data 00000000
[  550.525020] nouveau 0000:01:00.0: Xorg[1256]: failed to idle channel
0xcccc0000 [Xorg[1256]]
[  550.785195] nouveau 0000:01:00.0: timeout at
drivers/gpu/drm/nouveau/nvkm/engine/gr/nv20.c:46/nv20_gr_chan_fini()!
[  565.785019] nouveau 0000:01:00.0: Xorg[1256]: failed to idle channel
0xcccc0000 [Xorg[1256]]
[  566.052328] nouveau 0000:01:00.0: DRM: 0xDB7C: Parsing digital output script
table
[  566.141817] nouveau 0000:01:00.0: DRM: GPU lockup - switching to software
fbcon
[  598.394019] nouveau 0000:01:00.0: timeout at
drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.c:1223/nv04_gr_idle()!
[  598.394019] nouveau 0000:01:00.0: gr: idle timed out with status 00023001
[  598.724013] nouveau 0000:01:00.0: timeout at
drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.c:1223/nv04_gr_idle()!
[  598.724013] nouveau 0000:01:00.0: gr: idle timed out with status 00023001
[  645.989021] nouveau 0000:01:00.0: Xorg[1667]: failed to idle channel
0xcccc0001 [Xorg[1667]]
[  660.995020] nouveau 0000:01:00.0: Xorg[1667]: failed to idle channel
0xcccc0001 [Xorg[1667]]
[  661.005399] nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 1 [Xorg[1667]] subc
2 mthd 0000 data 80000010
[  661.005430] nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 1 [Xorg[1667]] subc
2 mthd 0180 data 00000000
[  661.005453] nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 1 [Xorg[1667]] subc
2 mthd 0184 data beef0201
[  661.005474] nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 1 [Xorg[1667]] subc
2 mthd 0188 data beef0201
[  676.005020] nouveau 0000:01:00.0: Xorg[1667]: failed to idle channel
0xcccc0000 [Xorg[1667]]
[  691.016020] nouveau 0000:01:00.0: Xorg[1667]: failed to idle channel
0xcccc0000 [Xorg[1667]]
[  691.501018] nouveau 0000:01:00.0: timeout at
drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.c:1223/nv04_gr_idle()!
[  691.501018] nouveau 0000:01:00.0: gr: idle timed out with status 00023001
[  691.813010] nouveau 0000:01:00.0: timeout at
drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.c:1223/nv04_gr_idle()!
[  691.813010] nouveau 0000:01:00.0: gr: idle timed out with status 00023001
[  724.639020] nouveau 0000:01:00.0: Xorg[1758]: failed to idle channel
0xcccc0001 [Xorg[1758]]
[  739.645018] nouveau 0000:01:00.0: Xorg[1758]: failed to idle channel
0xcccc0001 [Xorg[1758]]
[  739.656336] nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 1 [Xorg[1758]] subc
2 mthd 0000 data 80000010
[  739.656368] nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 1 [Xorg[1758]] subc
2 mthd 0180 data 00000000
[  739.656392] nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 1 [Xorg[1758]] subc
2 mthd 0184 data beef0201
[  739.656414] nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 1 [Xorg[1758]] subc
2 mthd 0188 data beef0201
[  754.656018] nouveau 0000:01:00.0: Xorg[1758]: failed to idle channel
0xcccc0000 [Xorg[1758]]
[  769.663020] nouveau 0000:01:00.0: Xorg[1758]: failed to idle channel
0xcccc0000 [Xorg[1758]]
[  778.844018] nouveau 0000:01:00.0: timeout at
drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.c:1223/nv04_gr_idle()!
[  778.844018] nouveau 0000:01:00.0: gr: idle timed out with status 00023001
[  779.158005] nouveau 0000:01:00.0: timeout at
drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.c:1223/nv04_gr_idle()!
[  779.158005] nouveau 0000:01:00.0: gr: idle timed out with status 00023001
[  823.785020] nouveau 0000:01:00.0: Xorg[1925]: failed to idle channel
0xcccc0001 [Xorg[1925]]
[  838.789019] nouveau 0000:01:00.0: Xorg[1925]: failed to idle channel
0xcccc0001 [Xorg[1925]]
[  839.101568] nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 1 [Xorg[1925]] subc
2 mthd 0000 data 80000010
[  839.101599] nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 1 [Xorg[1925]] subc
2 mthd 0180 data 00000000
[  839.101622] nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 1 [Xorg[1925]] subc
2 mthd 0184 data beef0201
[  839.101643] nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 1 [Xorg[1925]] subc
2 mthd 0188 data beef0201
[  854.101015] nouveau 0000:01:00.0: Xorg[1925]: failed to idle channel
0xcccc0000 [Xorg[1925]]
[  869.107021] nouveau 0000:01:00.0: Xorg[1925]: failed to idle channel
0xcccc0000 [Xorg[1925]]
[  869.596017] nouveau 0000:01:00.0: timeout at
drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.c:1223/nv04_gr_idle()!
[  869.596017] nouveau 0000:01:00.0: gr: idle timed out with status 00023001
[  869.909003] nouveau 0000:01:00.0: timeout at
drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.c:1223/nv04_gr_idle()!
[  869.909003] nouveau 0000:01:00.0: gr: idle timed out with status 00023001


SW:
kernel-core-4.3.0-2.fc22.i686
xorg-x11-server-Xorg-1.18.0-0.6.20151027.fc22.i686
xorg-x11-drv-nouveau-1.0.12-0.4.fc22.i686
mesa-dri-drivers-11.1.0-0.devel.13.5ae37ae.fc22.i686
libdrm-2.4.65-1.fc22.i686
libepoxy-1.3.1-0.1.20150929gitb3b8bd9.fc22.i686
libXpresent-1.0.0-1.fc22.i686
xfwm4-4.12.3-17.2.glx.git20151106.fc22.i686
xfwm4-4.12.3-17.1.xpresent.nv34.git20151106.fc22.i686</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1446941361.cbBD61.31427--

--===============0550075681==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0550075681==--
