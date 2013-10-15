From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70511] New: nouveau_bo_name_get segmentation fault
 while running root tutorials/gl/glbox.C
Date: Tue, 15 Oct 2013 21:21:22 +0000
Message-ID: <bug-70511-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1347814242=="
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


--===============1347814242==
Content-Type: multipart/alternative; boundary="1381872082.048b6Ba1.10411"; charset="us-ascii"


--1381872082.048b6Ba1.10411
Date: Tue, 15 Oct 2013 21:21:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70511

          Priority: medium
            Bug ID: 70511
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: nouveau_bo_name_get segmentation fault while running
                    root tutorials/gl/glbox.C
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: zeccav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

I am not sure this is the right place to submit this bug.
While running root from CERN (root.cern.ch), test case tutorials/gl/glbox.C 
I lose the X screen and must log in again. 
I have Linux Fedora 19 with mate desktop.
/lib64/libdrm_nouveau.so.2 comes from package libdrm-2.4.46-1.fc19.x86_64
Xorg from package xorg-x11-server-Xorg-1.14.3-1.fc19
Follows more info from /var/log

Oct 15 22:38:52 nero19 kernel: [  446.479462] [drm:drm_crtc_helper_set_config]
*ERROR* failed to set mode on [CRTC:10]
Oct 15 22:38:52 nero19 kernel: [  446.479466] detected fb_set_par error, error
code: -22
Oct 15 22:38:52 nero19 kernel: [  446.479485] [drm:drm_crtc_helper_set_config]
*ERROR* failed to set mode on [CRTC:10]
Oct 15 22:38:54 nero19 abrt[1845]: Saved core dump of pid 385 (/usr/bin/Xorg)
to /var/tmp/abrt/ccpp-2013-10-15-22:38:52-385 (22847488 bytes)
Oct 15 22:38:54 nero19 abrtd: New client connected
Oct 15 22:38:54 nero19 mate-keyring-daemon[1164]: dbus failure unregistering
from session: Connection was disconnected before a reply was received
Oct 15 22:38:55 nero19 abrt-server[1847]: Generating core_backtrace
Oct 15 22:38:55 nero19 abrt-server[1847]: Generating backtrace

(EE)
(EE) Backtrace:
(EE) 0: /usr/bin/X (OsLookupColor+0x129) [0x46ee59]
(EE) 1: /lib64/libpthread.so.0 (__restore_rt+0x0) [0x3614c0ef9f]
(EE) 2: /lib64/libdrm_nouveau.so.2 (nouveau_bo_name_get+0xc) [0x7febab45416c]
(EE) 3: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (_init+0x64ec)
[0x7febab66a67c]
(EE) 4: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (_init+0x6a21)
[0x7febab66b0a1]
(EE) 5: /usr/bin/X (DRI2SwapBuffers+0x2ab) [0x56805b]
(EE) 6: /usr/bin/X (DRI2GetParam+0xbc3) [0x569ac3]
(EE) 7: /usr/bin/X (SendErrorToClient+0x3f7) [0x436fe7]
(EE) 8: /usr/bin/X (_init+0x3aaa) [0x429b8a]
(EE) 9: /lib64/libc.so.6 (__libc_start_main+0xf5) [0x3614421b75]
(EE) 10: /usr/bin/X (_start+0x29) [0x4267f1]
(EE) 11: ? (?+0x29) [0x29]
(EE)
(EE) Segmentation fault at address 0x8
(EE)
Fatal server error:
(EE) Caught signal 11 (Segmentation fault). Server aborting
(EE)
(EE)
Please consult the Fedora Project support
         at http://wiki.x.org
 for help.
