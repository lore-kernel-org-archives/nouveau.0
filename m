From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 60369] src/nouveau_exa.c:142:31: error:
 'CREATE_PIXMAP_USAGE_SHARED' undeclared (first use in this function)
Date: Thu, 07 Feb 2013 08:45:21 +0000
Message-ID: <bug-60369-8800-fGhaw0FSmH@http.bugs.freedesktop.org/>
References: <bug-60369-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0999440410=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-60369-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0999440410==
Content-Type: multipart/alternative; boundary="1360226721.5cc120552.17057"; charset="us-ascii"


--1360226721.5cc120552.17057
Date: Thu, 7 Feb 2013 08:45:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=60369

Fabio Pedretti <fabio.ped-VGgt2q2+T+FeoWH0uzbU5w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|FIXED                       |---

--- Comment #2 from Fabio Pedretti <fabio.ped-VGgt2q2+T+FeoWH0uzbU5w@public.gmane.org> ---
Thanks, that one is fixed, there is another issue later on however:

  CC     drmmode_display.lo
../../src/drmmode_display.c: In function 'drmmode_set_mode_major':
../../src/drmmode_display.c:349:22: error: 'struct _rrCrtc' has no member named
'scanout_pixmap'
../../src/drmmode_display.c: In function 'drmmode_set_scanout_pixmap':
../../src/drmmode_display.c:550:23: error: 'struct _rrCrtc' has no member named
'scanout_pixmap'
../../src/drmmode_display.c:551:4: warning: implicit declaration of function
'PixmapStopDirtyTracking' [-Wimplicit-function-declaration]
../../src/drmmode_display.c:551:44: error: 'struct _rrCrtc' has no member named
'scanout_pixmap'
../../src/drmmode_display.c:566:2: warning: implicit declaration of function
'PixmapStartDirtyTracking' [-Wimplicit-function-declaration]
../../src/drmmode_display.c:546:27: warning: unused variable 'drmmode_crtc'
[-Wunused-variable]
../../src/drmmode_display.c: At top level:
../../src/drmmode_display.c:582:2: error: unknown field 'set_scanout_pixmap'
specified in initializer
../../src/drmmode_display.c:582:2: warning: initialization from incompatible
pointer type [enabled by default]
../../src/drmmode_display.c:582:2: warning: (near initialization for
'drmmode_crtc_funcs.shadow_allocate') [enabled by default]

Full log here:
https://launchpadlibrarian.net/130610608/buildlog_ubuntu-precise-amd64.xserver-xorg-video-nouveau_1%3A1.0.6%2Bgit1302070927.61a277~gd~p_FAILEDTOBUILD.txt.gz

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1360226721.5cc120552.17057
Date: Thu, 7 Feb 2013 08:45:21 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:fabio.ped&#64;libero.it" title="Fabio Pedretti &lt;fabio.ped&#64;libero.it&gt;"> <span class="fn">Fabio Pedretti</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - src/nouveau_exa.c:142:31: error: 'CREATE_PIXMAP_USAGE_SHARED' undeclared (first use in this function)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60369">bug 60369</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>RESOLVED
           </td>
           <td>REOPENED
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Resolution</td>
           <td>FIXED
           </td>
           <td>---
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - src/nouveau_exa.c:142:31: error: 'CREATE_PIXMAP_USAGE_SHARED' undeclared (first use in this function)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60369#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - src/nouveau_exa.c:142:31: error: 'CREATE_PIXMAP_USAGE_SHARED' undeclared (first use in this function)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60369">bug 60369</a>
              from <span class="vcard"><a class="email" href="mailto:fabio.ped&#64;libero.it" title="Fabio Pedretti &lt;fabio.ped&#64;libero.it&gt;"> <span class="fn">Fabio Pedretti</span></a>
</span></b>
        <pre>Thanks, that one is fixed, there is another issue later on however:

  CC     drmmode_display.lo
../../src/drmmode_display.c: In function 'drmmode_set_mode_major':
../../src/drmmode_display.c:349:22: error: 'struct _rrCrtc' has no member named
'scanout_pixmap'
../../src/drmmode_display.c: In function 'drmmode_set_scanout_pixmap':
../../src/drmmode_display.c:550:23: error: 'struct _rrCrtc' has no member named
'scanout_pixmap'
../../src/drmmode_display.c:551:4: warning: implicit declaration of function
'PixmapStopDirtyTracking' [-Wimplicit-function-declaration]
../../src/drmmode_display.c:551:44: error: 'struct _rrCrtc' has no member named
'scanout_pixmap'
../../src/drmmode_display.c:566:2: warning: implicit declaration of function
'PixmapStartDirtyTracking' [-Wimplicit-function-declaration]
../../src/drmmode_display.c:546:27: warning: unused variable 'drmmode_crtc'
[-Wunused-variable]
../../src/drmmode_display.c: At top level:
../../src/drmmode_display.c:582:2: error: unknown field 'set_scanout_pixmap'
specified in initializer
../../src/drmmode_display.c:582:2: warning: initialization from incompatible
pointer type [enabled by default]
../../src/drmmode_display.c:582:2: warning: (near initialization for
'drmmode_crtc_funcs.shadow_allocate') [enabled by default]

Full log here:
<a href="https://launchpadlibrarian.net/130610608/buildlog_ubuntu-precise-amd64.xserver-xorg-video-nouveau_1%3A1.0.6%2Bgit1302070927.61a277~gd~p_FAILEDTOBUILD.txt.gz">https://launchpadlibrarian.net/130610608/buildlog_ubuntu-precise-amd64.xserver-xorg-video-nouveau_1%3A1.0.6%2Bgit1302070927.61a277~gd~p_FAILEDTOBUILD.txt.gz</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1360226721.5cc120552.17057--

--===============0999440410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0999440410==--
