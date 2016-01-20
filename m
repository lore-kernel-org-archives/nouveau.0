From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93795] New: G98: GL(X) compositing - XRandR DPMS
	trouble
Date: Wed, 20 Jan 2016 16:18:17 +0000
Message-ID: <bug-93795-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1274562003=="
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


--===============1274562003==
Content-Type: multipart/alternative; boundary="14533066970.2BdB3.21278";
 charset="UTF-8"


--14533066970.2BdB3.21278
Date: Wed, 20 Jan 2016 16:18:17 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=93795

            Bug ID: 93795
           Summary: G98: GL(X) compositing - XRandR DPMS trouble
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

The case with the Xfce GLX compositing is,
output disablement/enablement via xrandr:
$ xrandr --output <output> --off ; xrandr --auto
produces unusable session screen - the mouse cursor is visible and motile, but
the rest of the screen is as blanked,
and the only thing left is to zap the xserver and re-log.

Both, Xfce(Xfwm) XRender compositing and DRI3, are NOT problematic in this
sense.


The case with the GNOME GL compositing is not essentially different,
output disablement/enablement via xrandr produces clutter/mutter/scooter
breakage,
thus gnome-shell terminates with signal SIGSEGV thereby reappears display
manager greeter screen.
https://bugzilla.redhat.com/attachment.cgi?id=1106815


The case with the KDE GL compositing is comparable with the Xfce one.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14533066970.2BdB3.21278
Date: Wed, 20 Jan 2016 16:18:17 +0000
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
   title="NEW - G98: GL(X) compositing - XRandR DPMS trouble"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93795">93795</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>G98: GL(X) compositing - XRandR DPMS trouble
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
          <td>pomidorabelisima&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>The case with the Xfce GLX compositing is,
output disablement/enablement via xrandr:
$ xrandr --output &lt;output&gt; --off ; xrandr --auto
produces unusable session screen - the mouse cursor is visible and motile, but
the rest of the screen is as blanked,
and the only thing left is to zap the xserver and re-log.

Both, Xfce(Xfwm) XRender compositing and DRI3, are NOT problematic in this
sense.


The case with the GNOME GL compositing is not essentially different,
output disablement/enablement via xrandr produces clutter/mutter/scooter
breakage,
thus gnome-shell terminates with signal SIGSEGV thereby reappears display
manager greeter screen.
<a href="https://bugzilla.redhat.com/attachment.cgi?id=1106815">https://bugzilla.redhat.com/attachment.cgi?id=1106815</a>


The case with the KDE GL compositing is comparable with the Xfce one.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14533066970.2BdB3.21278--

--===============1274562003==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1274562003==--
