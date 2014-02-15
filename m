From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75013] [NVC1] [Quadro 600] Display update issues,
 stale rendered content
Date: Sat, 15 Feb 2014 12:24:03 +0000
Message-ID: <bug-75013-8800-ZKgVWTbRMf@http.bugs.freedesktop.org/>
References: <bug-75013-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1247864135=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75013-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1247864135==
Content-Type: multipart/alternative; boundary="1392467043.d172f8d72.4497"; charset="us-ascii"


--1392467043.d172f8d72.4497
Date: Sat, 15 Feb 2014 12:24:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75013

--- Comment #2 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Some highlights from the logs
* Dual gpu system - intel + nouveau combo
* Default GPU: intel(Haswell Desktop?), ddx version 2.99.904
* nouveau ddx version 1.0.9
* Mesa 9.2.1
* The following Xorg.log spam could be related (coming from xserver/randr)

reporting 6 10 18 137
reporting 6 10 18 137
[nouveau] parsing EDID
reporting 6 10 18 137
[intel](II) intel(0): resizing framebuffer to 1680x1050
have a master to look out for
adjust shatters 0 1680
resize called 1680 1050
need to create shared pixmap 1reporting 6 10 18 137
reporting 6 10 18 137
reporting 6 10 18 137
...
reporting 6 10 18 137
[nouveau] parsing EDID
reporting 6 10 18 137
...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392467043.d172f8d72.4497
Date: Sat, 15 Feb 2014 12:24:03 +0000
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
   title="NEW --- - [NVC1] [Quadro 600] Display update issues, stale rendered content"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75013#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] [Quadro 600] Display update issues, stale rendered content"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75013">bug 75013</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Some highlights from the logs
* Dual gpu system - intel + nouveau combo
* Default GPU: intel(Haswell Desktop?), ddx version 2.99.904
* nouveau ddx version 1.0.9
* Mesa 9.2.1
* The following Xorg.log spam could be related (coming from xserver/randr)

reporting 6 10 18 137
reporting 6 10 18 137
[nouveau] parsing EDID
reporting 6 10 18 137
[intel](II) intel(0): resizing framebuffer to 1680x1050
have a master to look out for
adjust shatters 0 1680
resize called 1680 1050
need to create shared pixmap 1reporting 6 10 18 137
reporting 6 10 18 137
reporting 6 10 18 137
...
reporting 6 10 18 137
[nouveau] parsing EDID
reporting 6 10 18 137
...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392467043.d172f8d72.4497--

--===============1247864135==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1247864135==--
