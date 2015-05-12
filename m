From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90424] New: [NVAA] Xorg on HDMI regression since
	v4.0-rc1
Date: Tue, 12 May 2015 16:12:56 +0000
Message-ID: <bug-90424-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1142465074=="
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


--===============1142465074==
Content-Type: multipart/alternative; boundary="1431447176.1a7C1.23193"; charset="UTF-8"


--1431447176.1a7C1.23193
Date: Tue, 12 May 2015 16:12:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90424

            Bug ID: 90424
           Summary: [NVAA] Xorg on HDMI regression since v4.0-rc1
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: alexanders83-S0/GAf8tV78@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

While trying to fix another bug I tried using kernel v4.0 and noticed that
after X.org has started (running fluxbox with mythtv in my case) the screen
stays black. My screen is attached on HDMI.
During boot I can see the console output just fine but when X started it stays
black. I don't even see the first small X shaped cursor.
I bisected this back to commit 0ea5fe8a83c2 ("drm/nouveau/kms: default to panel
scaling, except for fixed panels prior to nv50").
From the commit message I suspect that "panel scaling" (whatever that means)
does not work on my NVAA. I check the values of nv_connector->type and
nv_connector->scaling_mode on both the bisected commit and the parent (last
commit working).
The type is 0x61 (DCB_CONNECTOR_HDMI_1) in both cases and the scaling_mode is 0
(DRM_MODE_SCALE_NONE) when the screen stays black while it is 1
(DRM_MODE_SCALE_FULLSCREEN) when everything works normally.
dmesg doesn't show anything interesting though. Maybe a higher log level,
please give me some hints which component and which debug level you may need.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1431447176.1a7C1.23193
Date: Tue, 12 May 2015 16:12:56 +0000
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
   title="NEW - [NVAA] Xorg on HDMI regression since v4.0-rc1"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90424">90424</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVAA] Xorg on HDMI regression since v4.0-rc1
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
          <td>alexanders83&#64;web.de
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>While trying to fix another bug I tried using kernel v4.0 and noticed that
after X.org has started (running fluxbox with mythtv in my case) the screen
stays black. My screen is attached on HDMI.
During boot I can see the console output just fine but when X started it stays
black. I don't even see the first small X shaped cursor.
I bisected this back to commit 0ea5fe8a83c2 (&quot;drm/nouveau/kms: default to panel
scaling, except for fixed panels prior to nv50&quot;).
From the commit message I suspect that &quot;panel scaling&quot; (whatever that means)
does not work on my NVAA. I check the values of nv_connector-&gt;type and
nv_connector-&gt;scaling_mode on both the bisected commit and the parent (last
commit working).
The type is 0x61 (DCB_CONNECTOR_HDMI_1) in both cases and the scaling_mode is 0
(DRM_MODE_SCALE_NONE) when the screen stays black while it is 1
(DRM_MODE_SCALE_FULLSCREEN) when everything works normally.
dmesg doesn't show anything interesting though. Maybe a higher log level,
please give me some hints which component and which debug level you may need.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1431447176.1a7C1.23193--

--===============1142465074==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1142465074==--
