From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58806] New: failed to create kernel channel,
	-12 on G4 PPC
Date: Thu, 27 Dec 2012 14:33:41 +0000
Message-ID: <bug-58806-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2010277473=="
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


--===============2010277473==
Content-Type: multipart/alternative; boundary="1356618821.2E1aa4a1.20882"; charset="us-ascii"


--1356618821.2E1aa4a1.20882
Date: Thu, 27 Dec 2012 14:33:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58806

          Priority: medium
            Bug ID: 58806
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: failed to create kernel channel, -12 on G4 PPC
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: stefan-01bSGNrlLMOzQB+pC5nmwQ@public.gmane.org
          Hardware: PowerPC
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

Created attachment 72184
  --> https://bugs.freedesktop.org/attachment.cgi?id=72184&action=edit
Bisecting between v3.6 and v3.7

The v3.7 version of nouveau fails to set up acceleration, while it does work
for v3.6. We have tried to bisect the problem but stubled on a change we cannot
beyond:

git show 77145f1cbdf8d28b46ff8070ca749bad821e0774 --
drivers/gpu/drm/nouveau/core/subdev/bios/base.c

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1356618821.2E1aa4a1.20882
Date: Thu, 27 Dec 2012 14:33:41 +0000
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
   title="NEW --- - failed to create kernel channel, -12 on G4 PPC"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58806">58806</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>failed to create kernel channel, -12 on G4 PPC
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
          <td>stefan&#64;konink.de
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>PowerPC
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
        <pre>Created <span class=""><a href="attachment.cgi?id=72184" name="attach_72184" title="Bisecting between v3.6 and v3.7">attachment 72184</a> <a href="attachment.cgi?id=72184&amp;action=edit" title="Bisecting between v3.6 and v3.7">[details]</a></span>
Bisecting between v3.6 and v3.7

The v3.7 version of nouveau fails to set up acceleration, while it does work
for v3.6. We have tried to bisect the problem but stubled on a change we cannot
beyond:

git show 77145f1cbdf8d28b46ff8070ca749bad821e0774 --
drivers/gpu/drm/nouveau/core/subdev/bios/base.c</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1356618821.2E1aa4a1.20882--

--===============2010277473==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2010277473==--
