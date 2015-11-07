From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92852] NV34: WARNING: ... at
 drivers/gpu/drm/drm_irq.c:924 drm_vblank_count_and_time+0x71/0x80 [drm]()
Date: Sat, 07 Nov 2015 05:26:14 +0000
Message-ID: <bug-92852-8800-TDM8CDtr7d@http.bugs.freedesktop.org/>
References: <bug-92852-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1982143876=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92852-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1982143876==
Content-Type: multipart/alternative; boundary="1446873974.217FBB1.25857"; charset="UTF-8"


--1446873974.217FBB1.25857
Date: Sat, 7 Nov 2015 05:26:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92852

--- Comment #3 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---

SW:
kernel-core-4.3.0-1.fc24.i686
libdrm-2.4.61-3.fc22.i686
xorg-x11-server-Xorg-1.17.4-1.fc22.i686
xorg-x11-drv-nouveau-1.0.12-0.3.fc22.i686
mesa-dri-drivers-10.6.9-1.20151008.fc22.i686

&

Xfwm4 from git commit:
"compositor: Fix GL without ARB_texture_rectangle"
http://git.xfce.org/xfce/xfwm4/commit/?id=2cfac64

Both, DRI3/XPresent and GLX, use_compositing true,

- DRI3/XPresent - configure --disable-epoxy --enable-xpresent
   Build Configuration for xfwm4:
     Xpresent support:             yes
     Epoxy support:                no

- GLX - configure --disable-xpresent --enable-epoxy
   Build Configuration for xfwm4:
     Xpresent support:             no
     Epoxy support:                yes

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1446873974.217FBB1.25857
Date: Sat, 7 Nov 2015 05:26:14 +0000
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
   title="NEW - NV34: WARNING: ... at drivers/gpu/drm/drm_irq.c:924 drm_vblank_count_and_time+0x71/0x80 [drm]()"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92852#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - NV34: WARNING: ... at drivers/gpu/drm/drm_irq.c:924 drm_vblank_count_and_time+0x71/0x80 [drm]()"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92852">bug 92852</a>
              from <span class="vcard"><a class="email" href="mailto:pomidorabelisima&#64;gmail.com" title="poma &lt;pomidorabelisima&#64;gmail.com&gt;"> <span class="fn">poma</span></a>
</span></b>
        <pre>
SW:
kernel-core-4.3.0-1.fc24.i686
libdrm-2.4.61-3.fc22.i686
xorg-x11-server-Xorg-1.17.4-1.fc22.i686
xorg-x11-drv-nouveau-1.0.12-0.3.fc22.i686
mesa-dri-drivers-10.6.9-1.20151008.fc22.i686

&amp;

Xfwm4 from git commit:
&quot;compositor: Fix GL without ARB_texture_rectangle&quot;
<a href="http://git.xfce.org/xfce/xfwm4/commit/?id=2cfac64">http://git.xfce.org/xfce/xfwm4/commit/?id=2cfac64</a>

Both, DRI3/XPresent and GLX, use_compositing true,

- DRI3/XPresent - configure --disable-epoxy --enable-xpresent
   Build Configuration for xfwm4:
     Xpresent support:             yes
     Epoxy support:                no

- GLX - configure --disable-xpresent --enable-epoxy
   Build Configuration for xfwm4:
     Xpresent support:             no
     Epoxy support:                yes</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1446873974.217FBB1.25857--

--===============1982143876==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1982143876==--
