From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58378] [NV86] Distorted graphics on NVIDIA GeForce
 8400M G after upgrade the kernel to 3.7.0 version
Date: Thu, 09 Jan 2014 17:07:40 +0000
Message-ID: <bug-58378-8800-knG3PYqbN7@http.bugs.freedesktop.org/>
References: <bug-58378-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1195287948=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58378-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1195287948==
Content-Type: multipart/alternative; boundary="1389287260.0c43d555.28195"; charset="us-ascii"


--1389287260.0c43d555.28195
Date: Thu, 9 Jan 2014 17:07:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58378

--- Comment #74 from Andreas Loew <awl1-hi6Y0CQ0nG0@public.gmane.org> ---
Just received

drivers/gpu/drm/nouveau/core/subdev/devinit/nv50.c:164: error:
'NVDEV_ENGINE_VIC' undeclared (first use in this function)

but "fixed" it for me by commenting out the lines for a 0xaf card (I have a
0x86 type anyway, so this code does not apply to me):

+    case 0xaf:
+        /* if (!(r154c & 0x40)) */
+        /*    device->disable_mask |= 1ULL << NVDEV_ENGINE_VIC; */
+        /* fallthrough */

BR,
Andreas

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389287260.0c43d555.28195
Date: Thu, 9 Jan 2014 17:07:40 +0000
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
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378#c74">Comment # 74</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378">bug 58378</a>
              from <span class="vcard"><a class="email" href="mailto:awl1&#64;gmx.net" title="Andreas Loew &lt;awl1&#64;gmx.net&gt;"> <span class="fn">Andreas Loew</span></a>
</span></b>
        <pre>Just received

drivers/gpu/drm/nouveau/core/subdev/devinit/nv50.c:164: error:
'NVDEV_ENGINE_VIC' undeclared (first use in this function)

but &quot;fixed&quot; it for me by commenting out the lines for a 0xaf card (I have a
0x86 type anyway, so this code does not apply to me):

+    case 0xaf:
+        /* if (!(r154c &amp; 0x40)) */
+        /*    device-&gt;disable_mask |= 1ULL &lt;&lt; NVDEV_ENGINE_VIC; */
+        /* fallthrough */

BR,
Andreas</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389287260.0c43d555.28195--

--===============1195287948==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1195287948==--
