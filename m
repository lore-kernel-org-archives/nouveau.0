From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92307] G98/GM206: WARNING: ... at
 include/drm/drm_crtc.h:1577 drm_helper_choose_encoder_dpms+0x8a/0x90
 [drm_kms_helper]()
Date: Tue, 15 Dec 2015 16:54:30 +0000
Message-ID: <bug-92307-8800-Z6f7xvYKl1@http.bugs.freedesktop.org/>
References: <bug-92307-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1499493659=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92307-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1499493659==
Content-Type: multipart/alternative; boundary="1450198470.78Fa42.32166"; charset="UTF-8"


--1450198470.78Fa42.32166
Date: Tue, 15 Dec 2015 16:54:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92307

--- Comment #26 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---

When engaged, Xfwm4 GL compositor with XPresent VSync
$ XFWM4_USE_PRESENT=1 xfwm4
xrandr related problemos(--off/--auto/--rotate) start with this particular
commita
"enable dri3 support without glamor"
http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/commit/?id=241e728

With the former commita, which works OK
http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/commit/?id=762b22f
while "xrandr-ing", there is no warning in the kernel ring buffer, whatsoever.
Still, SEGV catches xfdesktop.

Yet with commita 762b22f, while S3 RESUME, warnings are still occurring,
very persistent, aye. :)


In contrast, when engaged, Xfwm4 GL compositor with default VSync,
xrandr related problemos(--off/--auto/--rotate) are "all the way",
at least I have tested from xf86-video-nouveau-1.0.3 up to the latest,
xf86-video-nouveau-1.0.12.
So there is no love there at all.

I wonder whether this problemo is comparable to one occurs with the
clutter/mutter/gnome-shell
https://bugzilla.gnome.org/buglist.cgi?quicksearch=meta_monitor_manager_xrandr_handle_xevent
https://bugzilla.redhat.com/buglist.cgi?quicksearch=meta_monitor_manager_xrandr_handle_xevent

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1450198470.78Fa42.32166
Date: Tue, 15 Dec 2015 16:54:30 +0000
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
   title="NEW - G98/GM206: WARNING: ... at include/drm/drm_crtc.h:1577 drm_helper_choose_encoder_dpms+0x8a/0x90 [drm_kms_helper]()"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92307#c26">Comment # 26</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - G98/GM206: WARNING: ... at include/drm/drm_crtc.h:1577 drm_helper_choose_encoder_dpms+0x8a/0x90 [drm_kms_helper]()"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92307">bug 92307</a>
              from <span class="vcard"><a class="email" href="mailto:pomidorabelisima&#64;gmail.com" title="poma &lt;pomidorabelisima&#64;gmail.com&gt;"> <span class="fn">poma</span></a>
</span></b>
        <pre>
When engaged, Xfwm4 GL compositor with XPresent VSync
$ XFWM4_USE_PRESENT=1 xfwm4
xrandr related problemos(--off/--auto/--rotate) start with this particular
commita
&quot;enable dri3 support without glamor&quot;
<a href="http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/commit/?id=241e728">http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/commit/?id=241e728</a>

With the former commita, which works OK
<a href="http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/commit/?id=762b22f">http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/commit/?id=762b22f</a>
while &quot;xrandr-ing&quot;, there is no warning in the kernel ring buffer, whatsoever.
Still, SEGV catches xfdesktop.

Yet with commita 762b22f, while S3 RESUME, warnings are still occurring,
very persistent, aye. :)


In contrast, when engaged, Xfwm4 GL compositor with default VSync,
xrandr related problemos(--off/--auto/--rotate) are &quot;all the way&quot;,
at least I have tested from xf86-video-nouveau-1.0.3 up to the latest,
xf86-video-nouveau-1.0.12.
So there is no love there at all.

I wonder whether this problemo is comparable to one occurs with the
clutter/mutter/gnome-shell
<a href="https://bugzilla.gnome.org/buglist.cgi?quicksearch=meta_monitor_manager_xrandr_handle_xevent">https://bugzilla.gnome.org/buglist.cgi?quicksearch=meta_monitor_manager_xrandr_handle_xevent</a>
<a href="https://bugzilla.redhat.com/buglist.cgi?quicksearch=meta_monitor_manager_xrandr_handle_xevent">https://bugzilla.redhat.com/buglist.cgi?quicksearch=meta_monitor_manager_xrandr_handle_xevent</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1450198470.78Fa42.32166--

--===============1499493659==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1499493659==--
