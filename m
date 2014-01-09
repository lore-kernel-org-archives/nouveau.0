From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73445] New: [NV4E] regression with 3.13 -rcX:
 glxgears etc. hard lockup/freezes machine, on 3.12 everything works
Date: Thu, 09 Jan 2014 19:25:48 +0000
Message-ID: <bug-73445-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1772668840=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1772668840==
Content-Type: multipart/alternative; boundary="1389295547.eD77bC0.30068"; charset="us-ascii"


--1389295547.eD77bC0.30068
Date: Thu, 9 Jan 2014 19:25:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73445

          Priority: medium
            Bug ID: 73445
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NV4E] regression with 3.13 -rcX: glxgears etc. hard
                    lockup/freezes machine, on 3.12 everything works
          Severity: critical
    Classification: Unclassified
                OS: Linux (All)
          Reporter: christian.niemeyer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: 10.0
         Component: Drivers/DRI/nouveau
           Product: Mesa

This seems to be a regression.

Running ubuntu 14.04 development branch. On an old HP G6000 notebook with
GeForce Go 6000, this is NV4E according to my /var/log/Xorg.0.log

With 3.12.0-7-generic everything runs fine. Even basic acceleration in Firefox
and playing games in Steam (like World of Goo or Snuggle Truck - those run
flawlessly). I have OpenGL 2.1 support and Shader Language 1.20 according to
glxinfo

I runs fine on 3.12-x with Mesa 10.0 and also fine with xorg-edergs PPA with
Mesa 10.1.0-devel

However in both cases booting any 3.13 kernel and running the first GL
application like glxgears or starting a game, my system entirely freezes.
Whether I use stock repository or xorg-edgers. So to me this doesn't seem to be
directly Mesa related, there is some problem with kernel 3.13 definitely. It
freezes reproduceable 100%. No problems with 3.12.

Once I could reat a VT after a while, but it didn't react anymore.

3.13 is going to be the kernel for ubuntu 14.04 LTS. 

Sorry, this is my first bug report, please be kind. I'm not able to get any log
files after reboot.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389295547.eD77bC0.30068
Date: Thu, 9 Jan 2014 19:25:47 +0000
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
   title="NEW --- - [NV4E] regression with 3.13 -rcX: glxgears etc. hard lockup/freezes machine, on 3.12 everything works"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73445">73445</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV4E] regression with 3.13 -rcX: glxgears etc. hard lockup/freezes machine, on 3.12 everything works
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>critical
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
          <td>christian.niemeyer&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>10.0
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
        <pre>This seems to be a regression.

Running ubuntu 14.04 development branch. On an old HP G6000 notebook with
GeForce Go 6000, this is NV4E according to my /var/log/Xorg.0.log

With 3.12.0-7-generic everything runs fine. Even basic acceleration in Firefox
and playing games in Steam (like World of Goo or Snuggle Truck - those run
flawlessly). I have OpenGL 2.1 support and Shader Language 1.20 according to
glxinfo

I runs fine on 3.12-x with Mesa 10.0 and also fine with xorg-edergs PPA with
Mesa 10.1.0-devel

However in both cases booting any 3.13 kernel and running the first GL
application like glxgears or starting a game, my system entirely freezes.
Whether I use stock repository or xorg-edgers. So to me this doesn't seem to be
directly Mesa related, there is some problem with kernel 3.13 definitely. It
freezes reproduceable 100%. No problems with 3.12.

Once I could reat a VT after a while, but it didn't react anymore.

3.13 is going to be the kernel for ubuntu 14.04 LTS. 

Sorry, this is my first bug report, please be kind. I'm not able to get any log
files after reboot.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389295547.eD77bC0.30068--

--===============1772668840==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1772668840==--
