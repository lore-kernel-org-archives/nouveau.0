From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61611] New: Crash of X on a notification popup
Date: Thu, 28 Feb 2013 11:42:05 +0000
Message-ID: <bug-61611-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0952369857=="
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


--===============0952369857==
Content-Type: multipart/alternative; boundary="1362051726.A5DcA0.11297"; charset="us-ascii"


--1362051726.A5DcA0.11297
Date: Thu, 28 Feb 2013 11:42:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=61611

          Priority: medium
            Bug ID: 61611
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Crash of X on a notification popup
          Severity: major
    Classification: Unclassified
                OS: Linux (All)
          Reporter: raphgro-S0/GAf8tV78@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: 9.1
         Component: Drivers/DRI/nouveau
           Product: Mesa

Created attachment 75685
  --> https://bugs.freedesktop.org/attachment.cgi?id=75685&action=edit
dmesg

nouveau-dri 9.1-2
xf86-xorg-drv-nouveau 1.0.6-1
cinnamon 1.7.1-3
linux 3.7.9-2


Some error messages from dmesg:
"nouveau  [   PFIFO][0000:04:00.0] CACHE_ERROR - Ch 1/5 Mthd 0x0404 Data
0x00000000"
"... failed to idle channel 0xcccc0000"

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1362051726.A5DcA0.11297
Date: Thu, 28 Feb 2013 11:42:06 +0000
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
   title="NEW --- - Crash of X on a notification popup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61611">61611</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Crash of X on a notification popup
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
          <td>raphgro&#64;web.de
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
          <td>9.1
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
        <pre>Created <span class=""><a href="attachment.cgi?id=75685" name="attach_75685" title="dmesg">attachment 75685</a> <a href="attachment.cgi?id=75685&amp;action=edit" title="dmesg">[details]</a></span>
dmesg

nouveau-dri 9.1-2
xf86-xorg-drv-nouveau 1.0.6-1
cinnamon 1.7.1-3
linux 3.7.9-2


Some error messages from dmesg:
&quot;nouveau  [   PFIFO][0000:04:00.0] CACHE_ERROR - Ch 1/5 Mthd 0x0404 Data
0x00000000&quot;
&quot;... failed to idle channel 0xcccc0000&quot;</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1362051726.A5DcA0.11297--

--===============0952369857==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0952369857==--
