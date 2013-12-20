From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 72939] New: [nv96] Freespace 2 open crashes
Date: Fri, 20 Dec 2013 23:05:10 +0000
Message-ID: <bug-72939-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1208927117=="
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


--===============1208927117==
Content-Type: multipart/alternative; boundary="1387580709.B8FA0.16408"; charset="us-ascii"


--1387580709.B8FA0.16408
Date: Fri, 20 Dec 2013 23:05:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=72939

          Priority: medium
            Bug ID: 72939
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [nv96] Freespace 2 open crashes
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: git
         Component: Drivers/DRI/nouveau
           Product: Mesa

This has been an issue for much longer, it looks to be a memory related
problem. Textures are corrupted and after a little while the card hangs. I've
confirmed with the binary blob that the hardware works fine.

The errors that i got were:
Dec 20 22:12:41 madman kernel: [   66.490366] nouveau E[  PGRAPH][0000:01:00.0]
TRAP_MP_EXEC - TP 0 MP 0: INVALID_OPCODE at 07d7e0 warp 15, opcode 80070279
00060780
Dec 20 22:12:41 madman kernel: [   66.490379] nouveau E[  PGRAPH][0000:01:00.0]
TRAP_MP_EXEC - TP 0 MP 1: INVALID_OPCODE at 07d7e0 warp 1, opcode 80070279
00060780
Dec 20 22:12:41 madman kernel: [   66.490384] nouveau E[  PGRAPH][0000:01:00.0]
 TRAP
Dec 20 22:12:41 madman kernel: [   66.490390] nouveau E[  PGRAPH][0000:01:00.0]
ch 4 [0x001f91e000 fs2_open[2611]] subc 3 class 0x8297 mthd 0x15f0 data
0x0dd80dd8

This was with a 3.13-rc4 kernel and a very recent git mesa (also tried mesa
9.25, had the same problem).

In general i don't think any graphic intensive runs for a very long time. It's
just that this one is very easy to make crash.

My question is, what can i do to narrow this down? Keep in mind that this has
been going on for more than 6 months probably (maybe even a year) and I can't
take my kernel too far back into the past (because my system is compiled
against modern linux headers).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1387580709.B8FA0.16408
Date: Fri, 20 Dec 2013 23:05:09 +0000
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
   title="NEW --- - [nv96] Freespace 2 open crashes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72939">72939</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[nv96] Freespace 2 open crashes
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
          <td>madman2003&#64;gmail.com
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
          <td>git
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr></table>
      <p>
        <div>
        <pre>This has been an issue for much longer, it looks to be a memory related
problem. Textures are corrupted and after a little while the card hangs. I've
confirmed with the binary blob that the hardware works fine.

The errors that i got were:
Dec 20 22:12:41 madman kernel: [   66.490366] nouveau E[  PGRAPH][0000:01:00.0]
TRAP_MP_EXEC - TP 0 MP 0: INVALID_OPCODE at 07d7e0 warp 15, opcode 80070279
00060780
Dec 20 22:12:41 madman kernel: [   66.490379] nouveau E[  PGRAPH][0000:01:00.0]
TRAP_MP_EXEC - TP 0 MP 1: INVALID_OPCODE at 07d7e0 warp 1, opcode 80070279
00060780
Dec 20 22:12:41 madman kernel: [   66.490384] nouveau E[  PGRAPH][0000:01:00.0]
 TRAP
Dec 20 22:12:41 madman kernel: [   66.490390] nouveau E[  PGRAPH][0000:01:00.0]
ch 4 [0x001f91e000 fs2_open[2611]] subc 3 class 0x8297 mthd 0x15f0 data
0x0dd80dd8

This was with a 3.13-rc4 kernel and a very recent git mesa (also tried mesa
9.25, had the same problem).

In general i don't think any graphic intensive runs for a very long time. It's
just that this one is very easy to make crash.

My question is, what can i do to narrow this down? Keep in mind that this has
been going on for more than 6 months probably (maybe even a year) and I can't
take my kernel too far back into the past (because my system is compiled
against modern linux headers).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1387580709.B8FA0.16408--

--===============1208927117==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1208927117==--
