From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67878] Hardware freeze after resume from suspend
Date: Fri, 09 Aug 2013 17:39:45 +0000
Message-ID: <bug-67878-8800-oZIRyoGwBl@http.bugs.freedesktop.org/>
References: <bug-67878-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1442678862=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67878-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1442678862==
Content-Type: multipart/alternative; boundary="1376069985.0177db1.8064"; charset="us-ascii"


--1376069985.0177db1.8064
Date: Fri, 9 Aug 2013 17:39:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67878

--- Comment #12 from Ben Gamari <bgamari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
The mesa tests mentioned above were conducted on a 3.10 kernel. In the mesa 9.1
case there is nothing interesting spit out by nouveau to dmesg. Only a few
status messages,

    [  312.871019] nouveau  [     DRM] suspending fbcon...
    [  312.871023] nouveau  [     DRM] suspending display...
    [  312.871049] nouveau  [     DRM] unpinning framebuffer(s)...
    [  312.871108] nouveau  [     DRM] evicting buffers...
    [  313.133858] nouveau  [     DRM] waiting for kernel channels to go
idle...
    [  313.133883] nouveau  [     DRM] suspending client object trees...
    [  313.134682] nouveau  [     DRM] suspending kernel object tree...
    ...
    [  317.178155] nouveau  [     DRM] re-enabling device...
    [  317.178170] nouveau  [     DRM] resuming kernel object tree...
    [  317.178176] nouveau  [   VBIOS][0000:01:00.0] running init tables
    [  317.287651] serial 00:08: activated
    [  317.357172] nouveau  [     DRM] resuming client object trees...
    [  317.357691] nouveau  [     DRM] resuming display...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1376069985.0177db1.8064
Date: Fri, 9 Aug 2013 17:39:45 +0000
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
   title="NEW --- - Hardware freeze after resume from suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67878#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Hardware freeze after resume from suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67878">bug 67878</a>
              from <span class="vcard"><a class="email" href="mailto:bgamari&#64;gmail.com" title="Ben Gamari &lt;bgamari&#64;gmail.com&gt;"> <span class="fn">Ben Gamari</span></a>
</span></b>
        <pre>The mesa tests mentioned above were conducted on a 3.10 kernel. In the mesa 9.1
case there is nothing interesting spit out by nouveau to dmesg. Only a few
status messages,

    [  312.871019] nouveau  [     DRM] suspending fbcon...
    [  312.871023] nouveau  [     DRM] suspending display...
    [  312.871049] nouveau  [     DRM] unpinning framebuffer(s)...
    [  312.871108] nouveau  [     DRM] evicting buffers...
    [  313.133858] nouveau  [     DRM] waiting for kernel channels to go
idle...
    [  313.133883] nouveau  [     DRM] suspending client object trees...
    [  313.134682] nouveau  [     DRM] suspending kernel object tree...
    ...
    [  317.178155] nouveau  [     DRM] re-enabling device...
    [  317.178170] nouveau  [     DRM] resuming kernel object tree...
    [  317.178176] nouveau  [   VBIOS][0000:01:00.0] running init tables
    [  317.287651] serial 00:08: activated
    [  317.357172] nouveau  [     DRM] resuming client object trees...
    [  317.357691] nouveau  [     DRM] resuming display...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1376069985.0177db1.8064--

--===============1442678862==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1442678862==--
