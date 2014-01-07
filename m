From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73358] New: [nv34] adobe flash + firefox ->
	DATA_ERROR
Date: Tue, 07 Jan 2014 14:02:57 +0000
Message-ID: <bug-73358-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0784830301=="
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


--===============0784830301==
Content-Type: multipart/alternative; boundary="1389103377.ec641d1.14739"; charset="us-ascii"


--1389103377.ec641d1.14739
Date: Tue, 7 Jan 2014 14:02:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73358

          Priority: medium
            Bug ID: 73358
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [nv34] adobe flash + firefox -> DATA_ERROR
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Trying to run a Youtube clip in Firefox:

(I managed to get these out of journalctl)

Jan 07 14:48:59 Delta kernel: nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource:
DATA_ERROR nstatus: BAD_ARGUMENT
Jan 07 14:48:59 Delta kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 3
[plugin-containe[901]] subc 7 class 0x0697 mthd 0x0208 data 0x00000120
Jan 07 14:48:59 Delta kernel: nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource:
LIMIT_COLOR nstatus: BAD_ARGUMENT PROTECTION_FAULT
Jan 07 14:48:59 Delta kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 3
[plugin-containe[901]] subc 7 class 0x0697 mthd 0x0204 data 0x00b80000
Jan 07 14:48:59 Delta kernel: nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource:
DATA_ERROR nstatus: BAD_ARGUMENT PROTECTION_FAULT
Jan 07 14:48:59 Delta kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 3
[plugin-containe[901]] subc 7 class 0x0697 mthd 0x0208 data 0x00000120
Jan 07 14:48:59 Delta kernel: nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource:
DATA_ERROR nstatus: BAD_ARGUMENT PROTECTION_FAULT
Jan 07 14:48:59 Delta kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 3
[plugin-containe[901]] subc 7 class 0x0697 mthd 0x0208 data 0x00000120
Jan 07 14:48:59 Delta kernel: nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource:
DATA_ERROR nstatus: BAD_ARGUMENT PROTECTION_FAULT
Jan 07 14:48:59 Delta kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 3
[plugin-containe[901]] subc 7 class 0x0697 mthd 0x0208 data 0x00000120
Jan 07 14:48:59 Delta kernel: nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource:
DATA_ERROR nstatus: BAD_ARGUMENT PROTECTION_FAULT
Jan 07 14:48:59 Delta kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 3
[plugin-containe[901]] subc 7 class 0x0697 mthd 0x0208 data 0x00000120

Versions:
libdrm 2.4.50-1
mesa 10.0.1-2
xorg-server 1.14.5-1
xf86-video-nouveau 1.0.10-1
kernel 3.13.0-rc7-00055-gef350bb

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389103377.ec641d1.14739
Date: Tue, 7 Jan 2014 14:02:57 +0000
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
   title="NEW --- - [nv34] adobe flash + firefox -&gt; DATA_ERROR"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73358">73358</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[nv34] adobe flash + firefox -&gt; DATA_ERROR
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
          <td>All
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>ronald645&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
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
        <pre>Trying to run a Youtube clip in Firefox:

(I managed to get these out of journalctl)

Jan 07 14:48:59 Delta kernel: nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource:
DATA_ERROR nstatus: BAD_ARGUMENT
Jan 07 14:48:59 Delta kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 3
[plugin-containe[901]] subc 7 class 0x0697 mthd 0x0208 data 0x00000120
Jan 07 14:48:59 Delta kernel: nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource:
LIMIT_COLOR nstatus: BAD_ARGUMENT PROTECTION_FAULT
Jan 07 14:48:59 Delta kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 3
[plugin-containe[901]] subc 7 class 0x0697 mthd 0x0204 data 0x00b80000
Jan 07 14:48:59 Delta kernel: nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource:
DATA_ERROR nstatus: BAD_ARGUMENT PROTECTION_FAULT
Jan 07 14:48:59 Delta kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 3
[plugin-containe[901]] subc 7 class 0x0697 mthd 0x0208 data 0x00000120
Jan 07 14:48:59 Delta kernel: nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource:
DATA_ERROR nstatus: BAD_ARGUMENT PROTECTION_FAULT
Jan 07 14:48:59 Delta kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 3
[plugin-containe[901]] subc 7 class 0x0697 mthd 0x0208 data 0x00000120
Jan 07 14:48:59 Delta kernel: nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource:
DATA_ERROR nstatus: BAD_ARGUMENT PROTECTION_FAULT
Jan 07 14:48:59 Delta kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 3
[plugin-containe[901]] subc 7 class 0x0697 mthd 0x0208 data 0x00000120
Jan 07 14:48:59 Delta kernel: nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource:
DATA_ERROR nstatus: BAD_ARGUMENT PROTECTION_FAULT
Jan 07 14:48:59 Delta kernel: nouveau E[  PGRAPH][0000:01:00.0] ch 3
[plugin-containe[901]] subc 7 class 0x0697 mthd 0x0208 data 0x00000120

Versions:
libdrm 2.4.50-1
mesa 10.0.1-2
xorg-server 1.14.5-1
xf86-video-nouveau 1.0.10-1
kernel 3.13.0-rc7-00055-gef350bb</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389103377.ec641d1.14739--

--===============0784830301==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0784830301==--
