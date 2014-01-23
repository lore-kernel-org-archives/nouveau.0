From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74002] New: [un]docking Lenovo W530 results in
	interrupt storm
Date: Thu, 23 Jan 2014 23:38:42 +0000
Message-ID: <bug-74002-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0776719391=="
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


--===============0776719391==
Content-Type: multipart/alternative; boundary="1390520322.BFaabB1.27299"; charset="us-ascii"


--1390520322.BFaabB1.27299
Date: Thu, 23 Jan 2014 23:38:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74002

          Priority: medium
            Bug ID: 74002
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [un]docking Lenovo W530 results in interrupt storm
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: major
    Classification: Unclassified
                OS: Linux (All)
          Reporter: jcollins-u0TlgVUp4POoiH3BShWgcg@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 92699
  --> https://bugs.freedesktop.org/attachment.cgi?id=92699&action=edit
vbios

Running a 3.13 kernel, built from upstream git repository (commit
d8ec26d7f8287f5788a494f56e8814210f0e64be).

I'm able to consistently generate an ongoing interrupt storm by [un]docking my
Lenovo W530 when using the nouveau driver.  This problem was first noticed
under a 3.10 kernel and associated nouveau driver.  I then switched to the
above 3.13 kernel for the MSI interrupt support and to see if the problem
persisted.

The attached nouveau.interrupts is the output of read_interrupts, the source
for which is here: http://www.darnok.org/xen/read_interrupts.c.  This file
shows the interrupts generated during 5 second intervals.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1390520322.BFaabB1.27299
Date: Thu, 23 Jan 2014 23:38:42 +0000
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
   title="NEW --- - [un]docking Lenovo W530 results in interrupt storm"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74002">74002</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[un]docking Lenovo W530 results in interrupt storm
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
          <td>jcollins&#64;asgardsrealm.net
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
        <pre>Created <span class=""><a href="attachment.cgi?id=92699" name="attach_92699" title="vbios">attachment 92699</a> <a href="attachment.cgi?id=92699&amp;action=edit" title="vbios">[details]</a></span>
vbios

Running a 3.13 kernel, built from upstream git repository (commit
d8ec26d7f8287f5788a494f56e8814210f0e64be).

I'm able to consistently generate an ongoing interrupt storm by [un]docking my
Lenovo W530 when using the nouveau driver.  This problem was first noticed
under a 3.10 kernel and associated nouveau driver.  I then switched to the
above 3.13 kernel for the MSI interrupt support and to see if the problem
persisted.

The attached nouveau.interrupts is the output of read_interrupts, the source
for which is here: <a href="http://www.darnok.org/xen/read_interrupts.c">http://www.darnok.org/xen/read_interrupts.c</a>.  This file
shows the interrupts generated during 5 second intervals.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1390520322.BFaabB1.27299--

--===============0776719391==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0776719391==--
