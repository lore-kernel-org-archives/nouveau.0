From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73200] vdpau-GL interop fails due to different
	screen objects
Date: Tue, 11 Feb 2014 10:43:36 +0000
Message-ID: <bug-73200-8800-jyop74JdaH@http.bugs.freedesktop.org/>
References: <bug-73200-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0045210890=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-73200-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0045210890==
Content-Type: multipart/alternative; boundary="1392115416.D36A757B1.18743"; charset="us-ascii"


--1392115416.D36A757B1.18743
Date: Tue, 11 Feb 2014 10:43:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73200

--- Comment #12 from Maarten Lankhorst <bugs-FcfepWsj2zOByvU0x3ry2g@public.gmane.org> ---
The patch from comment 8 applied on top of my patch should work in theory, if
the newly compiled nouveau_dri.so is also used. This is the whole reason for
nouveau_drm_screen_create being exported in VDPAU_EXPORTS from
src/gallium/targets/vdpau-nouveau. Both libs need to export
nouveau_drm_screen_create for this to work.

Looks like some debugging fun is required. :/ Is the correct nouveau_dri.so
picked up? You can check with LIBGL_DEBUG=verbose.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392115416.D36A757B1.18743
Date: Tue, 11 Feb 2014 10:43:36 +0000
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
   title="NEW --- - vdpau-GL interop fails due to different screen objects"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73200#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - vdpau-GL interop fails due to different screen objects"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73200">bug 73200</a>
              from <span class="vcard"><a class="email" href="mailto:bugs&#64;mblankhorst.nl" title="Maarten Lankhorst &lt;bugs&#64;mblankhorst.nl&gt;"> <span class="fn">Maarten Lankhorst</span></a>
</span></b>
        <pre>The patch from <a href="show_bug.cgi?id=73200#c8">comment 8</a> applied on top of my patch should work in theory, if
the newly compiled nouveau_dri.so is also used. This is the whole reason for
nouveau_drm_screen_create being exported in VDPAU_EXPORTS from
src/gallium/targets/vdpau-nouveau. Both libs need to export
nouveau_drm_screen_create for this to work.

Looks like some debugging fun is required. :/ Is the correct nouveau_dri.so
picked up? You can check with LIBGL_DEBUG=verbose.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392115416.D36A757B1.18743--

--===============0045210890==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0045210890==--
