From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82704] New: kernel bug
Date: Sat, 16 Aug 2014 13:40:22 +0000
Message-ID: <bug-82704-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0004350335=="
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


--===============0004350335==
Content-Type: multipart/alternative; boundary="1408196422.b4E8ee00.13391"; charset="us-ascii"


--1408196422.b4E8ee00.13391
Date: Sat, 16 Aug 2014 13:40:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=82704

          Priority: medium
            Bug ID: 82704
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: kernel bug
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: mattia.b89-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: 10.2
         Component: Drivers/DRI/nouveau
           Product: Mesa

Created attachment 104733
  --> https://bugs.freedesktop.org/attachment.cgi?id=104733&action=edit
dmesg

X freezes sometimes when I play video.
I was playing an .avi (MPEG-4) with mpv (log attached) when casually
gnome-shell freezes. Anyway I was able to change VT, login, save dmesg
(attached) and reboot

because I think it's a VDPAU related problem, I attach a log of vdpauinfo

Relevant specs are:
 archlinux x86_64
 nouveau-1.0.10-3
 mesa-10.2.5-1
 mpv-0.5.0-1
 libva-vdpau-driver-0.7.4-1
 libvdpau-0.8-1
 libvdpau-va-gl-0.3.4-1
 lib32-libvdpau-0.8-1
 nouveau-fw-325.15-1


 nvidia 9800GT 512MB

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1408196422.b4E8ee00.13391
Date: Sat, 16 Aug 2014 13:40:22 +0000
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
   title="NEW --- - kernel bug"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82704">82704</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>kernel bug
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
          <td>10.2
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
        <pre>Created <span class=""><a href="attachment.cgi?id=104733" name="attach_104733" title="dmesg">attachment 104733</a> <a href="attachment.cgi?id=104733&amp;action=edit" title="dmesg">[details]</a></span>
dmesg

X freezes sometimes when I play video.
I was playing an .avi (MPEG-4) with mpv (log attached) when casually
gnome-shell freezes. Anyway I was able to change VT, login, save dmesg
(attached) and reboot

because I think it's a VDPAU related problem, I attach a log of vdpauinfo

Relevant specs are:
 archlinux x86_64
 nouveau-1.0.10-3
 mesa-10.2.5-1
 mpv-0.5.0-1
 libva-vdpau-driver-0.7.4-1
 libvdpau-0.8-1
 libvdpau-va-gl-0.3.4-1
 lib32-libvdpau-0.8-1
 nouveau-fw-325.15-1


 nvidia 9800GT 512MB</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1408196422.b4E8ee00.13391--

--===============0004350335==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0004350335==--
