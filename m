From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79823] [NV30/gallium] Mozilla apps freeze on startup
 with nouveau-dri-10.2.1 libs on dual-screen
Date: Tue, 10 Jun 2014 20:56:13 +0000
Message-ID: <bug-79823-8800-pdlHnSAKHm@http.bugs.freedesktop.org/>
References: <bug-79823-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0644185436=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-79823-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0644185436==
Content-Type: multipart/alternative; boundary="1402433772.f7D2C51.11855"; charset="us-ascii"


--1402433772.f7D2C51.11855
Date: Tue, 10 Jun 2014 20:56:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=79823

--- Comment #7 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #6)
> From freeze strace log:
> 
>  # Device opened:
> open("/dev/dri/card0", O_RDWR|O_CLOEXEC) = 5
>  ...
> close(5)                    = 0
>  # device /dev/dri/card0 closed, but trying to use already closed descriptor:
> fstat64(5, 0xbfa97f60)      = -1 EBADF (Bad file descriptor)
> ioctl(5, 0xc0406481, 0xbfa97fc0) = -1 EBADF (Bad file descriptor)
> write(2, "nouveau: kernel rejected pushbuf"..., 54) = 54

Curious. Do you have a dmesg from that? And the full output that was written
out to stderr?

A bisect will still be the most effective way of tracking down the issue.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1402433772.f7D2C51.11855
Date: Tue, 10 Jun 2014 20:56:12 +0000
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
   title="NEW --- - [NV30/gallium] Mozilla apps freeze on startup with nouveau-dri-10.2.1 libs on dual-screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79823#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV30/gallium] Mozilla apps freeze on startup with nouveau-dri-10.2.1 libs on dual-screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79823">bug 79823</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=79823#c6">comment #6</a>)
<span class="quote">&gt; From freeze strace log:
&gt; 
&gt;  # Device opened:
&gt; open(&quot;/dev/dri/card0&quot;, O_RDWR|O_CLOEXEC) = 5
&gt;  ...
&gt; close(5)                    = 0
&gt;  # device /dev/dri/card0 closed, but trying to use already closed descriptor:
&gt; fstat64(5, 0xbfa97f60)      = -1 EBADF (Bad file descriptor)
&gt; ioctl(5, 0xc0406481, 0xbfa97fc0) = -1 EBADF (Bad file descriptor)
&gt; write(2, &quot;nouveau: kernel rejected pushbuf&quot;..., 54) = 54</span >

Curious. Do you have a dmesg from that? And the full output that was written
out to stderr?

A bisect will still be the most effective way of tracking down the issue.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1402433772.f7D2C51.11855--

--===============0644185436==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0644185436==--
