From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59742] New: Displayport attached monitor stopped
 working in xorg and init 3, after kernel upgrade
Date: Wed, 23 Jan 2013 06:24:58 +0000
Message-ID: <bug-59742-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0933582311=="
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


--===============0933582311==
Content-Type: multipart/alternative; boundary="1358922299.dCc4c5E1.31306"; charset="us-ascii"


--1358922299.dCc4c5E1.31306
Date: Wed, 23 Jan 2013 06:24:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59742

          Priority: medium
            Bug ID: 59742
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Displayport attached monitor stopped working in xorg
                    and init 3, after kernel upgrade
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: major
    Classification: Unclassified
                OS: Linux (All)
          Reporter: shawn-2Sme3GpZbHwAHsbooYhBx9i2O/JbrIOy@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: 7.7 (2011)
         Component: Driver/nouveau
           Product: xorg

Created attachment 73492
  --> https://bugs.freedesktop.org/attachment.cgi?id=73492&action=edit
dmesg | grep nouvea, with 3.6.10-4

Hello, I am running fedora 18. I have 3 monitors hooked up to a geforce gtx 660
ti, 2 via the DVI connectors, and 1 via the displayport connector. With Kernel
3.6.10-4, everything works fine. Upon upgrading to 3.7.2-201, the displayport
connected monitor stops working and says unsupported display mode, optimal
resolution is xx (the monitor is set to that resolution and hz).

The unsupported display mode is displayed even in runlevel 3. I have changed
the monitor connectors around and whichever is connected via displayport stops
working. 

If I boot back to 3.6.10-4, everything works fine.

If I do a dmesg |grep nouveau , on 3.7.2-201, I see: 
  2.012167] nouveau E[     DRM] failed to create kernel channel, -22            

This message does not get displayed with 3.6.10-4.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1358922299.dCc4c5E1.31306
Date: Wed, 23 Jan 2013 06:24:59 +0000
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
   title="NEW --- - Displayport attached monitor stopped working in xorg and init 3, after kernel upgrade"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59742">59742</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Displayport attached monitor stopped working in xorg and init 3, after kernel upgrade
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
          <td>shawn&#64;systemtemplar.org
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
          <td>7.7 (2011)
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
        <pre>Created <span class=""><a href="attachment.cgi?id=73492" name="attach_73492" title="dmesg | grep nouvea, with 3.6.10-4">attachment 73492</a> <a href="attachment.cgi?id=73492&amp;action=edit" title="dmesg | grep nouvea, with 3.6.10-4">[details]</a></span>
dmesg | grep nouvea, with 3.6.10-4

Hello, I am running fedora 18. I have 3 monitors hooked up to a geforce gtx 660
ti, 2 via the DVI connectors, and 1 via the displayport connector. With Kernel
3.6.10-4, everything works fine. Upon upgrading to 3.7.2-201, the displayport
connected monitor stops working and says unsupported display mode, optimal
resolution is xx (the monitor is set to that resolution and hz).

The unsupported display mode is displayed even in runlevel 3. I have changed
the monitor connectors around and whichever is connected via displayport stops
working. 

If I boot back to 3.6.10-4, everything works fine.

If I do a dmesg |grep nouveau , on 3.7.2-201, I see: 
  2.012167] nouveau E[     DRM] failed to create kernel channel, -22            

This message does not get displayed with 3.6.10-4.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1358922299.dCc4c5E1.31306--

--===============0933582311==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0933582311==--
