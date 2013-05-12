From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64488] 3.10.0-rc1: WARNING: at
 drivers/gpu/drm/drm_crtc.c:84 drm_fb_helper_restore_fbdev_mode+0x10/0x40()
Date: Sun, 12 May 2013 10:40:57 +0000
Message-ID: <bug-64488-8800-PRBqXXBqxO@http.bugs.freedesktop.org/>
References: <bug-64488-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1585861638=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-64488-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1585861638==
Content-Type: multipart/alternative; boundary="1368355257.DeFaf4d2.18929"; charset="us-ascii"


--1368355257.DeFaf4d2.18929
Date: Sun, 12 May 2013 10:40:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=64488

--- Comment #1 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi Ronald

Similar/same case was reported on dri-devel, and the patch [1] has not hit
upstream. Can you give it a try


[1] http://lists.freedesktop.org/archives/dri-devel/2013-May/038164.html

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1368355257.DeFaf4d2.18929
Date: Sun, 12 May 2013 10:40:57 +0000
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
   title="NEW --- - 3.10.0-rc1: WARNING: at drivers/gpu/drm/drm_crtc.c:84 drm_fb_helper_restore_fbdev_mode+0x10/0x40()"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64488#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - 3.10.0-rc1: WARNING: at drivers/gpu/drm/drm_crtc.c:84 drm_fb_helper_restore_fbdev_mode+0x10/0x40()"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64488">bug 64488</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Hi Ronald

Similar/same case was reported on dri-devel, and the patch [1] has not hit
upstream. Can you give it a try


[1] <a href="http://lists.freedesktop.org/archives/dri-devel/2013-May/038164.html">http://lists.freedesktop.org/archives/dri-devel/2013-May/038164.html</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1368355257.DeFaf4d2.18929--

--===============1585861638==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1585861638==--
