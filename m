From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 85381] New: Blank screen with GeForce 9600 GT
Date: Thu, 23 Oct 2014 19:06:42 +0000
Message-ID: <bug-85381-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1814792938=="
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


--===============1814792938==
Content-Type: multipart/alternative; boundary="1414091202.AB1DeF4D1.20171"; charset="UTF-8"


--1414091202.AB1DeF4D1.20171
Date: Thu, 23 Oct 2014 19:06:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=85381

            Bug ID: 85381
           Summary: Blank screen with GeForce 9600 GT
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: michael-U4+xqT1Vg0VeoWH0uzbU5w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 108317
  --> https://bugs.freedesktop.org/attachment.cgi?id=108317&action=edit
dmesg

Regression detected in kernel version v3.18-rc1.

Behaviour: Blank screen appears during boot. Normally KMS starts at this
moment, but since commit 1dce6264045cd23e9c07574ed0bb31c7dce9354f
("drm/nv50/kms: Set VBLANK time in modeset script") said behaviour occurs.

dmesg log is attached, although it is overrun with messages like
[   23.119549] nouveau E[   PDISP][0000:01:00.0]     0x0840: 0x00000000 ->
0xc0000000

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1414091202.AB1DeF4D1.20171
Date: Thu, 23 Oct 2014 19:06:42 +0000
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
   title="NEW - Blank screen with GeForce 9600 GT"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85381">85381</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Blank screen with GeForce 9600 GT
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
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
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>michael&#64;riesch.at
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=108317" name="attach_108317" title="dmesg">attachment 108317</a> <a href="attachment.cgi?id=108317&amp;action=edit" title="dmesg">[details]</a></span>
dmesg

Regression detected in kernel version v3.18-rc1.

Behaviour: Blank screen appears during boot. Normally KMS starts at this
moment, but since commit 1dce6264045cd23e9c07574ed0bb31c7dce9354f
(&quot;drm/nv50/kms: Set VBLANK time in modeset script&quot;) said behaviour occurs.

dmesg log is attached, although it is overrun with messages like
[   23.119549] nouveau E[   PDISP][0000:01:00.0]     0x0840: 0x00000000 -&gt;
0xc0000000</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1414091202.AB1DeF4D1.20171--

--===============1814792938==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1814792938==--
