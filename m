From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 55512] New: [GT520] GPU hang on 3d applications
Date: Mon, 01 Oct 2012 20:21:04 +0000
Message-ID: <bug-55512-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1200072822=="
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


--===============1200072822==
Content-Type: multipart/alternative; boundary="1349122864.B7Df0.8343"; charset="us-ascii"


--1349122864.B7Df0.8343
Date: Mon, 1 Oct 2012 20:21:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=55512

          Priority: medium
            Bug ID: 55512
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [GT520] GPU hang on 3d applications
          Severity: major
    Classification: Unclassified
                OS: Linux (All)
          Reporter: vova7890-JGs/UdohzUI@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: git
         Component: Drivers/DRI/nouveau
           Product: Mesa

Created attachment 67947
  --> https://bugs.freedesktop.org/attachment.cgi?id=67947&action=edit
dmesg

When booting kernel with nouveau.noaccel=0 and running any application uses 3d
acceleration(for example weston or gears on X or kwin effects) GPU is hang.
Problems only with gt520, or on all 5xx series(fermi)? How can I help to fix
that?

Installed packages:

$ uname -a
Linux localhost 3.5.4-1-ARCH #1 SMP PREEMPT Sat Sep 15 08:12:04 CEST 2012
x86_64 GNU/Linux

mesa-git
libdrm-git

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1349122864.B7Df0.8343
Date: Mon, 1 Oct 2012 20:21:04 +0000
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
   title="NEW --- - [GT520] GPU hang on 3d applications"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=55512">55512</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[GT520] GPU hang on 3d applications
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
          <td>vova7890&#64;mail.ru
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
        <pre>Created <span class=""><a href="attachment.cgi?id=67947" name="attach_67947" title="dmesg">attachment 67947</a> <a href="attachment.cgi?id=67947&amp;action=edit" title="dmesg">[details]</a></span>
dmesg

When booting kernel with nouveau.noaccel=0 and running any application uses 3d
acceleration(for example weston or gears on X or kwin effects) GPU is hang.
Problems only with gt520, or on all 5xx series(fermi)? How can I help to fix
that?

Installed packages:

$ uname -a
Linux localhost 3.5.4-1-ARCH #1 SMP PREEMPT Sat Sep 15 08:12:04 CEST 2012
x86_64 GNU/Linux

mesa-git
libdrm-git</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1349122864.B7Df0.8343--

--===============1200072822==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1200072822==--
