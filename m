From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90976] New: GM204 (NV124) black screen on modesetting
Date: Sun, 14 Jun 2015 16:56:26 +0000
Message-ID: <bug-90976-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0325303451=="
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


--===============0325303451==
Content-Type: multipart/alternative; boundary="1434300986.e11c36d01.26071"; charset="UTF-8"


--1434300986.e11c36d01.26071
Date: Sun, 14 Jun 2015 16:56:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90976

            Bug ID: 90976
           Summary: GM204 (NV124) black screen on modesetting
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: high
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: roucaries.bastien+bugs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 116492
  --> https://bugs.freedesktop.org/attachment.cgi?id=116492&action=edit
dmesg

Modesetting does not work.

The card is linked to sony bravia TV through HDMI

I achieved to get a trace by blacklisting nouveau then manually load it.
error log here (full dmesg joinded):
[  143.521000] nouveau E[     DRM] Pointer to flat panel table invalid
[  143.525351] nouveau W[     DRM] unknown connector type 70
[  143.525387] nouveau W[     DRM] failed to create encoder 1/8/0: -19
[  143.525388] nouveau W[     DRM] Unknown-1 has no encoders, removing
[  143.525407] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[  143.525407] [drm] Driver supports precise vblank timestamp query.
[  143.525424] nouveau E[     DRM] failed to initialise sync subsystem, -38
[  143.819264] nouveau  [     DRM] allocated 1920x1080 fb: 0x60000, bo
ffff8802135d3000

What could I do ?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1434300986.e11c36d01.26071
Date: Sun, 14 Jun 2015 16:56:26 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - GM204 (NV124) black screen on modesetting"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90976">90976</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>GM204 (NV124) black screen on modesetting
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
          <td>major
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>high
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
          <td>roucaries.bastien+bugs&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=116492" name="attach_116492" title="dmesg">attachment 116492</a> <a href="attachment.cgi?id=116492&amp;action=edit" title="dmesg">[details]</a></span>
dmesg

Modesetting does not work.

The card is linked to sony bravia TV through HDMI

I achieved to get a trace by blacklisting nouveau then manually load it.
error log here (full dmesg joinded):
[  143.521000] nouveau E[     DRM] Pointer to flat panel table invalid
[  143.525351] nouveau W[     DRM] unknown connector type 70
[  143.525387] nouveau W[     DRM] failed to create encoder 1/8/0: -19
[  143.525388] nouveau W[     DRM] Unknown-1 has no encoders, removing
[  143.525407] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[  143.525407] [drm] Driver supports precise vblank timestamp query.
[  143.525424] nouveau E[     DRM] failed to initialise sync subsystem, -38
[  143.819264] nouveau  [     DRM] allocated 1920x1080 fb: 0x60000, bo
ffff8802135d3000

What could I do ?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1434300986.e11c36d01.26071--

--===============0325303451==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0325303451==--