(EE) Please also check the log file at "/var/log/Xorg.0.log" for additional
information.
(EE)
(II) AIGLX: Suspending AIGLX clients for VT switch
(EE) Server terminated with error (1). Closing log file.
core_backtrace:
{   "signal": 6
,   "executable": "/usr/bin/Xorg"
,   "stacktrace":
      [ {   "crash_thread": true
        ,   "frames":
              [ {   "address": 232268192281
                ,   "build_id": "f47cec2a689de012d8eba76ae17ea0996aea03f2"
                ,   "build_id_offset": 219673
                ,   "function_name": "raise"
                ,   "file_name": "/lib64/libc.so.6"
                ,   "fingerprint": "f33186a4c862fb0751bca60701f553b829210477"
                }
              , {   "address": 232268198184
                ,   "build_id": "f47cec2a689de012d8eba76ae17ea0996aea03f2"
                ,   "build_id_offset": 225576
                ,   "function_name": "abort"
                ,   "file_name": "/lib64/libc.so.6"
                ,   "fingerprint": "352bc5cf09233cea84fd089527a146cfb5b7d8dc"
                }
              , {   "address": 4658126
                ,   "build_id": "9d1f87148aa274a76336de4a518898bdd0e3e74c"
                ,   "build_id_offset": 463822
                ,   "file_name": "/usr/bin/Xorg"
                }
              , {   "address": 4753660
                ,   "build_id": "9d1f87148aa274a76336de4a518898bdd0e3e74c"
                ,   "build_id_offset": 559356
                ,   "file_name": "/usr/bin/Xorg"
                }
              , {   "address": 4640146
                ,   "build_id": "9d1f87148aa274a76336de4a518898bdd0e3e74c"
                ,   "build_id_offset": 445842
                ,   "function_name": "AbortServer"
                ,   "file_name": "/usr/bin/Xorg"
                ,   "fingerprint": "ed602f21513e774d5550b35f06e7101bee4becf5"
                }
              , {   "address": 4643480
                ,   "build_id": "9d1f87148aa274a76336de4a518898bdd0e3e74c"
                ,   "build_id_offset": 449176
                ,   "file_name": "/usr/bin/Xorg"
                }
              , {   "address": 4648364
                ,   "build_id": "9d1f87148aa274a76336de4a518898bdd0e3e74c"
                ,   "build_id_offset": 454060
                ,   "function_name": "OsSigHandler"
                ,   "file_name": "/usr/bin/Xorg"
                ,   "fingerprint": "ce6f5ffe9d8ce2ce3a7f405312c101550e1eed55"
                }
              , {   "address": 139806401605996
                ,   "build_id": "6a1b2d2d9cd0a0a9d9c164c9a44de70cbd4f1895"
                ,   "build_id_offset": 8556
                ,   "function_name": "nouveau_bo_name_get"
                ,   "file_name": "/lib64/libdrm_nouveau.so.2"
                ,   "fingerprint": "2295a8145fe6ae7844b0c2f509fe9ac98eac4145"
                }
              , {   "address": 139806403769020
                ,   "build_id": "96e2a53ee9fec52e0d49af6a11d13b0ee3525e87"
                ,   "build_id_offset": 45756
                ,   "function_name": "nouveau_dri2_finish_swap"
                ,   "file_name":
"/usr/lib64/xorg/modules/drivers/nouveau_drv.so"
                ,   "fingerprint": "263fc53c053772a6dee812f56755e0642002d050"
                }
              , {   "address": 139806403770353
                ,   "build_id": "96e2a53ee9fec52e0d49af6a11d13b0ee3525e87"
                ,   "build_id_offset": 47089
                ,   "function_name": "nouveau_dri2_schedule_swap"
                ,   "file_name":
"/usr/lib64/xorg/modules/drivers/nouveau_drv.so"
                ,   "fingerprint": "a0ed662c9b8e351cd943a5c70a54292251f59f73"
                }
              , {   "address": 5668955
                ,   "build_id": "9d1f87148aa274a76336de4a518898bdd0e3e74c"
                ,   "build_id_offset": 1474651
                ,   "function_name": "DRI2SwapBuffers"
                ,   "file_name": "/usr/bin/Xorg"
                ,   "fingerprint": "4de0a101be39745cb8087920625086119d8aa291"
                }
              , {   "address": 5674787
                ,   "build_id": "9d1f87148aa274a76336de4a518898bdd0e3e74c"
                ,   "build_id_offset": 1480483
                ,   "function_name": "ProcDRI2Dispatch"
                ,   "file_name": "/usr/bin/Xorg"
                ,   "fingerprint": "a5f4aaca7ba7a3d6ad58a3d9146dbd843a3ed421"
                }
              , {   "address": 4419479
                ,   "build_id": "9d1f87148aa274a76336de4a518898bdd0e3e74c"
                ,   "build_id_offset": 225175
                ,   "function_name": "Dispatch"
                ,   "file_name": "/usr/bin/Xorg"
                ,   "fingerprint": "f494f094f64d89eb461d49e7b078eb5dd51db66f"
                }
              , {   "address": 4351146
                ,   "build_id": "9d1f87148aa274a76336de4a518898bdd0e3e74c"
                ,   "build_id_offset": 156842
                ,   "function_name": "main"
                ,   "file_name": "/usr/bin/Xorg"
                ,   "fingerprint": "11669d254e6184299c1b3cd5ff9b7497f8a532be"
                } ]
        } ]
}

