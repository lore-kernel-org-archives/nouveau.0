From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79532] New: [NV50] errors with DMA PUSHER and idle
	channel
Date: Mon, 02 Jun 2014 08:32:24 +0000
Message-ID: <bug-79532-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0716791106=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0716791106==
Content-Type: multipart/alternative; boundary="1401697944.6eF3Bd0.22279"; charset="us-ascii"


--1401697944.6eF3Bd0.22279
Date: Mon, 2 Jun 2014 08:32:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=79532

          Priority: medium
            Bug ID: 79532
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NV50] errors with DMA PUSHER and idle channel
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: mattia.b89-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: git
         Component: Drivers/DRI/nouveau
           Product: Mesa

Created attachment 100275
  --> https://bugs.freedesktop.org/attachment.cgi?id=100275&action=edit
log from dmesg

apparently starting with mesa-10.2rc4 with my 9800gt PCI-E on gnome-3.12.2

I get this errors:
[ 1340.694566] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 2 [Xorg[630]]
get 0x0020023700 put 0x0020023710 ib_get 0x000002da ib_put 0x0000032f state
0x80000240 (err: INVALID_CMD) push 0x00406040
[ 2965.025771] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 2 [Xorg[630]]
get 0x002003a9a8 put 0x002003aa98 ib_get 0x00000132 ib_put 0x00000183 state
0x80004610 (err: INVALID_CMD) push 0x00406040
[ 2996.725428] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 2 [Xorg[630]]
get 0x002003e150 put 0x002003e27c ib_get 0x00000080 ib_put 0x000000d7 state
0x80000024 (err: INVALID_CMD) push 0x00406040
[ 3042.646374] nouveau E[Xorg[630]] failed to idle channel 0xcccc0000
[Xorg[630]]
[ 3057.646368] nouveau E[Xorg[630]] failed to idle channel 0xcccc0000
[Xorg[630]]

then the session "reboot" to GDM (gnome login manager)


I attach the entire dmesg log

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1401697944.6eF3Bd0.22279
Date: Mon, 2 Jun 2014 08:32:24 +0000
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
   title="NEW --- - [NV50] errors with DMA PUSHER and idle channel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79532">79532</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV50] errors with DMA PUSHER and idle channel
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
          <td>mattia.b89&#64;gmail.com
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
        <pre>Created <span class=""><a href="attachment.cgi?id=100275" name="attach_100275" title="log from dmesg">attachment 100275</a> <a href="attachment.cgi?id=100275&amp;action=edit" title="log from dmesg">[details]</a></span>
log from dmesg

apparently starting with mesa-10.2rc4 with my 9800gt PCI-E on gnome-3.12.2

I get this errors:
[ 1340.694566] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 2 [Xorg[630]]
get 0x0020023700 put 0x0020023710 ib_get 0x000002da ib_put 0x0000032f state
0x80000240 (err: INVALID_CMD) push 0x00406040
[ 2965.025771] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 2 [Xorg[630]]
get 0x002003a9a8 put 0x002003aa98 ib_get 0x00000132 ib_put 0x00000183 state
0x80004610 (err: INVALID_CMD) push 0x00406040
[ 2996.725428] nouveau E[   PFIFO][0000:01:00.0] DMA_PUSHER - ch 2 [Xorg[630]]
get 0x002003e150 put 0x002003e27c ib_get 0x00000080 ib_put 0x000000d7 state
0x80000024 (err: INVALID_CMD) push 0x00406040
[ 3042.646374] nouveau E[Xorg[630]] failed to idle channel 0xcccc0000
[Xorg[630]]
[ 3057.646368] nouveau E[Xorg[630]] failed to idle channel 0xcccc0000
[Xorg[630]]

then the session &quot;reboot&quot; to GDM (gnome login manager)


I attach the entire dmesg log</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1401697944.6eF3Bd0.22279--

--===============0716791106==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0716791106==--
