From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70354] [NVE6, NVE7] HUB_INIT timeout on graph init,
 blob fw doesn't help
Date: Wed, 05 Mar 2014 21:24:51 +0000
Message-ID: <bug-70354-8800-Iy3ovPF0vg@http.bugs.freedesktop.org/>
References: <bug-70354-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1486568843=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70354-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1486568843==
Content-Type: multipart/alternative; boundary="1394054690.5c0d2.4922"; charset="us-ascii"


--1394054690.5c0d2.4922
Date: Wed, 5 Mar 2014 21:24:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70354

--- Comment #22 from Joey 4712 <4712.joey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Thanks soooo much.

It's working now with you patch applied against Linux 3.13 Kernel source on
Manjaro Linux.

  $ xrandr --setprovideroffloadsink nouveau Intel
  $ DRI_PRIME=1 glxgears -info
  Running synchronized to the vertical refresh.  The framerate should be
  approximately the same as the monitor refresh rate.
  GL_RENDERER   = Gallium 0.4 on NVE7
  GL_VERSION    = 3.0 Mesa 10.0.3
  GL_VENDOR     = nouveau

Do you need any more info? Like dmesg of the now working nouveau setup?

Once again, thanks to all of you!

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1394054690.5c0d2.4922
Date: Wed, 5 Mar 2014 21:24:50 +0000
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
   title="NEW --- - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn't help"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354#c22">Comment # 22</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn't help"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354">bug 70354</a>
              from <span class="vcard"><a class="email" href="mailto:4712.joey&#64;gmail.com" title="Joey 4712 &lt;4712.joey&#64;gmail.com&gt;"> <span class="fn">Joey 4712</span></a>
</span></b>
        <pre>Thanks soooo much.

It's working now with you patch applied against Linux 3.13 Kernel source on
Manjaro Linux.

  $ xrandr --setprovideroffloadsink nouveau Intel
  $ DRI_PRIME=1 glxgears -info
  Running synchronized to the vertical refresh.  The framerate should be
  approximately the same as the monitor refresh rate.
  GL_RENDERER   = Gallium 0.4 on NVE7
  GL_VERSION    = 3.0 Mesa 10.0.3
  GL_VENDOR     = nouveau

Do you need any more info? Like dmesg of the now working nouveau setup?

Once again, thanks to all of you!</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1394054690.5c0d2.4922--

--===============1486568843==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1486568843==--
