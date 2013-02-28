From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61635] New: glVertexAttribPointer(id,
 GL_UNSIGNED_BYTE, GL_FALSE, ...) does not work
Date: Thu, 28 Feb 2013 21:02:30 +0000
Message-ID: <bug-61635-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0120110107=="
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


--===============0120110107==
Content-Type: multipart/alternative; boundary="1362085350.c1710.30941"; charset="us-ascii"


--1362085350.c1710.30941
Date: Thu, 28 Feb 2013 21:02:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=61635

          Priority: medium
            Bug ID: 61635
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: glVertexAttribPointer(id, GL_UNSIGNED_BYTE,
                    GL_FALSE,...) does not work
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: rodrigorivascosta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: git
         Component: Drivers/DRI/nouveau
           Product: Mesa

I have a  NVidia GeForce 7600GT with the latest git nouveau driver (Gallium 0.4
on NV4B) and kernel 3.7.9.

I found the following problem: calling the function glVertexAttribPointer(idx,
GL_UNSIGNED_BYTE, GL_FALSE,...) does not work, that is the previous attrib
pointer remains, and the nouveau driver outputs in the dmesg:

[ 2052.630628] nouveau  [  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[ 2052.630644] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x000dd000] subc 7 class
0x4097 mthd 0x1744 data 0x00001417

But glGetError() returns nothing unusual.

If I change the parameter from GL_UNSIGNED_BYTE to any other type (GL_BYTE,
GL_UNSIGNED_SHORT, GL_SHORT...) then it works as expected.

If I change the "normalized" parameter to GL_TRUE, it also works fine, even
with type GL_UNSIGNED_BYTE.

The software renderer does not have this problem. That and the kernel messages
suggest that it is a nouveau issue.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1362085350.c1710.30941
Date: Thu, 28 Feb 2013 21:02:30 +0000
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
   title="NEW --- - glVertexAttribPointer(id, GL_UNSIGNED_BYTE, GL_FALSE,...) does not work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61635">61635</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>glVertexAttribPointer(id, GL_UNSIGNED_BYTE, GL_FALSE,...) does not work
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
          <td>rodrigorivascosta&#64;gmail.com
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
        <pre>I have a  NVidia GeForce 7600GT with the latest git nouveau driver (Gallium 0.4
on NV4B) and kernel 3.7.9.

I found the following problem: calling the function glVertexAttribPointer(idx,
GL_UNSIGNED_BYTE, GL_FALSE,...) does not work, that is the previous attrib
pointer remains, and the nouveau driver outputs in the dmesg:

[ 2052.630628] nouveau  [  PGRAPH][0000:01:00.0]  ERROR nsource: DATA_ERROR
nstatus: BAD_ARGUMENT
[ 2052.630644] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x000dd000] subc 7 class
0x4097 mthd 0x1744 data 0x00001417

But glGetError() returns nothing unusual.

If I change the parameter from GL_UNSIGNED_BYTE to any other type (GL_BYTE,
GL_UNSIGNED_SHORT, GL_SHORT...) then it works as expected.

If I change the &quot;normalized&quot; parameter to GL_TRUE, it also works fine, even
with type GL_UNSIGNED_BYTE.

The software renderer does not have this problem. That and the kernel messages
suggest that it is a nouveau issue.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1362085350.c1710.30941--

--===============0120110107==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0120110107==--
