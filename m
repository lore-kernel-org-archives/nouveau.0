From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64323] New: Severe misrendering in Left 4 Dead 2
Date: Tue, 07 May 2013 15:52:49 +0000
Message-ID: <bug-64323-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0043044541=="
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


--===============0043044541==
Content-Type: multipart/alternative; boundary="1367941969.b2cb8D0.9901"; charset="us-ascii"


--1367941969.b2cb8D0.9901
Date: Tue, 7 May 2013 15:52:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=64323

          Priority: medium
            Bug ID: 64323
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Severe misrendering in Left 4 Dead 2
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: bryancain3+fdo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: git
         Component: Drivers/DRI/nouveau
           Product: Mesa

This should be filed under component "Drivers/Gallium/nouveau", but that
doesn't exist for some reason.

In the nv50 driver, after loading a map in the Left 4 Dead 2 beta,  there are
major rendering artifacts that make the game unplayable.  Portal shows a
similar problem.

Noticing that stable versions before Mesa 9.1 don't have this problem, I
bisected the regression to this commit:

http://cgit.freedesktop.org/mesa/mesa/commit/?h=48a45ec24ae74c0

commit 48a45ec24ae74c00d1487552e94d9f824a428f58
Author: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date:   Tue Jan 8 16:13:11 2013 +0100

    nouveau: improve buffer transfers

    Save double memcpy on uploads to VRAM in most cases.
    Properly handle FLUSH_EXPLICIT.
    Reallocate on DISCARD_WHOLE_RESOURCE to avoid sync.

I don't understand the changes made by this commit well enough to fix the
regression myself.  I have an apitrace that can be used to reproduce the issue,
and will comment on this bug with a link to it as soon as I find a good way to
share large (~512 MB) files online.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1367941969.b2cb8D0.9901
Date: Tue, 7 May 2013 15:52:49 +0000
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
   title="NEW --- - Severe misrendering in Left 4 Dead 2"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64323">64323</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Severe misrendering in Left 4 Dead 2
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
          <td>bryancain3+fdo&#64;gmail.com
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
        <pre>This should be filed under component &quot;Drivers/Gallium/nouveau&quot;, but that
doesn't exist for some reason.

In the nv50 driver, after loading a map in the Left 4 Dead 2 beta,  there are
major rendering artifacts that make the game unplayable.  Portal shows a
similar problem.

Noticing that stable versions before Mesa 9.1 don't have this problem, I
bisected the regression to this commit:

<a href="http://cgit.freedesktop.org/mesa/mesa/commit/?h=48a45ec24ae74c0">http://cgit.freedesktop.org/mesa/mesa/commit/?h=48a45ec24ae74c0</a>

commit 48a45ec24ae74c00d1487552e94d9f824a428f58
Author: Christoph Bumiller &lt;<a href="mailto:e0425955&#64;student.tuwien.ac.at">e0425955&#64;student.tuwien.ac.at</a>&gt;
Date:   Tue Jan 8 16:13:11 2013 +0100

    nouveau: improve buffer transfers

    Save double memcpy on uploads to VRAM in most cases.
    Properly handle FLUSH_EXPLICIT.
    Reallocate on DISCARD_WHOLE_RESOURCE to avoid sync.

I don't understand the changes made by this commit well enough to fix the
regression myself.  I have an apitrace that can be used to reproduce the issue,
and will comment on this bug with a link to it as soon as I find a good way to
share large (~512 MB) files online.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1367941969.b2cb8D0.9901--

--===============0043044541==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0043044541==--
