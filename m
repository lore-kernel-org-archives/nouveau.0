From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67315] System lockup with X consuming all CPU
Date: Fri, 26 Jul 2013 00:01:56 +0000
Message-ID: <bug-67315-8800-xGVYE9PDZ2@http.bugs.freedesktop.org/>
References: <bug-67315-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1757302350=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67315-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1757302350==
Content-Type: multipart/alternative; boundary="1374796916.5e122.2799"; charset="us-ascii"


--1374796916.5e122.2799
Date: Fri, 26 Jul 2013 00:01:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67315

--- Comment #2 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi Rick

Before jumping to compulsions can you configure your Xserver to not load
* libglamoregl.so
* vesa_drv.so
* modesetting_drv.so

The last two should be ignored if you use an xorg.conf as shown in here [1].
Whereas for the first one you could try an temporary rename the file (there may
be a better way to handle it, which I'm not aware of).

With that said, try and narrow down what's causing the issue. A scenario such
as
* as soon as my screensaver kicks in
* using program XX
* doing action A, while using program YY, followed by action C.

As the issue occurs, try and attach the complete output of dmesg (or save the
output to a file and attach at a later point)

Cheers
Emil

[1] "Configuring the X server"
http://nouveau.freedesktop.org/wiki/InstallNouveau/

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374796916.5e122.2799
Date: Fri, 26 Jul 2013 00:01:56 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - System lockup with X consuming all CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67315#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - System lockup with X consuming all CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67315">bug 67315</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Hi Rick

Before jumping to compulsions can you configure your Xserver to not load
* libglamoregl.so
* vesa_drv.so
* modesetting_drv.so

The last two should be ignored if you use an xorg.conf as shown in here [1].
Whereas for the first one you could try an temporary rename the file (there may
be a better way to handle it, which I'm not aware of).

With that said, try and narrow down what's causing the issue. A scenario such
as
* as soon as my screensaver kicks in
* using program XX
* doing action A, while using program YY, followed by action C.

As the issue occurs, try and attach the complete output of dmesg (or save the
output to a file and attach at a later point)

Cheers
Emil

[1] &quot;Configuring the X server&quot;
<a href="http://nouveau.freedesktop.org/wiki/InstallNouveau/">http://nouveau.freedesktop.org/wiki/InstallNouveau/</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374796916.5e122.2799--

--===============1757302350==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1757302350==--
