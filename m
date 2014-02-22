From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 15758] Invisible mouse pointer on NV4E (C51)
Date: Sat, 22 Feb 2014 22:29:07 +0000
Message-ID: <bug-15758-8800-oJ3pcekJ15@http.bugs.freedesktop.org/>
References: <bug-15758-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1310472076=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-15758-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1310472076==
Content-Type: multipart/alternative; boundary="1393108147.cFCb7.8103"; charset="us-ascii"


--1393108147.cFCb7.8103
Date: Sat, 22 Feb 2014 22:29:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=15758

--- Comment #35 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Created attachment 94589
  --> https://bugs.freedesktop.org/attachment.cgi?id=94589&action=edit
sleep for a second after hiding cursor

This patch is the equivalent of
http://cgit.freedesktop.org/xorg/driver/xf86-video-nv/commit/?id=7f281be7e53ac274016a6af6b2b5dc6f8bddb810
(but restricted to nv4e). Hopefully the cursor isn't disabled from inside
interrupts, or this will go splat.

I'm not suggesting something like this for inclusion into the kernel, but it'd
be good to verify that the same workaround works in the kernel.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1393108147.cFCb7.8103
Date: Sat, 22 Feb 2014 22:29:07 +0000
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
          bz_status_REOPENED "
   title="REOPENED --- - Invisible mouse pointer on NV4E (C51)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=15758#c35">Comment # 35</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - Invisible mouse pointer on NV4E (C51)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=15758">bug 15758</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=94589" name="attach_94589" title="sleep for a second after hiding cursor">attachment 94589</a> <a href="attachment.cgi?id=94589&amp;action=edit" title="sleep for a second after hiding cursor">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=15758&amp;attachment=94589'>[review]</a>
sleep for a second after hiding cursor

This patch is the equivalent of
<a href="http://cgit.freedesktop.org/xorg/driver/xf86-video-nv/commit/?id=7f281be7e53ac274016a6af6b2b5dc6f8bddb810">http://cgit.freedesktop.org/xorg/driver/xf86-video-nv/commit/?id=7f281be7e53ac274016a6af6b2b5dc6f8bddb810</a>
(but restricted to nv4e). Hopefully the cursor isn't disabled from inside
interrupts, or this will go splat.

I'm not suggesting something like this for inclusion into the kernel, but it'd
be good to verify that the same workaround works in the kernel.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1393108147.cFCb7.8103--

--===============1310472076==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1310472076==--
