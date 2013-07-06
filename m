From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 66642] New: [nva5] Wrong provoking vertex is
 selected for flat attribute interpolation (clipping?)
Date: Sat, 06 Jul 2013 11:53:08 +0000
Message-ID: <bug-66642-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1389438628=="
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


--===============1389438628==
Content-Type: multipart/alternative; boundary="1373111588.FF0ccA0.29795"; charset="us-ascii"


--1373111588.FF0ccA0.29795
Date: Sat, 6 Jul 2013 11:53:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=66642

          Priority: medium
            Bug ID: 66642
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [nva5] Wrong provoking vertex is selected for flat
                    attribute interpolation (clipping?)
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: alzeih-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: git
         Component: Drivers/DRI/nouveau
           Product: Mesa

The following piglit test:

  interpolation-flat-gl_BackColor-smooth-none.shader_test

appears to select the wrong provoking vertex depending on the exact value of
v[0].y.

For v[0].y > -1.0, the triangle ends up red.
For v[0].y = -1.0, the triangle ends up green.
For v[0].y < -1.0, the triangle ends up (correctly) blue.

Hardware: nva5 (GT330M) in MacBookPro6,2
Mesa version: 1415a1884c
Kernel: 3.9.8-1-ARCH

Suspect the clipper doesn't respect the index of the provoking vertex in the
triangle?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1373111588.FF0ccA0.29795
Date: Sat, 6 Jul 2013 11:53:08 +0000
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
   title="NEW --- - [nva5] Wrong provoking vertex is selected for flat attribute interpolation (clipping?)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66642">66642</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[nva5] Wrong provoking vertex is selected for flat attribute interpolation (clipping?)
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
          <td>alzeih&#64;gmail.com
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
        <pre>The following piglit test:

  interpolation-flat-gl_BackColor-smooth-none.shader_test

appears to select the wrong provoking vertex depending on the exact value of
v[0].y.

For v[0].y &gt; -1.0, the triangle ends up red.
For v[0].y = -1.0, the triangle ends up green.
For v[0].y &lt; -1.0, the triangle ends up (correctly) blue.

Hardware: nva5 (GT330M) in MacBookPro6,2
Mesa version: 1415a1884c
Kernel: 3.9.8-1-ARCH

Suspect the clipper doesn't respect the index of the provoking vertex in the
triangle?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1373111588.FF0ccA0.29795--

--===============1389438628==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1389438628==--
