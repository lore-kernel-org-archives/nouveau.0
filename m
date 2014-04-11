From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77333] New: Xorg segfaults trying to use nouveau
 GK208 as offloadsink provider
Date: Fri, 11 Apr 2014 15:44:55 +0000
Message-ID: <bug-77333-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1580762993=="
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


--===============1580762993==
Content-Type: multipart/alternative; boundary="1397231095.5Bad71.18810"; charset="us-ascii"


--1397231095.5Bad71.18810
Date: Fri, 11 Apr 2014 15:44:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77333

          Priority: medium
            Bug ID: 77333
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Xorg segfaults trying to use nouveau GK208 as
                    offloadsink provider
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: nirbheek.chauhan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Steps to reproduce:

$ xrandr --listproviders
Providers: number : 2
Provider 0: id: 0x64 cap: 0xb, Source Output, Sink Output, Sink Offload crtcs:
3 outputs: 2 associated providers: 1 name:Intel
Provider 1: id: 0x3f cap: 0x5, Source Output, Source Offload crtcs: 0 outputs:
0 associated providers: 1 name:nouveau

$ xrandr --setprovideroffloadsink nouveau Intel

$ DRI_PRIME=1 glxinfo | grep "OpenGL vendor string"
[segfault]

I'm running kernel 3.14 on Fedora 20, with Xorg 1.14.4,
xf86-video-nouveau-1.0.9, Mesa 10.0.4. Logs are attached below.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1397231095.5Bad71.18810
Date: Fri, 11 Apr 2014 15:44:55 +0000
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
   title="NEW --- - Xorg segfaults trying to use nouveau GK208 as offloadsink provider"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77333">77333</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Xorg segfaults trying to use nouveau GK208 as offloadsink provider
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
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
          <td>nirbheek.chauhan&#64;gmail.com
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
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Steps to reproduce:

$ xrandr --listproviders
Providers: number : 2
Provider 0: id: 0x64 cap: 0xb, Source Output, Sink Output, Sink Offload crtcs:
3 outputs: 2 associated providers: 1 name:Intel
Provider 1: id: 0x3f cap: 0x5, Source Output, Source Offload crtcs: 0 outputs:
0 associated providers: 1 name:nouveau

$ xrandr --setprovideroffloadsink nouveau Intel

$ DRI_PRIME=1 glxinfo | grep &quot;OpenGL vendor string&quot;
[segfault]

I'm running kernel 3.14 on Fedora 20, with Xorg 1.14.4,
xf86-video-nouveau-1.0.9, Mesa 10.0.4. Logs are attached below.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1397231095.5Bad71.18810--

--===============1580762993==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1580762993==--