[vitti ~]$

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381872082.048b6Ba1.10411
Date: Tue, 15 Oct 2013 21:21:22 +0000
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
   title="NEW --- - nouveau_bo_name_get segmentation fault while running root tutorials/gl/glbox.C"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70511">70511</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau_bo_name_get segmentation fault while running root tutorials/gl/glbox.C
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
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
          <td>zeccav&#64;gmail.com
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
        <pre>I am not sure this is the right place to submit this bug.
While running root from CERN (root.cern.ch), test case tutorials/gl/glbox.C 
I lose the X screen and must log in again. 
I have Linux Fedora 19 with mate desktop.
/lib64/libdrm_nouveau.so.2 comes from package libdrm-2.4.46-1.fc19.x86_64
Xorg from package xorg-x11-server-Xorg-1.14.3-1.fc19
Follows more info from /var/log

Oct 15 22:38:52 nero19 kernel: [  446.479462] [drm:drm_crtc_helper_set_config]
*ERROR* failed to set mode on [CRTC:10]
Oct 15 22:38:52 nero19 kernel: [  446.479466] detected fb_set_par error, error
code: -22
Oct 15 22:38:52 nero19 kernel: [  446.479485] [drm:drm_crtc_helper_set_config]
*ERROR* failed to set mode on [CRTC:10]
Oct 15 22:38:54 nero19 abrt[1845]: Saved core dump of pid 385 (/usr/bin/Xorg)
to /var/tmp/abrt/ccpp-2013-10-15-22:38:52-385 (22847488 bytes)
Oct 15 22:38:54 nero19 abrtd: New client connected
Oct 15 22:38:54 nero19 mate-keyring-daemon[1164]: dbus failure unregistering
from session: Connection was disconnected before a reply was received
Oct 15 22:38:55 nero19 abrt-server[1847]: Generating core_backtrace
Oct 15 22:38:55 nero19 abrt-server[1847]: Generating backtrace

(EE)
(EE) Backtrace:
(EE) 0: /usr/bin/X (OsLookupColor+0x129) [0x46ee59]
(EE) 1: /lib64/libpthread.so.0 (__restore_rt+0x0) [0x3614c0ef9f]
(EE) 2: /lib64/libdrm_nouveau.so.2 (nouveau_bo_name_get+0xc) [0x7febab45416c]
(EE) 3: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (_init+0x64ec)
[0x7febab66a67c]
(EE) 4: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (_init+0x6a21)
[0x7febab66b0a1]
(EE) 5: /usr/bin/X (DRI2SwapBuffers+0x2ab) [0x56805b]
(EE) 6: /usr/bin/X (DRI2GetParam+0xbc3) [0x569ac3]
(EE) 7: /usr/bin/X (SendErrorToClient+0x3f7) [0x436fe7]
(EE) 8: /usr/bin/X (_init+0x3aaa) [0x429b8a]
(EE) 9: /lib64/libc.so.6 (__libc_start_main+0xf5) [0x3614421b75]
(EE) 10: /usr/bin/X (_start+0x29) [0x4267f1]
(EE) 11: ? (?+0x29) [0x29]
(EE)
(EE) Segmentation fault at address 0x8
(EE)
Fatal server error:
(EE) Caught signal 11 (Segmentation fault). Server aborting
(EE)
(EE)
Please consult the Fedora Project support
         at <a href="http://wiki.x.org">http://wiki.x.org</a>
 for help.
