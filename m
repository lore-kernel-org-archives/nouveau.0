From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75279] XCloseDisplay() takes one minute around
 nouveau_dri.so, freezing Firefox startup
Date: Fri, 21 Feb 2014 07:35:26 +0000
Message-ID: <bug-75279-8800-DbGmasJ08y@http.bugs.freedesktop.org/>
References: <bug-75279-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1441742695=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75279-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1441742695==
Content-Type: multipart/alternative; boundary="1392968125.2EdD612.26979"; charset="us-ascii"


--1392968125.2EdD612.26979
Date: Fri, 21 Feb 2014 07:35:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75279

--- Comment #7 from Frederic Bezies <fredbezies-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I'm the reporter on mozilla bugzilla tracker.

Some technical infos on my computer.

Using archlinux, 64 bits.

Software versions ? Kernel upgraded less than an hour ago.

[fred@fredo-arch ~]$ pacman -Si mesa | grep Version
Version               : 10.0.3-1
[fred@fredo-arch ~]$ pacman -Si xf86-video-nouveau | grep Version
Version               : 1.0.10-2
[fred@fredo-arch ~]$ pacman -Si linux | grep Version
Version               : 3.13.4-1

Hardware ?
[fred@fredo-arch ~]$ lspci | grep VGA
02:00.0 VGA compatible controller: NVIDIA Corporation GT218 [GeForce 210] (rev
a2)

Will add glxinfo log asap.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392968125.2EdD612.26979
Date: Fri, 21 Feb 2014 07:35:25 +0000
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
   title="NEW --- - XCloseDisplay() takes one minute around nouveau_dri.so, freezing Firefox startup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75279#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - XCloseDisplay() takes one minute around nouveau_dri.so, freezing Firefox startup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75279">bug 75279</a>
              from <span class="vcard"><a class="email" href="mailto:fredbezies&#64;gmail.com" title="Frederic Bezies &lt;fredbezies&#64;gmail.com&gt;"> <span class="fn">Frederic Bezies</span></a>
</span></b>
        <pre>I'm the reporter on mozilla bugzilla tracker.

Some technical infos on my computer.

Using archlinux, 64 bits.

Software versions ? Kernel upgraded less than an hour ago.

[fred&#64;fredo-arch ~]$ pacman -Si mesa | grep Version
Version               : 10.0.3-1
[fred&#64;fredo-arch ~]$ pacman -Si xf86-video-nouveau | grep Version
Version               : 1.0.10-2
[fred&#64;fredo-arch ~]$ pacman -Si linux | grep Version
Version               : 3.13.4-1

Hardware ?
[fred&#64;fredo-arch ~]$ lspci | grep VGA
02:00.0 VGA compatible controller: NVIDIA Corporation GT218 [GeForce 210] (rev
a2)

Will add glxinfo log asap.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392968125.2EdD612.26979--

--===============1441742695==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1441742695==--
