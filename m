From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67051] No nouveau HDMI sound on NVIDIA GT430
Date: Tue, 23 Jul 2013 15:23:48 +0000
Message-ID: <bug-67051-8800-K5a2l0DYX2@http.bugs.freedesktop.org/>
References: <bug-67051-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0660295455=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67051-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0660295455==
Content-Type: multipart/alternative; boundary="1374593028.D6dD0.31536"; charset="us-ascii"


--1374593028.D6dD0.31536
Date: Tue, 23 Jul 2013 15:23:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67051

--- Comment #72 from Alex <alupu01-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #71)
> > echo nop > /sys/.../current_tracer (I forget the exact file, but it's on
> > that wiki page).
> 
> Speaking of that, I don't have '/sys/kernel/debug/'
> Looking around I do have
> DEBUG_KERNEL and DEBUG_DRIVER both on "yes".
> What gives?

I've figured it out.
Debug Filesystem: yes
CONFIG_DEBUG_FS --> /sys/kernel/debug/  !!!???

Who'd have thunk it?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374593028.D6dD0.31536
Date: Tue, 23 Jul 2013 15:23:48 +0000
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
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051#c72">Comment # 72</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051">bug 67051</a>
              from <span class="vcard"><a class="email" href="mailto:alupu01&#64;gmail.com" title="Alex &lt;alupu01&#64;gmail.com&gt;"> <span class="fn">Alex</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=67051#c71">comment #71</a>)
<span class="quote">&gt; &gt; echo nop &gt; /sys/.../current_tracer (I forget the exact file, but it's on
&gt; &gt; that wiki page).
&gt; 
&gt; Speaking of that, I don't have '/sys/kernel/debug/'
&gt; Looking around I do have
&gt; DEBUG_KERNEL and DEBUG_DRIVER both on &quot;yes&quot;.
&gt; What gives?</span >

I've figured it out.
Debug Filesystem: yes
CONFIG_DEBUG_FS --&gt; /sys/kernel/debug/  !!!???

Who'd have thunk it?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374593028.D6dD0.31536--

--===============0660295455==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0660295455==--
