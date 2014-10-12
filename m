From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 84932] New: Optimus with nouveau no longer works
 with xorg-server 1.16.1
Date: Sun, 12 Oct 2014 12:02:25 +0000
Message-ID: <bug-84932-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0985291579=="
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


--===============0985291579==
Content-Type: multipart/alternative; boundary="1413115345.7dc480.7112"; charset="UTF-8"


--1413115345.7dc480.7112
Date: Sun, 12 Oct 2014 12:02:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=84932

            Bug ID: 84932
           Summary: Optimus with nouveau no longer works with xorg-server
                    1.16.1
           Product: Mesa
           Version: 10.2
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: dura-PlyTytoxC32F389P3+uynUB+6BGkLq7r@public.gmane.org

Created attachment 107736
  --> https://bugs.freedesktop.org/attachment.cgi?id=107736&action=edit
dmesg

I have an optimus laptop with intel HD4000 and nvidia GTX 660M.
With xorg-server 1.16.1 the GPU cannot be used. Replacing xorg-server with
1.15.1 version (and same version drivers) make it works again without making
any other changes (even rebooting).

xrandr --listproviders 
xrandr --setprovideroffloadsink nouveau Intel
DRI_PRIME=1 glxinfo | grep "OpenGL vendor string"

With 1.16 version:
Providers: number : 2
Provider 0: id: 0x88 cap: 0xb, Source Output, Sink Output, Sink Offload crtcs:
4 outputs: 5 associated providers: 1 name:Intel
Provider 1: id: 0x5f cap: 0x5, Source Output, Source Offload crtcs: 0 outputs:
0 associated providers: 1 name:nouveau
OpenGL vendor string: Intel Open Source Technology Center

With 1.15 version:
Providers: number : 2
Provider 0: id: 0x88 cap: 0xb, Source Output, Sink Output, Sink Offload crtcs:
4 outputs: 5 associated providers: 1 name:Intel
Provider 1: id: 0x5f cap: 0x5, Source Output, Source Offload crtcs: 0 outputs:
0 associated providers: 1 name:nouveau
OpenGL vendor string: nouveau

Software versions:
MesaLib-10.3.0
xf86-video-nouveau-1.0.11
libdrm-2.4.58
Linux version 3.16.5

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1413115345.7dc480.7112
Date: Sun, 12 Oct 2014 12:02:25 +0000
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
   title="NEW - Optimus with nouveau no longer works with xorg-server 1.16.1"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=84932">84932</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Optimus with nouveau no longer works with xorg-server 1.16.1
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>10.2
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
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>dura&#64;duradsl.duckdns.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=107736" name="attach_107736" title="dmesg">attachment 107736</a> <a href="attachment.cgi?id=107736&amp;action=edit" title="dmesg">[details]</a></span>
dmesg

I have an optimus laptop with intel HD4000 and nvidia GTX 660M.
With xorg-server 1.16.1 the GPU cannot be used. Replacing xorg-server with
1.15.1 version (and same version drivers) make it works again without making
any other changes (even rebooting).

xrandr --listproviders 
xrandr --setprovideroffloadsink nouveau Intel
DRI_PRIME=1 glxinfo | grep &quot;OpenGL vendor string&quot;

With 1.16 version:
Providers: number : 2
Provider 0: id: 0x88 cap: 0xb, Source Output, Sink Output, Sink Offload crtcs:
4 outputs: 5 associated providers: 1 name:Intel
Provider 1: id: 0x5f cap: 0x5, Source Output, Source Offload crtcs: 0 outputs:
0 associated providers: 1 name:nouveau
OpenGL vendor string: Intel Open Source Technology Center

With 1.15 version:
Providers: number : 2
Provider 0: id: 0x88 cap: 0xb, Source Output, Sink Output, Sink Offload crtcs:
4 outputs: 5 associated providers: 1 name:Intel
Provider 1: id: 0x5f cap: 0x5, Source Output, Source Offload crtcs: 0 outputs:
0 associated providers: 1 name:nouveau
OpenGL vendor string: nouveau

Software versions:
MesaLib-10.3.0
xf86-video-nouveau-1.0.11
libdrm-2.4.58
Linux version 3.16.5</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1413115345.7dc480.7112--

--===============0985291579==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0985291579==--
