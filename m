From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71116] New: [Ubuntu userspace upgrade 13.04 ->
 13.10][regression] NV34 card fails to properly resume.
Date: Fri, 01 Nov 2013 08:40:06 +0000
Message-ID: <bug-71116-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0982011359=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============0982011359==
Content-Type: multipart/alternative; boundary="1383295206.0f821.1986"; charset="us-ascii"


--1383295206.0f821.1986
Date: Fri, 1 Nov 2013 08:40:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71116

          Priority: medium
            Bug ID: 71116
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [Ubuntu userspace upgrade 13.04 -> 13.10][regression]
                    NV34 card fails to properly resume.
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: 7.7 (2011)
         Component: Driver/nouveau
           Product: xorg

Created attachment 88462
  --> https://bugs.freedesktop.org/attachment.cgi?id=88462&action=edit
Attempt to resume

[    0.197865] nouveau  [  DEVICE][0000:01:00.0] Chipset: NV34 (NV34)
[    0.197869] nouveau  [  DEVICE][0000:01:00.0] Family : NV30

After *only upgrading userspace* from Ubuntu 13.04 to Ubuntu 13.10 the card
fails to properly resume from s2disk.

Important upgraded packages:

xserver-xorg-core:i386 2:1.13.3-0ubuntu6.2 -> 2:1.14.3-3ubuntu2
xserver-xorg-video-nouveau:i386 1:1.0.7-0ubuntu1 -> 1:1.0.9-2ubuntu1
libdrm2:i386 2.4.43-0ubuntu1.1 -> 2.4.46-1
libpciaccess0:i386 0.13.1-2 -> 0.13.2-1

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1383295206.0f821.1986
Date: Fri, 1 Nov 2013 08:40:06 +0000
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
   title="NEW --- - [Ubuntu userspace upgrade 13.04 -&gt; 13.10][regression] NV34 card fails to properly resume."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71116">71116</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[Ubuntu userspace upgrade 13.04 -&gt; 13.10][regression] NV34 card fails to properly resume.
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
          <td>ronald645&#64;gmail.com
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
          <td>7.7 (2011)
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
        <pre>Created <span class=""><a href="attachment.cgi?id=88462" name="attach_88462" title="Attempt to resume">attachment 88462</a> <a href="attachment.cgi?id=88462&amp;action=edit" title="Attempt to resume">[details]</a></span>
Attempt to resume

[    0.197865] nouveau  [  DEVICE][0000:01:00.0] Chipset: NV34 (NV34)
[    0.197869] nouveau  [  DEVICE][0000:01:00.0] Family : NV30

After *only upgrading userspace* from Ubuntu 13.04 to Ubuntu 13.10 the card
fails to properly resume from s2disk.

Important upgraded packages:

xserver-xorg-core:i386 2:1.13.3-0ubuntu6.2 -&gt; 2:1.14.3-3ubuntu2
xserver-xorg-video-nouveau:i386 1:1.0.7-0ubuntu1 -&gt; 1:1.0.9-2ubuntu1
libdrm2:i386 2.4.43-0ubuntu1.1 -&gt; 2.4.46-1
libpciaccess0:i386 0.13.1-2 -&gt; 0.13.2-1</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1383295206.0f821.1986--

--===============0982011359==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0982011359==--
