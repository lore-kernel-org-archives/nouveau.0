From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74492] New: v3.13-rc8 nv4e + msi = random lockups
Date: Tue, 04 Feb 2014 07:56:19 +0000
Message-ID: <bug-74492-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2046549330=="
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


--===============2046549330==
Content-Type: multipart/alternative; boundary="1391500579.42a0231.11025"; charset="us-ascii"


--1391500579.42a0231.11025
Date: Tue, 4 Feb 2014 07:56:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74492

          Priority: medium
            Bug ID: 74492
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: v3.13-rc8 nv4e + msi = random lockups
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

Created attachment 93341
  --> https://bugs.freedesktop.org/attachment.cgi?id=93341&action=edit
Full dmesg of a clean boot

Kind of looks like bug #73445.

For me, it happens:

- almost at random with intervals of hours ranging to days (dammit...)
- not (yet) in OpenGL apps (I don't play games anymore)
- hangs in firefox , evince
- happens while scrolling but also happens during 'stationary' display

The symptoms are:

- relatively small corruption (10 %) which changes over time somewhat slightly
- disk writes only happen in periodic spurs with long pauses (SysRQ + S) did
not help

Eventually I'm dumped to terminal with an oops, but I don't see anything
nouveau related in there. Attaching it anyway.

nouveau.config=NvMSI=0 'fixes' it. Or let me put it this way: It never occurred
while using this parameter.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391500579.42a0231.11025
Date: Tue, 4 Feb 2014 07:56:19 +0000
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
   title="NEW --- - v3.13-rc8 nv4e + msi = random lockups"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74492">74492</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>v3.13-rc8 nv4e + msi = random lockups
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
          <td>git
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
        <pre>Created <span class=""><a href="attachment.cgi?id=93341" name="attach_93341" title="Full dmesg of a clean boot">attachment 93341</a> <a href="attachment.cgi?id=93341&amp;action=edit" title="Full dmesg of a clean boot">[details]</a></span>
Full dmesg of a clean boot

Kind of looks like <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV4E] regression with 3.13 -rcX: glxgears etc. hard lockup/freezes machine, on 3.12 everything works"
   href="show_bug.cgi?id=73445">bug #73445</a>.

For me, it happens:

- almost at random with intervals of hours ranging to days (dammit...)
- not (yet) in OpenGL apps (I don't play games anymore)
- hangs in firefox , evince
- happens while scrolling but also happens during 'stationary' display

The symptoms are:

- relatively small corruption (10 %) which changes over time somewhat slightly
- disk writes only happen in periodic spurs with long pauses (SysRQ + S) did
not help

Eventually I'm dumped to terminal with an oops, but I don't see anything
nouveau related in there. Attaching it anyway.

nouveau.config=NvMSI=0 'fixes' it. Or let me put it this way: It never occurred
while using this parameter.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1391500579.42a0231.11025--

--===============2046549330==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2046549330==--
