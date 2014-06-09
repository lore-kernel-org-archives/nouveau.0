From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79823] New: Mozilla apps freeze on startup with
 nouveau-dri-10.2.1 libs on dual-screen
Date: Mon, 09 Jun 2014 09:03:14 +0000
Message-ID: <bug-79823-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0522032765=="
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


--===============0522032765==
Content-Type: multipart/alternative; boundary="1402304594.a4AA3D0.9584"; charset="us-ascii"


--1402304594.a4AA3D0.9584
Date: Mon, 9 Jun 2014 09:03:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=79823

          Priority: medium
            Bug ID: 79823
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Mozilla apps freeze on startup with nouveau-dri-10.2.1
                    libs on dual-screen
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: natrio-cmBhpYW9OiY@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: unspecified
         Component: Drivers/DRI/nouveau
           Product: Mesa

Created attachment 100709
  --> https://bugs.freedesktop.org/attachment.cgi?id=100709&action=edit
Htop sreenshot

All tested mozilla apps (firefox, thunderbird and seamonkey) freeze on startup
with nouveau-dri-10.2.1 libraries. If nouveau-dri libraries downgraded to
10.1.4, freezes gone, even without restarting x-server.

Freeze localized in forked mozilla process (with ~100% cpu eating), killing
this process can be restore mozilla's startup.

This bug detected only in nouveau dual-screen configuration. Intel dual-screen
works nornally, nouveau single-screen works too.

Arch linux, i686
Linux kernels: 3.14.6-1 and 3.10.42-1 (LTS)
Hardware: GeForce FX5200

/etc/X11/xorg.conf.d/21-nouveau.conf :
Section "ServerLayout"
    Identifier     "dual"
    Screen      0  "Screen0"
    Screen      1  "Screen1" RightOf "Screen0"
EndSection

Section "Monitor"
    Identifier     "Monitor0"
    VendorName     "Unknown"
    ModelName      "Plug-n-play"
    DisplaySize     323    244
    HorizSync       30.0 - 69.0
    VertRefresh     50.0 - 160.0
    Option         "DPMS"
EndSection

Section "Monitor"
    Identifier     "Monitor1"
    VendorName     "Unknown"
    ModelName      "TV-0"
    DisplaySize     200    150
EndSection

Section "Device"
    Identifier     "Videocard0"
    Driver         "nouveau"
    BusID          "PCI:1:0:0"
    Screen          0
    Option          "ZaphodHeads" "VGA-1"
EndSection

Section "Device"
    Identifier     "Videocard1"
    Driver         "nouveau"
    BusID          "PCI:1:0:0"
    Screen          1
    Option          "ZaphodHeads" "TV-1"
EndSection

Section "Screen"
    Identifier     "Screen0"
    Device         "Videocard0"
    Monitor        "Monitor0"
    DefaultDepth    24
    SubSection     "Display"
        Depth       24
    Modes       "1024x768_85"
    EndSubSection
EndSection

Section "Screen"
    Identifier     "Screen1"
    Device         "Videocard1"
    Monitor        "Monitor1"
    DefaultDepth    24
    SubSection     "Display"
        Depth       24
    Modes       "720x576"
    EndSubSection
EndSection

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1402304594.a4AA3D0.9584
Date: Mon, 9 Jun 2014 09:03:14 +0000
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
   title="NEW --- - Mozilla apps freeze on startup with nouveau-dri-10.2.1 libs on dual-screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79823">79823</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Mozilla apps freeze on startup with nouveau-dri-10.2.1 libs on dual-screen
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
          <td>natrio&#64;list.ru
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86 (IA32)
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
        <pre>Created <span class=""><a href="attachment.cgi?id=100709" name="attach_100709" title="Htop sreenshot">attachment 100709</a> <a href="attachment.cgi?id=100709&amp;action=edit" title="Htop sreenshot">[details]</a></span>
Htop sreenshot

All tested mozilla apps (firefox, thunderbird and seamonkey) freeze on startup
with nouveau-dri-10.2.1 libraries. If nouveau-dri libraries downgraded to
10.1.4, freezes gone, even without restarting x-server.

Freeze localized in forked mozilla process (with ~100% cpu eating), killing
this process can be restore mozilla's startup.

This bug detected only in nouveau dual-screen configuration. Intel dual-screen
works nornally, nouveau single-screen works too.

Arch linux, i686
Linux kernels: 3.14.6-1 and 3.10.42-1 (LTS)
Hardware: GeForce FX5200

/etc/X11/xorg.conf.d/21-nouveau.conf :
Section &quot;ServerLayout&quot;
    Identifier     &quot;dual&quot;
    Screen      0  &quot;Screen0&quot;
    Screen      1  &quot;Screen1&quot; RightOf &quot;Screen0&quot;
EndSection

Section &quot;Monitor&quot;
    Identifier     &quot;Monitor0&quot;
    VendorName     &quot;Unknown&quot;
    ModelName      &quot;Plug-n-play&quot;
    DisplaySize     323    244
    HorizSync       30.0 - 69.0
    VertRefresh     50.0 - 160.0
    Option         &quot;DPMS&quot;
EndSection

Section &quot;Monitor&quot;
    Identifier     &quot;Monitor1&quot;
    VendorName     &quot;Unknown&quot;
    ModelName      &quot;TV-0&quot;
    DisplaySize     200    150
EndSection

Section &quot;Device&quot;
    Identifier     &quot;Videocard0&quot;
    Driver         &quot;nouveau&quot;
    BusID          &quot;PCI:1:0:0&quot;
    Screen          0
    Option          &quot;ZaphodHeads&quot; &quot;VGA-1&quot;
EndSection

Section &quot;Device&quot;
    Identifier     &quot;Videocard1&quot;
    Driver         &quot;nouveau&quot;
    BusID          &quot;PCI:1:0:0&quot;
    Screen          1
    Option          &quot;ZaphodHeads&quot; &quot;TV-1&quot;
EndSection

Section &quot;Screen&quot;
    Identifier     &quot;Screen0&quot;
    Device         &quot;Videocard0&quot;
    Monitor        &quot;Monitor0&quot;
    DefaultDepth    24
    SubSection     &quot;Display&quot;
        Depth       24
    Modes       &quot;1024x768_85&quot;
    EndSubSection
EndSection

Section &quot;Screen&quot;
    Identifier     &quot;Screen1&quot;
    Device         &quot;Videocard1&quot;
    Monitor        &quot;Monitor1&quot;
    DefaultDepth    24
    SubSection     &quot;Display&quot;
        Depth       24
    Modes       &quot;720x576&quot;
    EndSubSection
EndSection</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1402304594.a4AA3D0.9584--

--===============0522032765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0522032765==--
