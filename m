From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89730] New: NV50: LightDM GTK+ Greeter Background -
 inconsistent display
Date: Mon, 23 Mar 2015 12:56:31 +0000
Message-ID: <bug-89730-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0298932798=="
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


--===============0298932798==
Content-Type: multipart/alternative; boundary="1427115391.dC800E41.29988"; charset="UTF-8"


--1427115391.dC800E41.29988
Date: Mon, 23 Mar 2015 12:56:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89730

            Bug ID: 89730
           Summary: NV50: LightDM GTK+ Greeter Background - inconsistent
                    display
           Product: xorg
           Version: git
          Hardware: Other
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

LightDM GTK+ Greeter Background - inconsistent display


Tested HW:

- Family : NV50
  Chipset: G98 (NV98) / MCP79/MCP7A (NVAC)
      GeForce 8400 GS / ION VGA

nouveau.ko & nouveau_drv.so     - BROKEN
nouveau.ko & modesetting_drv.so - OK
nvidia.ko & nvidia_drv.so       - OK
~~~~~~~~~~~~~~

- Family : NV30
  Chipset: NV34 (NV34)
       GeForce FX 5200

nouveau.ko & nouveau_drv.so     - OK
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Tested SW:

- lightdm-gtk-2.0.0-2.fc21.x86_64
- lightdm-gtk-greeter_2.0.0-0ubuntu1_amd64
- xorg-x11-drv-nouveau 1.0.7 to 1.0.11 & git

~~~~~~~~~~~~~~

As shown here:
http://goo.gl/jHUkbS

~~~~~~~~

Comment:
Whatever is actually happening here is not evident in the logs:
dmesg, Xorg.*.log, lightdm.log(DEBUG) and x-*-greeter.log(DEBUG).

Top of the "greeter.png"
/etc/lightdm/lightdm-gtk-greeter.conf:
background=/etc/lightdm/greeter.png

is partially visible through the transparent panel:
https://github.com/shimmerproject/Greybird/blob/master/gtk-3.0/apps/lightdm-gtk-greeter.css#L14

and is fully revealed only after clicking the "Log In" or "Unlock" button
(ENTER key), 
or toggling the accessibility features such as "Large Font" (F1 key) and "High
Contrast" (F2 key).

It is important to note the Greeter Background display inconsistency occurs
entirely after the booting from the "Soft Off" (S5).
And with regard to the re-booting, it is unpredictable in itself, i.e. the
Greeter Background may be displayed or may not.



Ref.
http://lists.freedesktop.org/archives/lightdm/2015-March/000773.html

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1427115391.dC800E41.29988
Date: Mon, 23 Mar 2015 12:56:31 +0000
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
   title="NEW - NV50: LightDM GTK+ Greeter Background - inconsistent display"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89730">89730</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>NV50: LightDM GTK+ Greeter Background - inconsistent display
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
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
        <pre>LightDM GTK+ Greeter Background - inconsistent display


Tested HW:

- Family : NV50
  Chipset: G98 (NV98) / MCP79/MCP7A (NVAC)
      GeForce 8400 GS / ION VGA

nouveau.ko &amp; nouveau_drv.so     - BROKEN
nouveau.ko &amp; modesetting_drv.so - OK
nvidia.ko &amp; nvidia_drv.so       - OK
~~~~~~~~~~~~~~

- Family : NV30
  Chipset: NV34 (NV34)
       GeForce FX 5200

nouveau.ko &amp; nouveau_drv.so     - OK
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Tested SW:

- lightdm-gtk-2.0.0-2.fc21.x86_64
- lightdm-gtk-greeter_2.0.0-0ubuntu1_amd64
- xorg-x11-drv-nouveau 1.0.7 to 1.0.11 &amp; git

~~~~~~~~~~~~~~

As shown here:
<a href="http://goo.gl/jHUkbS">http://goo.gl/jHUkbS</a>

~~~~~~~~

Comment:
Whatever is actually happening here is not evident in the logs:
dmesg, Xorg.*.log, lightdm.log(DEBUG) and x-*-greeter.log(DEBUG).

Top of the &quot;greeter.png&quot;
/etc/lightdm/lightdm-gtk-greeter.conf:
background=/etc/lightdm/greeter.png

is partially visible through the transparent panel:
<a href="https://github.com/shimmerproject/Greybird/blob/master/gtk-3.0/apps/lightdm-gtk-greeter.css#L14">https://github.com/shimmerproject/Greybird/blob/master/gtk-3.0/apps/lightdm-gtk-greeter.css#L14</a>

and is fully revealed only after clicking the &quot;Log In&quot; or &quot;Unlock&quot; button
(ENTER key), 
or toggling the accessibility features such as &quot;Large Font&quot; (F1 key) and &quot;High
Contrast&quot; (F2 key).

It is important to note the Greeter Background display inconsistency occurs
entirely after the booting from the &quot;Soft Off&quot; (S5).
And with regard to the re-booting, it is unpredictable in itself, i.e. the
Greeter Background may be displayed or may not.



Ref.
<a href="http://lists.freedesktop.org/archives/lightdm/2015-March/000773.html">http://lists.freedesktop.org/archives/lightdm/2015-March/000773.html</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1427115391.dC800E41.29988--

--===============0298932798==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0298932798==--
