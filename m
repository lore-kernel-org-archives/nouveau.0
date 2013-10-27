From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70927] New: nv50_instobj_wr32 kernel panic
Date: Sun, 27 Oct 2013 18:02:42 +0000
Message-ID: <bug-70927-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1732158384=="
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


--===============1732158384==
Content-Type: multipart/alternative; boundary="1382896962.6a080.28192"; charset="us-ascii"


--1382896962.6a080.28192
Date: Sun, 27 Oct 2013 18:02:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70927

          Priority: medium
            Bug ID: 70927
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: nv50_instobj_wr32 kernel panic
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: antoniovazquezblanco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: 9.2
         Component: Drivers/DRI/nouveau
           Product: Mesa

Created attachment 88189
  --> https://bugs.freedesktop.org/attachment.cgi?id=88189&action=edit
Kernel panic log.

I usually get kernel panics on my Alienware M14X R2.

Using Archlinux up to date.
Linux alienarch 3.11.6-1-ARCH #1 SMP PREEMPT Fri Oct 18 23:22:36 CEST 2013
x86_64 GNU/Linux

Nouveau is at 9.2.2

Kernel panic log attached.

What else can I do in order to help?

Thanks.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1382896962.6a080.28192
Date: Sun, 27 Oct 2013 18:02:42 +0000
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
   title="NEW --- - nv50_instobj_wr32 kernel panic"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70927">70927</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nv50_instobj_wr32 kernel panic
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
          <td>antoniovazquezblanco&#64;gmail.com
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
          <td>9.2
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
        <pre>Created <span class=""><a href="attachment.cgi?id=88189" name="attach_88189" title="Kernel panic log.">attachment 88189</a> <a href="attachment.cgi?id=88189&amp;action=edit" title="Kernel panic log.">[details]</a></span>
Kernel panic log.

I usually get kernel panics on my Alienware M14X R2.

Using Archlinux up to date.
Linux alienarch 3.11.6-1-ARCH #1 SMP PREEMPT Fri Oct 18 23:22:36 CEST 2013
x86_64 GNU/Linux

Nouveau is at 9.2.2

Kernel panic log attached.

What else can I do in order to help?

Thanks.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1382896962.6a080.28192--

--===============1732158384==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1732158384==--
