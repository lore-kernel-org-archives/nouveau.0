From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 60772] New: xf86-video-nouveau fails to modprobe
 nouveau: KMS not enabled
Date: Wed, 13 Feb 2013 08:59:57 +0000
Message-ID: <bug-60772-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0199441287=="
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


--===============0199441287==
Content-Type: multipart/alternative; boundary="1360745997.db2cb5c01.21638"; charset="us-ascii"


--1360745997.db2cb5c01.21638
Date: Wed, 13 Feb 2013 08:59:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=60772

          Priority: medium
            Bug ID: 60772
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: xf86-video-nouveau fails to modprobe nouveau: KMS not
                    enabled
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: hkmaly-jG/AHqQBv7lBDgjK7y7TUQ@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

When nouveau kernel module is build as module and not inserted manually, X
server won't start with message "[drm] KMS not enabled".

Older versions (like xf86-video-nouveau-0.0.16) didn't have that problem.

Reason is in function NVHasKMS, where you FIRST call
drmCheckModesettingSupported and THEN nouveau_device_open, meaning
drmCheckModesettingSupported will fail.

When the calls are switched, nouveau_device_open will call modprobe and insert
the nouveau module, so later drmCheckModesettingSupported works correctly.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1360745997.db2cb5c01.21638
Date: Wed, 13 Feb 2013 08:59:57 +0000
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
   title="NEW --- - xf86-video-nouveau fails to modprobe nouveau: KMS not enabled"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60772">60772</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>xf86-video-nouveau fails to modprobe nouveau: KMS not enabled
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
          <td>hkmaly&#64;bigfoot.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86 (IA32)
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
        <pre>When nouveau kernel module is build as module and not inserted manually, X
server won't start with message &quot;[drm] KMS not enabled&quot;.

Older versions (like xf86-video-nouveau-0.0.16) didn't have that problem.

Reason is in function NVHasKMS, where you FIRST call
drmCheckModesettingSupported and THEN nouveau_device_open, meaning
drmCheckModesettingSupported will fail.

When the calls are switched, nouveau_device_open will call modprobe and insert
the nouveau module, so later drmCheckModesettingSupported works correctly.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1360745997.db2cb5c01.21638--

--===============0199441287==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0199441287==--
