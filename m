From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 62914] New: ZaphodHeads doesn't work after upgrading
 to xorg 1.14
Date: Fri, 29 Mar 2013 19:01:13 +0000
Message-ID: <bug-62914-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1794565835=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============1794565835==
Content-Type: multipart/alternative; boundary="1364583673.Cb7B6CF1.25288"; charset="us-ascii"


--1364583673.Cb7B6CF1.25288
Date: Fri, 29 Mar 2013 19:01:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=62914

          Priority: medium
            Bug ID: 62914
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: ZaphodHeads doesn't work after upgrading to xorg 1.14
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: critical
    Classification: Unclassified
                OS: Linux (All)
          Reporter: nowaker-qMBiBlq7xnnVItvQsEIGlw@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

CASE 1 (MAIN):

My 2 GPUs, 3 monitors setup stopped working after upgrading xorg to 1.14. I
guess we should blame xorg as the same happened with 1.13 version.
https://bugs.freedesktop.org/show_bug.cgi?id=56347
I tried using upstream nouveau as well.

[2013-03-29 16:43] upgraded xf86-video-nouveau (1.0.6-1 -> 1.0.7-1)
[2013-03-29 16:43] upgraded xorg-server (1.13.2.901-1 -> 1.14.0-2)

Backtrace from upstream nouveau, commit
6771424d79e541d2fa7253a582db3dc9108fd97d.

[  2312.187] (EE) 0: /usr/bin/X (xorg_backtrace+0x36) [0x58a846]
[  2312.187] (EE) 1: /usr/bin/X (0x400000+0x18e669) [0x58e669]
[  2312.187] (EE) 2: /usr/lib/libpthread.so.0 (0x7f1738fa2000+0xf1e0)
[0x7f1738fb11e0]
[  2312.187] (EE) 3: /usr/local/lib/xorg/modules/drivers/nouveau_drv.so
(0x7f1733dc0000+0x25e30) [0x7f1733de5e30]
[  2312.187] (EE) 4: /usr/bin/X (xf86CrtcSetModeTransform+0x14d) [0x4ae31d]
[  2312.187] (EE) 5: /usr/bin/X (xf86SetDesiredModes+0x1b8) [0x4aeb58]
[  2312.187] (EE) 6: /usr/local/lib/xorg/modules/drivers/nouveau_drv.so
(0x7f1733dc0000+0xe7d1) [0x7f1733dce7d1]
[  2312.188] (EE) 7: /usr/local/lib/xorg/modules/drivers/nouveau_drv.so
(0x7f1733dc0000+0xf126) [0x7f1733dcf126]
[  2312.188] (EE) 8: /usr/bin/X (0x400000+0xabbae) [0x4abbae]
[  2312.188] (EE) 9: /usr/bin/X (0x400000+0x2674d) [0x42674d]
[  2312.188] (EE) 10: /usr/lib/libc.so.6 (__libc_start_main+0xf5)
[0x7f1737e2ea15]
[  2312.188] (EE) 11: /usr/bin/X (0x400000+0x26bdd) [0x426bdd]

Can you please investigate what could cause the error?

I took a look at other projects reporting xorg 1.14 fails, maybe this has
something to do with my nouveau problem? Just a guess.
- https://bugs.freedesktop.org/show_bug.cgi?id=62112
- https://bugs.freedesktop.org/show_bug.cgi?id=62773

Files:
- full log:
  http://upload.nowaker.net/nwkr/1364581970_Xorg.0.log-HEAD
- my xorg.conf.3monitors - the same for two years:
  http://wklej.org/id/555276/txt/ 


CASE 2 (AUX):

When falling back to my 1 GPUs, 2 monitors setup with ZaphodHeads, I get only
one monitor working. That may be interesting:

[  2345.932] (EE) NOUVEAU(1): [drm] failed to set drm interface version.
[  2345.932] (EE) NOUVEAU(1): [drm] error opening the drm
[  2345.932] (EE) NOUVEAU(1): 820: 

Files:
- full log:
  http://upload.nowaker.net/nwkr/1364582818_Xorg.0.log-2monitors
- my xorg.conf.2monitors:
  http://upload.nowaker.net/nwkr/1364582578_xorg.conf.2monitory


As usual, patches will be appreciated - I will test.
My environment: Arch Linux, kernel 3.8.4-1-ARCH.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1364583673.Cb7B6CF1.25288
Date: Fri, 29 Mar 2013 19:01:13 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - ZaphodHeads doesn't work after upgrading to xorg 1.14"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62914">62914</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>ZaphodHeads doesn't work after upgrading to xorg 1.14
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>critical
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>nowaker&#64;geozone.pl
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>CASE 1 (MAIN):

