From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 68402] New: Some elements are only rendered in
	top-left area
Date: Wed, 21 Aug 2013 20:49:17 +0000
Message-ID: <bug-68402-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0739570324=="
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


--===============0739570324==
Content-Type: multipart/alternative; boundary="1377118157.Bfdecc50.19002"; charset="us-ascii"


--1377118157.Bfdecc50.19002
Date: Wed, 21 Aug 2013 20:49:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=68402

          Priority: medium
            Bug ID: 68402
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Some elements are only rendered in top-left area
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: janmlynek0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: All
            Status: NEW
           Version: git
         Component: Drivers/DRI/nouveau
           Product: Mesa

Created attachment 84412
  --> https://bugs.freedesktop.org/attachment.cgi?id=84412&action=edit
dmesg log

Ubuntu 13.04 64-bit (affects both x86 and x86_64)
Kernel - from nouveau/linux-2.6 repo - HEAD is
3b56bba6abaa70d629fccdcf8490e087ea3a1ab4
X.Org X Server 1.13.4
Mesa version e6013e4bee7ebff6b7bd2f3b95eb16e8949e228c
Family: NVC0
Chipset: GF116 (NVCF) (GTX 550 Ti)

Some elements are only rendered in top-left area of the window (screenshot to
be included). This affects both Portal and Team Fortress 2.

I've done a bisection and this is the result:

2149ce41ed6b10f7bff65d7b3f23fd03b89753e3 is the first bad commit
commit 2149ce41ed6b10f7bff65d7b3f23fd03b89753e3
Author: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Date:   Sun Sep 30 22:59:34 2012 +0200

    nv50,nvc0: fix 3d engine blit for nvc0

:040000 040000 e0f165f869fed658f574a2719d0e841dda95139e
013265106fe6e2f2dab6b20811566fa5ba1106f3 M    src

There is nothing related to this issue in dmesg, but I'll include it anyway.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377118157.Bfdecc50.19002
Date: Wed, 21 Aug 2013 20:49:17 +0000
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
   title="NEW --- - Some elements are only rendered in top-left area"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68402">68402</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Some elements are only rendered in top-left area
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
          <td>janmlynek0&#64;gmail.com
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
        <pre>Created <span class=""><a href="attachment.cgi?id=84412" name="attach_84412" title="dmesg log">attachment 84412</a> <a href="attachment.cgi?id=84412&amp;action=edit" title="dmesg log">[details]</a></span>
dmesg log

Ubuntu 13.04 64-bit (affects both x86 and x86_64)
Kernel - from nouveau/linux-2.6 repo - HEAD is
3b56bba6abaa70d629fccdcf8490e087ea3a1ab4
X.Org X Server 1.13.4
Mesa version e6013e4bee7ebff6b7bd2f3b95eb16e8949e228c
Family: NVC0
Chipset: GF116 (NVCF) (GTX 550 Ti)

Some elements are only rendered in top-left area of the window (screenshot to
be included). This affects both Portal and Team Fortress 2.

I've done a bisection and this is the result:

2149ce41ed6b10f7bff65d7b3f23fd03b89753e3 is the first bad commit
commit 2149ce41ed6b10f7bff65d7b3f23fd03b89753e3
Author: Christoph Bumiller &lt;<a href="mailto:e0425955&#64;student.tuwien.ac.at">e0425955&#64;student.tuwien.ac.at</a>&gt;
Date:   Sun Sep 30 22:59:34 2012 +0200

    nv50,nvc0: fix 3d engine blit for nvc0

:040000 040000 e0f165f869fed658f574a2719d0e841dda95139e
013265106fe6e2f2dab6b20811566fa5ba1106f3 M    src

There is nothing related to this issue in dmesg, but I'll include it anyway.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377118157.Bfdecc50.19002--

--===============0739570324==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0739570324==--
