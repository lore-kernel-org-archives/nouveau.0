From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 85100] New: Geforce GT730: X freezes during normal
 2d operation.
Date: Thu, 16 Oct 2014 16:22:24 +0000
Message-ID: <bug-85100-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0211591032=="
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


--===============0211591032==
Content-Type: multipart/alternative; boundary="1413476544.eD2a1.19805"; charset="UTF-8"


--1413476544.eD2a1.19805
Date: Thu, 16 Oct 2014 16:22:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=85100

            Bug ID: 85100
           Summary: Geforce GT730: X freezes during normal 2d operation.
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: nobody-freedesktop.org-e83xkrq8dvbLvtPRa3sz4w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 107936
  --> https://bugs.freedesktop.org/attachment.cgi?id=107936&action=edit
Kernel Log

This is the version of software that I am running:

extra/mesa-dri 10.3.1-1
extra/xf86-video-nouveau 1.0.11-2
core/linux 3.16.4-1
extra/libdrm 2.4.58-1

The system has an integrated ATI GPU onboard which is not used and a PCIe
Geforce GT730 which is used in a dual head setup.

Occasionally, X will freeze during normal activity (no 3d, no video playback,
just some terminals)

Sometimes the mouse cursor is still movable for a few seconds, afterwards,
graphics is completely frozen up, the system is usually still pingable though.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1413476544.eD2a1.19805
Date: Thu, 16 Oct 2014 16:22:24 +0000
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
   title="NEW - Geforce GT730: X freezes during normal 2d operation."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85100">85100</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Geforce GT730: X freezes during normal 2d operation.
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
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
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
          <td>nobody-freedesktop.org&#64;nowhere.ws
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=107936" name="attach_107936" title="Kernel Log">attachment 107936</a> <a href="attachment.cgi?id=107936&amp;action=edit" title="Kernel Log">[details]</a></span>
Kernel Log

This is the version of software that I am running:

extra/mesa-dri 10.3.1-1
extra/xf86-video-nouveau 1.0.11-2
core/linux 3.16.4-1
extra/libdrm 2.4.58-1

The system has an integrated ATI GPU onboard which is not used and a PCIe
Geforce GT730 which is used in a dual head setup.

Occasionally, X will freeze during normal activity (no 3d, no video playback,
just some terminals)

Sometimes the mouse cursor is still movable for a few seconds, afterwards,
graphics is completely frozen up, the system is usually still pingable though.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1413476544.eD2a1.19805--

--===============0211591032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0211591032==--
