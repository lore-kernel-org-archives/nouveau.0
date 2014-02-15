From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75013] New: [Quadro 600] [Ubuntu 13.10] Display
 update issues, stale rendered content
Date: Sat, 15 Feb 2014 09:50:29 +0000
Message-ID: <bug-75013-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1857479706=="
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


--===============1857479706==
Content-Type: multipart/alternative; boundary="1392457829.2E7b1.32362"; charset="us-ascii"


--1392457829.2E7b1.32362
Date: Sat, 15 Feb 2014 09:50:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75013

          Priority: medium
            Bug ID: 75013
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [Quadro 600] [Ubuntu 13.10] Display update issues,
                    stale rendered content
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: major
    Classification: Unclassified
                OS: Linux (All)
          Reporter: spartha80-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Occurance
The content onscreen is not updated frequntly, leading to stale content.
Manifestation  of the issue are mouse pointer trail, invalid text cursor
position while typing.The detailed logs are attached. The issue is not specific
to any application.

OS
Observed in 12.04, 12.10, 13.10 versions of Ubuntu.



//Kernel Logs
http://pastebin.ubuntu.com/6936221/

//glxinfo
http://pastebin.ubuntu.com/6936226/

//X logs
http://pastebin.ubuntu.com/6936239/

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392457829.2E7b1.32362
Date: Sat, 15 Feb 2014 09:50:29 +0000
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
   title="NEW --- - [Quadro 600] [Ubuntu 13.10] Display update issues, stale rendered content"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75013">75013</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[Quadro 600] [Ubuntu 13.10] Display update issues, stale rendered content
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
          <td>spartha80&#64;gmail.com
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
        <pre>Occurance
The content onscreen is not updated frequntly, leading to stale content.
Manifestation  of the issue are mouse pointer trail, invalid text cursor
position while typing.The detailed logs are attached. The issue is not specific
to any application.

OS
Observed in 12.04, 12.10, 13.10 versions of Ubuntu.



//Kernel Logs
<a href="http://pastebin.ubuntu.com/6936221/">http://pastebin.ubuntu.com/6936221/</a>

//glxinfo
<a href="http://pastebin.ubuntu.com/6936226/">http://pastebin.ubuntu.com/6936226/</a>

//X logs
<a href="http://pastebin.ubuntu.com/6936239/">http://pastebin.ubuntu.com/6936239/</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392457829.2E7b1.32362--

--===============1857479706==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1857479706==--
