From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 65554] New: CPU lock with nouveau_fan_update
Date: Sun, 09 Jun 2013 00:20:39 +0000
Message-ID: <bug-65554-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1649617565=="
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


--===============1649617565==
Content-Type: multipart/alternative; boundary="1370737239.5e4bd1.29977"; charset="us-ascii"


--1370737239.5e4bd1.29977
Date: Sun, 9 Jun 2013 00:20:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=65554

          Priority: medium
            Bug ID: 65554
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: CPU lock with nouveau_fan_update
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: major
    Classification: Unclassified
                OS: Linux (All)
          Reporter: ddamienn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 80540
  --> https://bugs.freedesktop.org/attachment.cgi?id=80540&action=edit
kernel log

Kernel logs report "Watchdog detected hard LOCKUP on cpu 1". It has occurred
once per day for the last three days. Each time, it happens seemingly randomly
- monitor is turned off, I'm connected remotely via SSH but system is idle.

This is on ArchLinux with xf86-video-nouveau 1.0.7. The machine is ~2.5 years
old and has been very solid until now. My video card is: 01:00.0 VGA compatible
controller: NVIDIA Corporation GT216 [GeForce GT 220] (rev a2).

I have attached the kernel log. I also note that I don't know why the 'PTHERM'
events would be occurring - this was while the connected monitor was off and I
was only connected remotely via SSH.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1370737239.5e4bd1.29977
Date: Sun, 9 Jun 2013 00:20:39 +0000
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
   title="NEW --- - CPU lock with nouveau_fan_update"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=65554">65554</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>CPU lock with nouveau_fan_update
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
          <td>ddamienn&#64;gmail.com
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
        <pre>Created <span class=""><a href="attachment.cgi?id=80540" name="attach_80540" title="kernel log">attachment 80540</a> <a href="attachment.cgi?id=80540&amp;action=edit" title="kernel log">[details]</a></span>
kernel log

Kernel logs report &quot;Watchdog detected hard LOCKUP on cpu 1&quot;. It has occurred
once per day for the last three days. Each time, it happens seemingly randomly
- monitor is turned off, I'm connected remotely via SSH but system is idle.

This is on ArchLinux with xf86-video-nouveau 1.0.7. The machine is ~2.5 years
old and has been very solid until now. My video card is: 01:00.0 VGA compatible
controller: NVIDIA Corporation GT216 [GeForce GT 220] (rev a2).

I have attached the kernel log. I also note that I don't know why the 'PTHERM'
events would be occurring - this was while the connected monitor was off and I
was only connected remotely via SSH.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1370737239.5e4bd1.29977--

--===============1649617565==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1649617565==--
