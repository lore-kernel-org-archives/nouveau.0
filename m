From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71116] [Ubuntu userspace upgrade 13.04 ->
 13.10][regression] NV34 card fails to properly resume.
Date: Sun, 03 Nov 2013 13:59:11 +0000
Message-ID: <bug-71116-8800-btP6Zq15gK@http.bugs.freedesktop.org/>
References: <bug-71116-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0715100794=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71116-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0715100794==
Content-Type: multipart/alternative; boundary="1383487151.d31d4F2.32332"; charset="us-ascii"


--1383487151.d31d4F2.32332
Date: Sun, 3 Nov 2013 13:59:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71116

--- Comment #13 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #11)
> I relocated /usr/lib/i386-linux-gnu/dri/nouveau_dri.so to nouveau_dri_off.so
> and restarted the computer with AGP. I confirmed the AIGLX error in that it
> switches to swrast.
> 
> Did not fix the s2disk issue (dmesg attached).
> 
> So, it's not mesa nor the kernel. All that remains is (just...) the X
> server, xf86-video-nouveau and libdrm. Right?

Sounds like it.
Do you know which gcc version is/was used to compile the new libdrm ? Might it
be related to this http://gcc.gnu.org/ml/gcc-help/2013-07/msg00103.html?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1383487151.d31d4F2.32332
Date: Sun, 3 Nov 2013 13:59:11 +0000
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
   title="NEW --- - [Ubuntu userspace upgrade 13.04 -&gt; 13.10][regression] NV34 card fails to properly resume."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71116#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [Ubuntu userspace upgrade 13.04 -&gt; 13.10][regression] NV34 card fails to properly resume."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71116">bug 71116</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=71116#c11">comment #11</a>)
<span class="quote">&gt; I relocated /usr/lib/i386-linux-gnu/dri/nouveau_dri.so to nouveau_dri_off.so
&gt; and restarted the computer with AGP. I confirmed the AIGLX error in that it
&gt; switches to swrast.
&gt; 
&gt; Did not fix the s2disk issue (dmesg attached).
&gt; 
&gt; So, it's not mesa nor the kernel. All that remains is (just...) the X
&gt; server, xf86-video-nouveau and libdrm. Right?</span >

Sounds like it.
Do you know which gcc version is/was used to compile the new libdrm ? Might it
be related to this <a href="http://gcc.gnu.org/ml/gcc-help/2013-07/msg00103.html">http://gcc.gnu.org/ml/gcc-help/2013-07/msg00103.html</a>?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1383487151.d31d4F2.32332--

--===============0715100794==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0715100794==--
