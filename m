From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77857] New: Second Monitor
Date: Thu, 24 Apr 2014 03:37:56 +0000
Message-ID: <bug-77857-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0158869585=="
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


--===============0158869585==
Content-Type: multipart/alternative; boundary="1398310676.777431.22501"; charset="us-ascii"


--1398310676.777431.22501
Date: Thu, 24 Apr 2014 03:37:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77857

          Priority: medium
            Bug ID: 77857
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Second Monitor
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: major
    Classification: Unclassified
                OS: Linux (All)
          Reporter: eagle_boy-ur4TIblo6goN+BqQ9rBEUg@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 97852
  --> https://bugs.freedesktop.org/attachment.cgi?id=97852&action=edit
Xorg.0.log

When I updated to kernel 3.11.0-20 my second monitor stop working. I looked at
the display manager and it only show one Display available and it's setup to
default vesa settings.

I restarted my box using kernel 3.11.0-19 it all works fine.

I don't know if a change in the kernel was the reason why my monitor stopped
working of if it was a change in the drivers that happend at the same time the
kernel was updated.

I looked in the Xorg.0.log file and the only errors I found are the following:
-- [drm] KMS not enabled
-- No devices detected.
-- NVIDIA: Failed to load the NVIDIA kernel module. Please check your NVIDIA:  
  system's kernel log for additional error messages.
--  open /dev/dri/card0: No such file or directory
-- Failed to initialize GLX extension (Compatible NVIDIA X driver not found)


My Specs:
-- X.Org X Server 1.14.5
-- Operating System: Linux 3.2.0-37-generic x86_64 Ubuntu
   ** 3.11.0-20-generic #34-Ubuntu SMP Tue Apr 1 20:40:25 UTC 2014 x86_64
-- xorg-server 2:1.14.5-1ubuntu2~saucy1
-- Module nouveau: 1.14.5, module version = 1.0.10 ABI class: X.Org Video
Driver, version 14.1
-- Module nvidia: 4.0.2, module version = 1.0.0 Module class: X.Org Video
Driver

-- Video Card: GeForce 9800 GTX
-- CPU: AMD Athlon(tm) 64 X2 Dual Core Processor 6400+
-- Memory: 12 Gb

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1398310676.777431.22501
Date: Thu, 24 Apr 2014 03:37:56 +0000
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
   title="NEW --- - Second Monitor"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77857">77857</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Second Monitor
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
          <td>eagle_boy&#64;rocketmail.com
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
        <pre>Created <span class=""><a href="attachment.cgi?id=97852" name="attach_97852" title="Xorg.0.log">attachment 97852</a> <a href="attachment.cgi?id=97852&amp;action=edit" title="Xorg.0.log">[details]</a></span>
Xorg.0.log

When I updated to kernel 3.11.0-20 my second monitor stop working. I looked at
the display manager and it only show one Display available and it's setup to
default vesa settings.

I restarted my box using kernel 3.11.0-19 it all works fine.

I don't know if a change in the kernel was the reason why my monitor stopped
working of if it was a change in the drivers that happend at the same time the
kernel was updated.

I looked in the Xorg.0.log file and the only errors I found are the following:
-- [drm] KMS not enabled
-- No devices detected.
-- NVIDIA: Failed to load the NVIDIA kernel module. Please check your NVIDIA:  
  system's kernel log for additional error messages.
--  open /dev/dri/card0: No such file or directory
-- Failed to initialize GLX extension (Compatible NVIDIA X driver not found)


My Specs:
-- X.Org X Server 1.14.5
-- Operating System: Linux 3.2.0-37-generic x86_64 Ubuntu
   ** 3.11.0-20-generic #34-Ubuntu SMP Tue Apr 1 20:40:25 UTC 2014 x86_64
-- xorg-server 2:1.14.5-1ubuntu2~saucy1
-- Module nouveau: 1.14.5, module version = 1.0.10 ABI class: X.Org Video
Driver, version 14.1
-- Module nvidia: 4.0.2, module version = 1.0.0 Module class: X.Org Video
Driver

-- Video Card: GeForce 9800 GTX
-- CPU: AMD Athlon(tm) 64 X2 Dual Core Processor 6400+
-- Memory: 12 Gb</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1398310676.777431.22501--

--===============0158869585==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0158869585==--