My 2 GPUs, 3 monitors setup stopped working after upgrading xorg to 1.14. I
guess we should blame xorg as the same happened with 1.13 version.
<a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - NVPlatformProbe routine does not mark the entity as Shared for ZaphodHeads."
   href="show_bug.cgi?id=56347">https://bugs.freedesktop.org/show_bug.cgi?id=56347</a>
I tried using upstream nouveau as well.

[2013-03-29 16:43] upgraded xf86-video-nouveau (1.0.6-1 -&gt; 1.0.7-1)
[2013-03-29 16:43] upgraded xorg-server (1.13.2.901-1 -&gt; 1.14.0-2)

Backtrace from upstream nouveau, commit
6771424d79e541d2fa7253a582db3dc9108fd97d.

[  2312.187] (EE) 0: /usr/bin/X (xorg_backtrace+0x36) [0x58a846]
[  2312.187] (EE) 1: /usr/bin/X (0x400000+0x18e669) [0x58e669]
[  2312.187] (EE) 2: /usr/lib/libpthread.so.0 (0x7f1738fa2000+0xf1e0)
[0x7f1738fb11e0]
[  2312.187] (EE) 3: /usr/local/lib/xorg/modules/drivers/nouveau_drv.so
(0x7f1733dc0000+0x25e30) [0x7f1733de5e30]
[  2312.187] (EE) 4: /usr/bin/X (xf86CrtcSetModeTransform+0x14d) [0x4ae31d]
[  2312.187] (EE) 5: /usr/bin/X (xf86SetDesiredModes+0x1b8) [0x4aeb58]
[  2312.187] (EE) 6: /usr/local/lib/xorg/modules/drivers/nouveau_drv.so
(0x7f1733dc0000+0xe7d1) [0x7f1733dce7d1]
[  2312.188] (EE) 7: /usr/local/lib/xorg/modules/drivers/nouveau_drv.so
(0x7f1733dc0000+0xf126) [0x7f1733dcf126]
[  2312.188] (EE) 8: /usr/bin/X (0x400000+0xabbae) [0x4abbae]
[  2312.188] (EE) 9: /usr/bin/X (0x400000+0x2674d) [0x42674d]
[  2312.188] (EE) 10: /usr/lib/libc.so.6 (__libc_start_main+0xf5)
[0x7f1737e2ea15]
[  2312.188] (EE) 11: /usr/bin/X (0x400000+0x26bdd) [0x426bdd]

Can you please investigate what could cause the error?

I took a look at other projects reporting xorg 1.14 fails, maybe this has
something to do with my nouveau problem? Just a guess.
- <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - xf86-video-openchrome doesn't work with xorg 1.14"
   href="show_bug.cgi?id=62112">https://bugs.freedesktop.org/show_bug.cgi?id=62112</a>
- <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - X.org segfault with PRIME when attempting to use --setprovideroutputsource support."
   href="show_bug.cgi?id=62773">https://bugs.freedesktop.org/show_bug.cgi?id=62773</a>

Files:
- full log:
  <a href="http://upload.nowaker.net/nwkr/1364581970_Xorg.0.log-HEAD">http://upload.nowaker.net/nwkr/1364581970_Xorg.0.log-HEAD</a>
- my xorg.conf.3monitors - the same for two years:
  <a href="http://wklej.org/id/555276/txt/">http://wklej.org/id/555276/txt/</a> 


CASE 2 (AUX):

When falling back to my 1 GPUs, 2 monitors setup with ZaphodHeads, I get only
one monitor working. That may be interesting:

[  2345.932] (EE) NOUVEAU(1): [drm] failed to set drm interface version.
[  2345.932] (EE) NOUVEAU(1): [drm] error opening the drm
[  2345.932] (EE) NOUVEAU(1): 820: 

Files:
- full log:
  <a href="http://upload.nowaker.net/nwkr/1364582818_Xorg.0.log-2monitors">http://upload.nowaker.net/nwkr/1364582818_Xorg.0.log-2monitors</a>
- my xorg.conf.2monitors:
  <a href="http://upload.nowaker.net/nwkr/1364582578_xorg.conf.2monitory">http://upload.nowaker.net/nwkr/1364582578_xorg.conf.2monitory</a>


As usual, patches will be appreciated - I will test.
My environment: Arch Linux, kernel 3.8.4-1-ARCH.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1364583673.Cb7B6CF1.25288--

--===============1794565835==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1794565835==--
