From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91722] New: [NVE4] PGRAPH - grctx template channel
 unload timeout, failed to construct context, init failed, -16
Date: Sat, 22 Aug 2015 01:52:42 +0000
Message-ID: <bug-91722-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2090870058=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============2090870058==
Content-Type: multipart/alternative; boundary="1440208362.2fa10.5171"; charset="UTF-8"


--1440208362.2fa10.5171
Date: Sat, 22 Aug 2015 01:52:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91722

            Bug ID: 91722
           Summary: [NVE4] PGRAPH - grctx template channel unload timeout,
                    failed to construct context, init failed, -16
           Product: Mesa
           Version: 10.6
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: kyle.devir-U10LOJoAJ6dBDgjK7y7TUQ@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

I have an Nvidia GeForce GTX 880M, which nouveau does not play with nicely. I
have installed nouveau-fw, so the proprietary firmware is available.

When I boot my laptop, I get these errors:

nouveau E[  PGRAPH][0000:01:00.0] grctx template channel unload timeout
nouveau E[  PGRAPH][0000:01:00.0] failed to construct context
nouveau E[  PGRAPH][0000:01:00.0] init failed, -16

Operating system: Chakra OS (64-bit)

Relevant packages:
 - linux-ck 4.1.6
 - libdrm 2.4.64
 - mesa 10.6.4
 - mesa-vdpau 10.6.4
 - opencl-mesa 10.6.4
 - libva-mesa-driver 10.6.4
 - xf86-video-nouveau 1.0.11
 - nouveau-fw 340.32

I will also post my dmesg.log, Xorg.0.log and mmiotrace.log.xz.

Many thanks in advance. :)

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1440208362.2fa10.5171
Date: Sat, 22 Aug 2015 01:52:42 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE4] PGRAPH - grctx template channel unload timeout, failed to construct context, init failed, -16"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91722">91722</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVE4] PGRAPH - grctx template channel unload timeout, failed to construct context, init failed, -16
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>10.6
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>kyle.devir&#64;mykolab.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I have an Nvidia GeForce GTX 880M, which nouveau does not play with nicely. I
have installed nouveau-fw, so the proprietary firmware is available.

When I boot my laptop, I get these errors:

nouveau E[  PGRAPH][0000:01:00.0] grctx template channel unload timeout
nouveau E[  PGRAPH][0000:01:00.0] failed to construct context
nouveau E[  PGRAPH][0000:01:00.0] init failed, -16

Operating system: Chakra OS (64-bit)

Relevant packages:
 - linux-ck 4.1.6
 - libdrm 2.4.64
 - mesa 10.6.4
 - mesa-vdpau 10.6.4
 - opencl-mesa 10.6.4
 - libva-mesa-driver 10.6.4
 - xf86-video-nouveau 1.0.11
 - nouveau-fw 340.32

I will also post my dmesg.log, Xorg.0.log and mmiotrace.log.xz.

Many thanks in advance. :)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1440208362.2fa10.5171--

--===============2090870058==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2090870058==--
