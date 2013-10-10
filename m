From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70354] New: Failed to initialise context object:
 2D_NVC0 (0) (for my GeForce GT 750M)
Date: Thu, 10 Oct 2013 19:35:40 +0000
Message-ID: <bug-70354-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0984668972=="
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


--===============0984668972==
Content-Type: multipart/alternative; boundary="1381433741.Ae4fFC381.32138"; charset="us-ascii"


--1381433741.Ae4fFC381.32138
Date: Thu, 10 Oct 2013 19:35:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70354

          Priority: medium
            Bug ID: 70354
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Failed to initialise context object: 2D_NVC0 (0) (for
                    my GeForce GT 750M)
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: fred.new2911-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 87411
  --> https://bugs.freedesktop.org/attachment.cgi?id=87411&action=edit
Xorg.0.log

It looks like my new HP Envy 17, Intel Core i7-4702MQ (Haswell), Nvidia GeForce
GT 750M is a little too bleeding edge. Initialisation of the GT 750M fails and
the integrated graphics controller is used.

My operating system is Fedora 20 (beta) with Linux kernel
3.11.3-301.bz105920.fc20.x86_64. This is the 3.11.3-301.fc20.x86_64 kernel with
two patches from freedesktop bug 70208 applied - patches from comment 6 and
comment 10.

The xorg nouveau driver from Fedora is
xorg-x11-drv-nouveau-1.0.9-2.fc20.x86_64.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381433741.Ae4fFC381.32138
Date: Thu, 10 Oct 2013 19:35:41 +0000
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
   title="NEW --- - Failed to initialise context object: 2D_NVC0 (0) (for my GeForce GT 750M)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354">70354</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Failed to initialise context object: 2D_NVC0 (0) (for my GeForce GT 750M)
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
          <td>fred.new2911&#64;gmail.com
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
        <pre>Created <span class=""><a href="attachment.cgi?id=87411" name="attach_87411" title="Xorg.0.log">attachment 87411</a> <a href="attachment.cgi?id=87411&amp;action=edit" title="Xorg.0.log">[details]</a></span>
Xorg.0.log

It looks like my new HP Envy 17, Intel Core i7-4702MQ (Haswell), Nvidia GeForce
GT 750M is a little too bleeding edge. Initialisation of the GT 750M fails and
the integrated graphics controller is used.

My operating system is Fedora 20 (beta) with Linux kernel
3.11.3-301.bz105920.fc20.x86_64. This is the 3.11.3-301.fc20.x86_64 kernel with
two patches from freedesktop <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Nouveau driver doesn't find vbios for Geforce GT 750M on Asus N750JV laptop"
   href="show_bug.cgi?id=70208">bug 70208</a> applied - patches from <a href="show_bug.cgi?id=70354#c6">comment 6</a> and
<a href="show_bug.cgi?id=70354#c10">comment 10</a>.

The xorg nouveau driver from Fedora is
xorg-x11-drv-nouveau-1.0.9-2.fc20.x86_64.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1381433741.Ae4fFC381.32138--

--===============0984668972==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0984668972==--
