From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69465] New: Kernel freeze with NVA3 kernel 3.11.1 /
 PGRAPH][0000:01:00.0] PGRAPH TLB flush idle timeout fail
Date: Tue, 17 Sep 2013 13:21:51 +0000
Message-ID: <bug-69465-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1924412574=="
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


--===============1924412574==
Content-Type: multipart/alternative; boundary="1379424112.3E1aAFB1.16066"; charset="us-ascii"


--1379424112.3E1aAFB1.16066
Date: Tue, 17 Sep 2013 13:21:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69465

          Priority: medium
            Bug ID: 69465
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Kernel freeze with NVA3 kernel 3.11.1 /
                    PGRAPH][0000:01:00.0] PGRAPH TLB flush idle timeout
                    fail
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: critical
    Classification: Unclassified
                OS: Linux (All)
          Reporter: gorilla.maguila-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 85974
  --> https://bugs.freedesktop.org/attachment.cgi?id=85974&action=edit
netconsole.log

Kernel freezes randomly under normal usage. Pressing the reset button is
required.

The hangs occurs randomly, sometimes browsing with chrome, sometimes opening
konsole, sometimes using eclipse.

As nothing works after kernel hang, attached is the dmesg output via
netconsole.

I'm running kernel 3.11.1 under Archlinux with kde 4.11.1

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1379424112.3E1aAFB1.16066
Date: Tue, 17 Sep 2013 13:21:52 +0000
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
   title="NEW --- - Kernel freeze with NVA3 kernel 3.11.1 / PGRAPH][0000:01:00.0] PGRAPH TLB flush idle timeout fail"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69465">69465</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Kernel freeze with NVA3 kernel 3.11.1 / PGRAPH][0000:01:00.0] PGRAPH TLB flush idle timeout fail
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>critical
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
          <td>gorilla.maguila&#64;gmail.com
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
        <pre>Created <span class=""><a href="attachment.cgi?id=85974" name="attach_85974" title="netconsole.log">attachment 85974</a> <a href="attachment.cgi?id=85974&amp;action=edit" title="netconsole.log">[details]</a></span>
netconsole.log

Kernel freezes randomly under normal usage. Pressing the reset button is
required.

The hangs occurs randomly, sometimes browsing with chrome, sometimes opening
konsole, sometimes using eclipse.

As nothing works after kernel hang, attached is the dmesg output via
netconsole.

I'm running kernel 3.11.1 under Archlinux with kde 4.11.1</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1379424112.3E1aAFB1.16066--

--===============1924412574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1924412574==--
