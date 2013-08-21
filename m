From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 31961] [NV4E] [drm:drm_crtc_helper_set_config]
 *ERROR* failed to set mode on [CRTC:6]
Date: Wed, 21 Aug 2013 08:10:42 +0000
Message-ID: <bug-31961-8800-Cxuu2ccSPU@http.bugs.freedesktop.org/>
References: <bug-31961-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1345452125=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-31961-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1345452125==
Content-Type: multipart/alternative; boundary="1377072642.CbEa2.17205"; charset="us-ascii"


--1377072642.CbEa2.17205
Date: Wed, 21 Aug 2013 08:10:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=31961

--- Comment #15 from Salah Coronya <salah.coronya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Yes, it still does (as of 3b56bba6abaa70d629fccdcf8490e087ea3a1ab4 in
mouveau-master) it unles the workaround in Comment 12 (set the resolution an
mnaully disable the phantom ports on the kernel command line)  is applied.

There (at least) 2 symptoms - first, the syslog is spammed with
"[drm:drm_crtc_helper_set_config] *ERROR* failed to set mode on [CRTC:10]
message." Second, the framebuffer conole is set with a phyical resolution of
1280x1024 but a virtual resolution of 720x576 - so as a result is only fills
part of the screen, and it can't be changed with fbset (ioctl
FBIOPUT_VSCREENINFO: Invalid argument) - and attempting to do so generated more
syslog spam

X11 displays normally, however, (it picks a resolution 1024x768  and fills the
screen) - though it still spams the syslog.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377072642.CbEa2.17205
Date: Wed, 21 Aug 2013 08:10:42 +0000
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
   title="NEW --- - [NV4E] [drm:drm_crtc_helper_set_config] *ERROR* failed to set mode on [CRTC:6]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=31961#c15">Comment # 15</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV4E] [drm:drm_crtc_helper_set_config] *ERROR* failed to set mode on [CRTC:6]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=31961">bug 31961</a>
              from <span class="vcard"><a class="email" href="mailto:salah.coronya&#64;gmail.com" title="Salah Coronya &lt;salah.coronya&#64;gmail.com&gt;"> <span class="fn">Salah Coronya</span></a>
</span></b>
        <pre>Yes, it still does (as of 3b56bba6abaa70d629fccdcf8490e087ea3a1ab4 in
mouveau-master) it unles the workaround in <a href="show_bug.cgi?id=31961#c12">Comment 12</a> (set the resolution an
mnaully disable the phantom ports on the kernel command line)  is applied.

There (at least) 2 symptoms - first, the syslog is spammed with
&quot;[drm:drm_crtc_helper_set_config] *ERROR* failed to set mode on [CRTC:10]
message.&quot; Second, the framebuffer conole is set with a phyical resolution of
1280x1024 but a virtual resolution of 720x576 - so as a result is only fills
part of the screen, and it can't be changed with fbset (ioctl
FBIOPUT_VSCREENINFO: Invalid argument) - and attempting to do so generated more
syslog spam

X11 displays normally, however, (it picks a resolution 1024x768  and fills the
screen) - though it still spams the syslog.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377072642.CbEa2.17205--

--===============1345452125==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1345452125==--
