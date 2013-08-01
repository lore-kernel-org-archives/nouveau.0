From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67628] New: [BISECTED] Monitor on Display port shows
 distortions
Date: Thu, 01 Aug 2013 15:29:30 +0000
Message-ID: <bug-67628-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0095975813=="
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


--===============0095975813==
Content-Type: multipart/alternative; boundary="1375370970.1ED777c81.24846"; charset="us-ascii"


--1375370970.1ED777c81.24846
Date: Thu, 1 Aug 2013 15:29:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67628

          Priority: medium
            Bug ID: 67628
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [BISECTED] Monitor on Display port shows distortions
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: major
    Classification: Unclassified
                OS: Linux (All)
          Reporter: torsten.wagner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 83446
  --> https://bugs.freedesktop.org/attachment.cgi?id=83446&action=edit
Kernel bisect

Updating to a kernel > 3.8, the monitor connected via display port shows heavy
colour distortions (see attached image). 
I bisect the kernel and it came down to patch 

5cc027f6b1ec651c18a4322ed3e30c6e9cf01e96
(drm/nv50-/disp: move DP link training to core and train from supervisor)

This makes sens, since this patch deals with display port functions. 

The problem appears during boot and hence I guess it is part of the DRM resp.
KMS part.

Attached are dmesg outputs for a working and a non-working kernel.
An image which shows the kind of distortions and the kernel bisect log.

Relevant system infos:

01:00.0 VGA compatible controller: NVIDIA Corporation GF108GL [Quadro 600] (rev
a1)
Display: DELL U2410

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1375370970.1ED777c81.24846
Date: Thu, 1 Aug 2013 15:29:30 +0000
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
   title="NEW --- - [BISECTED] Monitor on Display port shows distortions"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67628">67628</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[BISECTED] Monitor on Display port shows distortions
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
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
          <td>torsten.wagner&#64;gmail.com
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
        <pre>Created <span class=""><a href="attachment.cgi?id=83446" name="attach_83446" title="Kernel bisect">attachment 83446</a> <a href="attachment.cgi?id=83446&amp;action=edit" title="Kernel bisect">[details]</a></span>
Kernel bisect

Updating to a kernel &gt; 3.8, the monitor connected via display port shows heavy
colour distortions (see attached image). 
I bisect the kernel and it came down to patch 

5cc027f6b1ec651c18a4322ed3e30c6e9cf01e96
(drm/nv50-/disp: move DP link training to core and train from supervisor)

This makes sens, since this patch deals with display port functions. 

The problem appears during boot and hence I guess it is part of the DRM resp.
KMS part.

Attached are dmesg outputs for a working and a non-working kernel.
An image which shows the kind of distortions and the kernel bisect log.

Relevant system infos:

01:00.0 VGA compatible controller: NVIDIA Corporation GF108GL [Quadro 600] (rev
a1)
Display: DELL U2410</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1375370970.1ED777c81.24846--

--===============0095975813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0095975813==--
