From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76605] New: Screen corruption and crashes in bastion
 on NVS-140M (G86)
Date: Tue, 25 Mar 2014 20:40:13 +0000
Message-ID: <bug-76605-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1047386759=="
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


--===============1047386759==
Content-Type: multipart/alternative; boundary="1395780013.B5A00.31548"; charset="us-ascii"


--1395780013.B5A00.31548
Date: Tue, 25 Mar 2014 20:40:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76605

          Priority: medium
            Bug ID: 76605
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Screen corruption and crashes in bastion on NVS-140M
                    (G86)
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: matthias-eXl60zzu3X2b9/CCa1Sigw@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: 10.1
         Component: Drivers/DRI/nouveau
           Product: Mesa

Created attachment 96381
  --> https://bugs.freedesktop.org/attachment.cgi?id=96381&action=edit
dmesg

When I run the game bastion there is screen corruption, and after some time the
computer locks up.

The menu renders OK-ish (with only some flickering corruption). When ingame,
the screen flickers between (mostly) uncorrupted and corrupted at random
intervals. After some time the computer crashes. Before the crash there is a
lot of output in dmesg by nouveau.

I am running archlinux.

Versions:
xorg 1.15.0
mesa 10.1.0
xf86-video-nouveau 1.0.10
nouveau-dri 10.1.0
linux 3.13.7

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1395780013.B5A00.31548
Date: Tue, 25 Mar 2014 20:40:13 +0000
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
   title="NEW --- - Screen corruption and crashes in bastion on NVS-140M (G86)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76605">76605</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Screen corruption and crashes in bastion on NVS-140M (G86)
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
          <td>matthias&#64;blankertz.org
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
          <td>10.1
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
        <pre>Created <span class=""><a href="attachment.cgi?id=96381" name="attach_96381" title="dmesg">attachment 96381</a> <a href="attachment.cgi?id=96381&amp;action=edit" title="dmesg">[details]</a></span>
dmesg

When I run the game bastion there is screen corruption, and after some time the
computer locks up.

The menu renders OK-ish (with only some flickering corruption). When ingame,
the screen flickers between (mostly) uncorrupted and corrupted at random
intervals. After some time the computer crashes. Before the crash there is a
lot of output in dmesg by nouveau.

I am running archlinux.

Versions:
xorg 1.15.0
mesa 10.1.0
xf86-video-nouveau 1.0.10
nouveau-dri 10.1.0
linux 3.13.7</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1395780013.B5A00.31548--

--===============1047386759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1047386759==--
