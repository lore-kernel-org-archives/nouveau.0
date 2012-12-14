From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58305] New: Kernel crashes if nVidia card is powered
 off and X restartted
Date: Fri, 14 Dec 2012 16:45:08 +0000
Message-ID: <bug-58305-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2085350133=="
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


--===============2085350133==
Content-Type: multipart/alternative; boundary="1355503508.ADD2e1.2296"; charset="us-ascii"


--1355503508.ADD2e1.2296
Date: Fri, 14 Dec 2012 16:45:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58305

          Priority: medium
            Bug ID: 58305
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Kernel crashes if nVidia card is powered off and X
                    restartted
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: buboleck-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 71512
  --> https://bugs.freedesktop.org/attachment.cgi?id=71512&action=edit
Kernel message for the crash

In Optimus system if the Nvidia card is powered off and X is restarted kernel
crashes. 

Info:

Distribution: Gentoo x86_64, stable up to date.
Kernel: Gentoo 3.7 
System: Acer Aspire 5742G (RAM 8G ,CPU Intel Core i5 480M, nVidia GT540 with 1G
RAM, latest BIOS v1.30)

In the kernel messages when the nouveu driver is loaded it reports that the
nVidia card is with 512MB of ram.

I can provide full dmesg if needed.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1355503508.ADD2e1.2296
Date: Fri, 14 Dec 2012 16:45:08 +0000
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
   title="NEW --- - Kernel crashes if nVidia card is powered off and X restartted"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58305">58305</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Kernel crashes if nVidia card is powered off and X restartted
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
          <td>buboleck&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
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
        <pre>Created <span class=""><a href="attachment.cgi?id=71512" name="attach_71512" title="Kernel message for the crash">attachment 71512</a> <a href="attachment.cgi?id=71512&amp;action=edit" title="Kernel message for the crash">[details]</a></span>
Kernel message for the crash

In Optimus system if the Nvidia card is powered off and X is restarted kernel
crashes. 

Info:

Distribution: Gentoo x86_64, stable up to date.
Kernel: Gentoo 3.7 
System: Acer Aspire 5742G (RAM 8G ,CPU Intel Core i5 480M, nVidia GT540 with 1G
RAM, latest BIOS v1.30)

In the kernel messages when the nouveu driver is loaded it reports that the
nVidia card is with 512MB of ram.

I can provide full dmesg if needed.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1355503508.ADD2e1.2296--

--===============2085350133==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2085350133==--
