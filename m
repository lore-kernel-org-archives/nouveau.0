From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70212] New: glxinfo triggers assert in
 cso_release_all after 3f0627c2ad6
Date: Sun, 06 Oct 2013 23:48:20 +0000
Message-ID: <bug-70212-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1753968941=="
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


--===============1753968941==
Content-Type: multipart/alternative; boundary="1381103300.302BBA440.23561"; charset="us-ascii"


--1381103300.302BBA440.23561
Date: Sun, 6 Oct 2013 23:48:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70212

          Priority: medium
            Bug ID: 70212
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: glxinfo triggers assert in cso_release_all after
                    3f0627c2ad6
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: awatry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: All
            Status: NEW
           Version: git
         Component: Drivers/DRI/nouveau
           Product: Mesa

I just switched my GF9400M from Nvidia's blob to nouveau with mesa/drm from
git.

When executing glxinfo with git master, I get the following assert after the
list of core profile extensions are printed:

cso_cache/cso_context.c:315:cso_release_all: Assertion `max <= 16' failed.
Trace/breakpoint trap (core dumped)


I've bisected the regression to this commit:
3f0627c2ad605b006737312c478907859411ffa8 is the first bad commit
commit 3f0627c2ad605b006737312c478907859411ffa8
Author: Brian Paul <brianp-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>
Date:   Thu Sep 12 18:09:33 2013 -0600

    nouveau: implement pipe_context::bind_sampler_states()

:040000 040000 b09183c220eb383907e212299a3ed5d66bd26c18
cbfe533aeb6e5ff8648ac8efdf60a28b86ffe5e0 M    src

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381103300.302BBA440.23561
Date: Sun, 6 Oct 2013 23:48:20 +0000
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
   title="NEW --- - glxinfo triggers assert in cso_release_all after 3f0627c2ad6"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70212">70212</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>glxinfo triggers assert in cso_release_all after 3f0627c2ad6
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
          <td>awatry&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>All
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
        <pre>I just switched my GF9400M from Nvidia's blob to nouveau with mesa/drm from
git.

When executing glxinfo with git master, I get the following assert after the
list of core profile extensions are printed:

cso_cache/cso_context.c:315:cso_release_all: Assertion `max &lt;= 16' failed.
Trace/breakpoint trap (core dumped)


I've bisected the regression to this commit:
3f0627c2ad605b006737312c478907859411ffa8 is the first bad commit
commit 3f0627c2ad605b006737312c478907859411ffa8
Author: Brian Paul &lt;<a href="mailto:brianp&#64;vmware.com">brianp&#64;vmware.com</a>&gt;
Date:   Thu Sep 12 18:09:33 2013 -0600

    nouveau: implement pipe_context::bind_sampler_states()

:040000 040000 b09183c220eb383907e212299a3ed5d66bd26c18
cbfe533aeb6e5ff8648ac8efdf60a28b86ffe5e0 M    src</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1381103300.302BBA440.23561--

--===============1753968941==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1753968941==--
