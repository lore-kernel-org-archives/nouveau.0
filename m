From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78748] New: Nouveau fails initializing KMS on
 Geforce2 Go (NV11M)
Date: Thu, 15 May 2014 16:13:59 +0000
Message-ID: <bug-78748-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1052128861=="
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


--===============1052128861==
Content-Type: multipart/alternative; boundary="1400170439.E8DFB1.16012"; charset="us-ascii"


--1400170439.E8DFB1.16012
Date: Thu, 15 May 2014 16:13:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78748

          Priority: medium
            Bug ID: 78748
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Nouveau fails initializing KMS on Geforce2 Go (NV11M)
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: blocker
    Classification: Unclassified
                OS: Linux (All)
          Reporter: isma.casti-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 99105
  --> https://bugs.freedesktop.org/attachment.cgi?id=99105&action=edit
Video bios (10de:0112 NVIDIA Corporation NV11M [GeForce2 Go] (rev b2))

Nouveau kernel module crashes at boot, trying to enable outputs.
It can not detect any modes.

All the outputs are turned off when the bug happens, so the system is unusable.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1400170439.E8DFB1.16012
Date: Thu, 15 May 2014 16:13:59 +0000
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
   title="NEW --- - Nouveau fails initializing KMS on Geforce2 Go (NV11M)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78748">78748</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Nouveau fails initializing KMS on Geforce2 Go (NV11M)
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>blocker
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
          <td>isma.casti&#64;gmail.com
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
        <pre>Created <span class=""><a href="attachment.cgi?id=99105" name="attach_99105" title="Video bios (10de:0112 NVIDIA Corporation NV11M [GeForce2 Go] (rev b2))">attachment 99105</a> <a href="attachment.cgi?id=99105&amp;action=edit" title="Video bios (10de:0112 NVIDIA Corporation NV11M [GeForce2 Go] (rev b2))">[details]</a></span>
Video bios (10de:0112 NVIDIA Corporation NV11M [GeForce2 Go] (rev b2))

Nouveau kernel module crashes at boot, trying to enable outputs.
It can not detect any modes.

All the outputs are turned off when the bug happens, so the system is unusable.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1400170439.E8DFB1.16012--

--===============1052128861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1052128861==--
