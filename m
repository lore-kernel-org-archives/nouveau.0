From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94832] New: Reverse Prime corruption with nouveau
 using radeon outputs
Date: Tue, 05 Apr 2016 20:10:56 +0000
Message-ID: <bug-94832-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0336639085=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0336639085==
Content-Type: multipart/alternative; boundary="14598870561.fb9cc.9678";
 charset="UTF-8"


--14598870561.fb9cc.9678
Date: Tue, 5 Apr 2016 20:10:56 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94832

            Bug ID: 94832
           Summary: Reverse Prime corruption with nouveau using radeon
                    outputs
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: haagch-7lD2lakjNIixeQ3y2VaiTg@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 122732
  --> https://bugs.freedesktop.org/attachment.cgi?id=122732&action=edit
photo with screen corruption

I have these two (old) GPUs:

00:0d.0 VGA compatible controller: NVIDIA Corporation C61 [GeForce 6150SE
nForce 430] (rev a2)
02:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] RV370
[Radeon X300]

After startup my desktop runs on the nvidia gpu.
I enable prime with these commands:

xrandr --setprovideroutputsource radeon nouveau
xrandr --output VGA-2 --auto  --output DVI-1-0 --right-of VGA-2 --mode
1280x1024

It seems to almost work, but the monitor connected to the radeon gpu is very
corrupted, see attached image.

Software:

linux 4.5
xf86-video-nouveau 1.0.12
xf86-video-ati 1:7.6.1
xorg-server 1.18.3
xfwm4 4.12.3 with compositor enabled

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14598870561.fb9cc.9678
Date: Tue, 5 Apr 2016 20:10:56 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Reverse Prime corruption with nouveau using radeon outputs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94832">94832</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Reverse Prime corruption with nouveau using radeon outputs
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>haagch&#64;frickel.club
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=122732" name="attach_122732" title="photo with screen corruption">attachment 122732</a> <a href="attachment.cgi?id=122732&amp;action=edit" title="photo with screen corruption">[details]</a></span>
photo with screen corruption

I have these two (old) GPUs:

00:0d.0 VGA compatible controller: NVIDIA Corporation C61 [GeForce 6150SE
nForce 430] (rev a2)
02:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] RV370
[Radeon X300]

After startup my desktop runs on the nvidia gpu.
I enable prime with these commands:

xrandr --setprovideroutputsource radeon nouveau
xrandr --output VGA-2 --auto  --output DVI-1-0 --right-of VGA-2 --mode
1280x1024

It seems to almost work, but the monitor connected to the radeon gpu is very
corrupted, see attached image.

Software:

linux 4.5
xf86-video-nouveau 1.0.12
xf86-video-ati 1:7.6.1
xorg-server 1.18.3
xfwm4 4.12.3 with compositor enabled</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14598870561.fb9cc.9678--

--===============0336639085==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0336639085==--
