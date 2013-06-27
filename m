From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 66255] Enabling Xinerama with nouveau driver causes
 Segmentation fault
Date: Thu, 27 Jun 2013 13:40:24 +0000
Message-ID: <bug-66255-8800-ATVllQu3qe@http.bugs.freedesktop.org/>
References: <bug-66255-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0470491114=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-66255-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0470491114==
Content-Type: multipart/alternative; boundary="1372340424.e1ca4CD52.18022"; charset="us-ascii"


--1372340424.e1ca4CD52.18022
Date: Thu, 27 Jun 2013 13:40:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=66255

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Based on the backtrace, I think this is similar to bug #62914 -- try just
commenting out the offending lines from the xf86-video-nouveau driver, i.e.
something like

diff --git a/src/drmmode_display.c b/src/drmmode_display.c
index b9b7164..8d782d3 100644
--- a/src/drmmode_display.c
+++ b/src/drmmode_display.c
@@ -346,11 +346,13 @@ drmmode_set_mode_major(xf86CrtcPtr crtc, DisplayModePtr
mode,
        drmmode_ConvertToKMode(crtc->scrn, &kmode, mode);

        fb_id = drmmode->fb_id;
+/*
 #ifdef NOUVEAU_PIXMAP_SHARING
        if (crtc->randr_crtc->scanout_pixmap)
                x = y = 0;
        else
 #endif
+*/
        if (drmmode_crtc->rotate_fb_id) {
                fb_id = drmmode_crtc->rotate_fb_id;
                x = 0;

You may also want to upgrade to 1.0.8 -- that has some zaphod-related fixes, I
think. (You're not enabling ZaphodHeads -- I think you should be, unless you're
only using a single monitor per video card.)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1372340424.e1ca4CD52.18022
Date: Thu, 27 Jun 2013 13:40:24 +0000
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
   title="NEW --- - Enabling Xinerama with nouveau driver causes Segmentation fault"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66255#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Enabling Xinerama with nouveau driver causes Segmentation fault"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66255">bug 66255</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Based on the backtrace, I think this is similar to <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - ZaphodHeads doesn't work after upgrading to xorg 1.14"
   href="show_bug.cgi?id=62914">bug #62914</a> -- try just
commenting out the offending lines from the xf86-video-nouveau driver, i.e.
something like

diff --git a/src/drmmode_display.c b/src/drmmode_display.c
index b9b7164..8d782d3 100644
--- a/src/drmmode_display.c
+++ b/src/drmmode_display.c
&#64;&#64; -346,11 +346,13 &#64;&#64; drmmode_set_mode_major(xf86CrtcPtr crtc, DisplayModePtr
mode,
        drmmode_ConvertToKMode(crtc-&gt;scrn, &amp;kmode, mode);

        fb_id = drmmode-&gt;fb_id;
+/*
 #ifdef NOUVEAU_PIXMAP_SHARING
        if (crtc-&gt;randr_crtc-&gt;scanout_pixmap)
                x = y = 0;
        else
 #endif
+*/
        if (drmmode_crtc-&gt;rotate_fb_id) {
                fb_id = drmmode_crtc-&gt;rotate_fb_id;
                x = 0;

You may also want to upgrade to 1.0.8 -- that has some zaphod-related fixes, I
think. (You're not enabling ZaphodHeads -- I think you should be, unless you're
only using a single monitor per video card.)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1372340424.e1ca4CD52.18022--

--===============0470491114==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0470491114==--
