From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58615] New: nv43 hangs with direct rendering since
 3.7 rework
Date: Fri, 21 Dec 2012 12:18:43 +0000
Message-ID: <bug-58615-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1921676380=="
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


--===============1921676380==
Content-Type: multipart/alternative; boundary="1356092324.EeFB41.12781"; charset="us-ascii"


--1356092324.EeFB41.12781
Date: Fri, 21 Dec 2012 12:18:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58615

          Priority: medium
            Bug ID: 58615
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: nv43 hangs  with  direct  rendering  since 3.7 rework
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: randrik-JGs/UdohzUI@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

I  have  my  nv43 back  in  action -  and  unfortunately new  bugs  to report. 

When I compiled  new 3.7-rc  kernel  i  noticed   anything 3d  related, even 
trivial/tri  example from mesa/demos started  to  hang  my X server - usually 
I  was  able  to  switch  consoles  and reboot  clearly, but  not  always.
Strangely, _indirect_ rendering  worked  ok! kernels 3.4.6, 3.5.7, 3.6.x - all
OK.

will  add  kernel/X  log  after reboot into freshly  compiled  nouveau  kernel,
 now  I want to attach  partial  bisection  logs, done  with mainline  kernel.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1356092324.EeFB41.12781
Date: Fri, 21 Dec 2012 12:18:44 +0000
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
   title="NEW --- - nv43 hangs with direct rendering since 3.7 rework"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58615">58615</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nv43 hangs  with  direct  rendering  since 3.7 rework
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
          <td>randrik&#64;mail.ru
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
        <pre>I  have  my  nv43 back  in  action -  and  unfortunately new  bugs  to report. 

When I compiled  new 3.7-rc  kernel  i  noticed   anything 3d  related, even 
trivial/tri  example from mesa/demos started  to  hang  my X server - usually 
I  was  able  to  switch  consoles  and reboot  clearly, but  not  always.
Strangely, _indirect_ rendering  worked  ok! kernels 3.4.6, 3.5.7, 3.6.x - all
OK.

will  add  kernel/X  log  after reboot into freshly  compiled  nouveau  kernel,
 now  I want to attach  partial  bisection  logs, done  with mainline  kernel.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1356092324.EeFB41.12781--

--===============1921676380==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1921676380==--
