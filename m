From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71900] New: [NV40] GPU lockup and segmentation fault
 of Nouveau-1.0.10 on PowerMac G5 with acceleration
Date: Fri, 22 Nov 2013 02:16:10 +0000
Message-ID: <bug-71900-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2103699662=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============2103699662==
Content-Type: multipart/alternative; boundary="1385086570.Dea831181.10291"; charset="us-ascii"


--1385086570.Dea831181.10291
Date: Fri, 22 Nov 2013 02:16:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71900

          Priority: medium
            Bug ID: 71900
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NV40] GPU lockup and segmentation fault of
                    Nouveau-1.0.10 on PowerMac G5 with acceleration
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: dehua.yang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: PowerPC
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 89611
  --> https://bugs.freedesktop.org/attachment.cgi?id=89611&action=edit
Dmesg

I tried to use nouvear driver with acceleration on gentoo PPC64 running on
Apple PowerMac G5, and failed with GPU lockup and segmentation fault. The linux
kernel booted successfuly into a console, then the screen was filled with
rubbish(colorful blocks or the like) and stuck there when I started "startx" in
the console. After 5mins I pressed "Ctrl+Alt+F2" to switch to another TTY and
succeeded, I got a message "nouveau E[  DRM] GPU lockup - switch to software
fbcon". When I came again to the console X was launched, the X terminated and
system fell back to the TTY with many errors(see dmesg and Xorg.0.log
attached). This only happens when nouveau has acceleration, when I disable it
by putting "Option 'NoAccel' 'true'" in xorg.conf, X and Gnome run normally
without problems.

My computer is Apple PowerMac G5 of late 2003(PowerMac7,2) with GeForce
6800Ultra DDL graphics card(No any problem on Mac OXS 10.4.11). The followings
are installed:
The linux kernel 3.12.0, 
xorg-server 1.14.4, 
mesa 9.1.6, 
xf86-video-nouveau 1.0.10

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1385086570.Dea831181.10291
Date: Fri, 22 Nov 2013 02:16:10 +0000
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
   title="NEW --- - [NV40] GPU lockup and segmentation fault of Nouveau-1.0.10 on PowerMac G5 with acceleration"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71900">71900</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV40] GPU lockup and segmentation fault of Nouveau-1.0.10 on PowerMac G5 with acceleration
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
          <td>dehua.yang&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>PowerPC
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
        <pre>Created <span class=""><a href="attachment.cgi?id=89611" name="attach_89611" title="Dmesg">attachment 89611</a> <a href="attachment.cgi?id=89611&amp;action=edit" title="Dmesg">[details]</a></span>
Dmesg

I tried to use nouvear driver with acceleration on gentoo PPC64 running on
Apple PowerMac G5, and failed with GPU lockup and segmentation fault. The linux
kernel booted successfuly into a console, then the screen was filled with
rubbish(colorful blocks or the like) and stuck there when I started &quot;startx&quot; in
the console. After 5mins I pressed &quot;Ctrl+Alt+F2&quot; to switch to another TTY and
succeeded, I got a message &quot;nouveau E[  DRM] GPU lockup - switch to software
fbcon&quot;. When I came again to the console X was launched, the X terminated and
system fell back to the TTY with many errors(see dmesg and Xorg.0.log
attached). This only happens when nouveau has acceleration, when I disable it
by putting &quot;Option 'NoAccel' 'true'&quot; in xorg.conf, X and Gnome run normally
without problems.

My computer is Apple PowerMac G5 of late 2003(PowerMac7,2) with GeForce
6800Ultra DDL graphics card(No any problem on Mac OXS 10.4.11). The followings
are installed:
The linux kernel 3.12.0, 
xorg-server 1.14.4, 
mesa 9.1.6, 
xf86-video-nouveau 1.0.10</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1385086570.Dea831181.10291--

--===============2103699662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2103699662==--