(EE) Please also check the log file at &quot;/var/log/Xorg.0.log&quot; for additional
information.
(EE)
(II) AIGLX: Suspending AIGLX clients for VT switch
(EE) Server terminated with error (1). Closing log file.
core_backtrace:
{   &quot;signal&quot;: 6
,   &quot;executable&quot;: &quot;/usr/bin/Xorg&quot;
,   &quot;stacktrace&quot;:
      [ {   &quot;crash_thread&quot;: true
        ,   &quot;frames&quot;:
              [ {   &quot;address&quot;: 232268192281
                ,   &quot;build_id&quot;: &quot;f47cec2a689de012d8eba76ae17ea0996aea03f2&quot;
                ,   &quot;build_id_offset&quot;: 219673
                ,   &quot;function_name&quot;: &quot;raise&quot;
                ,   &quot;file_name&quot;: &quot;/lib64/libc.so.6&quot;
                ,   &quot;fingerprint&quot;: &quot;f33186a4c862fb0751bca60701f553b829210477&quot;
                }
              , {   &quot;address&quot;: 232268198184
                ,   &quot;build_id&quot;: &quot;f47cec2a689de012d8eba76ae17ea0996aea03f2&quot;
                ,   &quot;build_id_offset&quot;: 225576
                ,   &quot;function_name&quot;: &quot;abort&quot;
                ,   &quot;file_name&quot;: &quot;/lib64/libc.so.6&quot;
                ,   &quot;fingerprint&quot;: &quot;352bc5cf09233cea84fd089527a146cfb5b7d8dc&quot;
                }
              , {   &quot;address&quot;: 4658126
                ,   &quot;build_id&quot;: &quot;9d1f87148aa274a76336de4a518898bdd0e3e74c&quot;
                ,   &quot;build_id_offset&quot;: 463822
                ,   &quot;file_name&quot;: &quot;/usr/bin/Xorg&quot;
                }
              , {   &quot;address&quot;: 4753660
                ,   &quot;build_id&quot;: &quot;9d1f87148aa274a76336de4a518898bdd0e3e74c&quot;
                ,   &quot;build_id_offset&quot;: 559356
                ,   &quot;file_name&quot;: &quot;/usr/bin/Xorg&quot;
                }
              , {   &quot;address&quot;: 4640146
                ,   &quot;build_id&quot;: &quot;9d1f87148aa274a76336de4a518898bdd0e3e74c&quot;
                ,   &quot;build_id_offset&quot;: 445842
                ,   &quot;function_name&quot;: &quot;AbortServer&quot;
                ,   &quot;file_name&quot;: &quot;/usr/bin/Xorg&quot;
                ,   &quot;fingerprint&quot;: &quot;ed602f21513e774d5550b35f06e7101bee4becf5&quot;
                }
              , {   &quot;address&quot;: 4643480
                ,   &quot;build_id&quot;: &quot;9d1f87148aa274a76336de4a518898bdd0e3e74c&quot;
                ,   &quot;build_id_offset&quot;: 449176
                ,   &quot;file_name&quot;: &quot;/usr/bin/Xorg&quot;
                }
              , {   &quot;address&quot;: 4648364
                ,   &quot;build_id&quot;: &quot;9d1f87148aa274a76336de4a518898bdd0e3e74c&quot;
                ,   &quot;build_id_offset&quot;: 454060
                ,   &quot;function_name&quot;: &quot;OsSigHandler&quot;
                ,   &quot;file_name&quot;: &quot;/usr/bin/Xorg&quot;
                ,   &quot;fingerprint&quot;: &quot;ce6f5ffe9d8ce2ce3a7f405312c101550e1eed55&quot;
                }
              , {   &quot;address&quot;: 139806401605996
                ,   &quot;build_id&quot;: &quot;6a1b2d2d9cd0a0a9d9c164c9a44de70cbd4f1895&quot;
                ,   &quot;build_id_offset&quot;: 8556
                ,   &quot;function_name&quot;: &quot;nouveau_bo_name_get&quot;
                ,   &quot;file_name&quot;: &quot;/lib64/libdrm_nouveau.so.2&quot;
                ,   &quot;fingerprint&quot;: &quot;2295a8145fe6ae7844b0c2f509fe9ac98eac4145&quot;
                }
              , {   &quot;address&quot;: 139806403769020
                ,   &quot;build_id&quot;: &quot;96e2a53ee9fec52e0d49af6a11d13b0ee3525e87&quot;
                ,   &quot;build_id_offset&quot;: 45756
                ,   &quot;function_name&quot;: &quot;nouveau_dri2_finish_swap&quot;
                ,   &quot;file_name&quot;:
&quot;/usr/lib64/xorg/modules/drivers/nouveau_drv.so&quot;
                ,   &quot;fingerprint&quot;: &quot;263fc53c053772a6dee812f56755e0642002d050&quot;
                }
              , {   &quot;address&quot;: 139806403770353
                ,   &quot;build_id&quot;: &quot;96e2a53ee9fec52e0d49af6a11d13b0ee3525e87&quot;
                ,   &quot;build_id_offset&quot;: 47089
                ,   &quot;function_name&quot;: &quot;nouveau_dri2_schedule_swap&quot;
                ,   &quot;file_name&quot;:
&quot;/usr/lib64/xorg/modules/drivers/nouveau_drv.so&quot;
                ,   &quot;fingerprint&quot;: &quot;a0ed662c9b8e351cd943a5c70a54292251f59f73&quot;
                }
              , {   &quot;address&quot;: 5668955
                ,   &quot;build_id&quot;: &quot;9d1f87148aa274a76336de4a518898bdd0e3e74c&quot;
                ,   &quot;build_id_offset&quot;: 1474651
                ,   &quot;function_name&quot;: &quot;DRI2SwapBuffers&quot;
                ,   &quot;file_name&quot;: &quot;/usr/bin/Xorg&quot;
                ,   &quot;fingerprint&quot;: &quot;4de0a101be39745cb8087920625086119d8aa291&quot;
                }
              , {   &quot;address&quot;: 5674787
                ,   &quot;build_id&quot;: &quot;9d1f87148aa274a76336de4a518898bdd0e3e74c&quot;
                ,   &quot;build_id_offset&quot;: 1480483
                ,   &quot;function_name&quot;: &quot;ProcDRI2Dispatch&quot;
                ,   &quot;file_name&quot;: &quot;/usr/bin/Xorg&quot;
                ,   &quot;fingerprint&quot;: &quot;a5f4aaca7ba7a3d6ad58a3d9146dbd843a3ed421&quot;
                }
              , {   &quot;address&quot;: 4419479
                ,   &quot;build_id&quot;: &quot;9d1f87148aa274a76336de4a518898bdd0e3e74c&quot;
                ,   &quot;build_id_offset&quot;: 225175
                ,   &quot;function_name&quot;: &quot;Dispatch&quot;
                ,   &quot;file_name&quot;: &quot;/usr/bin/Xorg&quot;
                ,   &quot;fingerprint&quot;: &quot;f494f094f64d89eb461d49e7b078eb5dd51db66f&quot;
                }
              , {   &quot;address&quot;: 4351146
                ,   &quot;build_id&quot;: &quot;9d1f87148aa274a76336de4a518898bdd0e3e74c&quot;
                ,   &quot;build_id_offset&quot;: 156842
                ,   &quot;function_name&quot;: &quot;main&quot;
                ,   &quot;file_name&quot;: &quot;/usr/bin/Xorg&quot;
                ,   &quot;fingerprint&quot;: &quot;11669d254e6184299c1b3cd5ff9b7497f8a532be&quot;
                } ]
        } ]
}

[vitti ~]$</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1381872082.048b6Ba1.10411--

--===============1347814242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1347814242==--
