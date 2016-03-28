From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94728] New: Nouveau doesn't work with Nvidia GTX 960
Date: Mon, 28 Mar 2016 08:44:40 +0000
Message-ID: <bug-94728-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1613726972=="
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


--===============1613726972==
Content-Type: multipart/alternative; boundary="14591546801.95b75.9242";
 charset="UTF-8"


--14591546801.95b75.9242
Date: Mon, 28 Mar 2016 08:44:40 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94728

            Bug ID: 94728
           Summary: Nouveau doesn't work with Nvidia GTX 960
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: neilmedics-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

The nouveau driver doesn't seem to work with my GTX 960 card - I'm getting
"Unknown chipset: NV126" message in the logs. Looks like it's then falling back
to mesa (gnome-control-center shows graphics as Gallium 0.4 on llvmpipe (LLVM
3.7, 256 bits)). 

I'm on the latest version Fedora 23, although I haven't seen this work since I
got the card. Output of journalctl -b _COMM=gdm-x-session attached. Let me know
if you need anymore info - many thanks. 


(II) [drm] nouveau interface version: 1.3.1
(EE) Unknown chipset: NV126
(II) [drm] nouveau interface version: 1.3.1
(EE) Unknown chipset: NV126
(II) [drm] nouveau interface version: 1.3.1
(EE) Unknown chipset: NV126
(EE) [drm] Failed to open DRM device for pci:0000:01:00.0: -13
(EE) [drm] Failed to open DRM device for pci:0000:01:00.0: -13

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14591546801.95b75.9242
Date: Mon, 28 Mar 2016 08:44:40 +0000
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
   title="NEW - Nouveau doesn't work with Nvidia GTX 960"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94728">94728</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Nouveau doesn't work with Nvidia GTX 960
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
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
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
          <td>neilmedics&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>The nouveau driver doesn't seem to work with my GTX 960 card - I'm getting
&quot;Unknown chipset: NV126&quot; message in the logs. Looks like it's then falling back
to mesa (gnome-control-center shows graphics as Gallium 0.4 on llvmpipe (LLVM
3.7, 256 bits)). 

I'm on the latest version Fedora 23, although I haven't seen this work since I
got the card. Output of journalctl -b _COMM=gdm-x-session attached. Let me know
if you need anymore info - many thanks. 


(II) [drm] nouveau interface version: 1.3.1
(EE) Unknown chipset: NV126
(II) [drm] nouveau interface version: 1.3.1
(EE) Unknown chipset: NV126
(II) [drm] nouveau interface version: 1.3.1
(EE) Unknown chipset: NV126
(EE) [drm] Failed to open DRM device for pci:0000:01:00.0: -13
(EE) [drm] Failed to open DRM device for pci:0000:01:00.0: -13</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14591546801.95b75.9242--

--===============1613726972==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1613726972==--
