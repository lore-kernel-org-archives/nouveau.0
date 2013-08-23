From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58556] MacBook Pro 5, 1 with nVidia 9400m and 9600m,
 scrambled screen
Date: Fri, 23 Aug 2013 17:47:08 +0000
Message-ID: <bug-58556-8800-c5AqyTemQk@http.bugs.freedesktop.org/>
References: <bug-58556-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1346447246=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58556-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1346447246==
Content-Type: multipart/alternative; boundary="1377280028.FfB4F0C83.26862"; charset="us-ascii"


--1377280028.FfB4F0C83.26862
Date: Fri, 23 Aug 2013 17:47:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58556

--- Comment #16 from Jamie Macdonald <jamie.alban-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I patched my kernel with this diff: http://pastebin.com/q3MVep1f

to screen the 9400m from being initialized.
this: http://pastebin.com/JMrbbFVA is the dmesg output. (search "jamie")

with this patch, my command line is *not scrambled* when I use
nouveau.noaccel=1, but crashes without that argument.

When I screen the 9600m from being initialized in the same way instead, the
console gets scrambled with nouveau.noaccel=1 and crashes without that
argument.

But, in the case of screening the 9400m, and using nouveau.noaccel=1, I cannot
start X - it gives a "No screens found" error. Using that patched kernel, and
trying to use the Nvidia proprietary driver fails as well with a "No screens
found" error - but the Nvidia driver works when I use the unpatched kernel.

And now I'm stuck .. any help?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377280028.FfB4F0C83.26862
Date: Fri, 23 Aug 2013 17:47:08 +0000
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
   title="REOPENED --- - MacBook Pro 5,1 with nVidia 9400m and 9600m, scrambled screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58556#c16">Comment # 16</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - MacBook Pro 5,1 with nVidia 9400m and 9600m, scrambled screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58556">bug 58556</a>
              from <span class="vcard"><a class="email" href="mailto:jamie.alban&#64;gmail.com" title="Jamie Macdonald &lt;jamie.alban&#64;gmail.com&gt;"> <span class="fn">Jamie Macdonald</span></a>
</span></b>
        <pre>I patched my kernel with this diff: <a href="http://pastebin.com/q3MVep1f">http://pastebin.com/q3MVep1f</a>

to screen the 9400m from being initialized.
this: <a href="http://pastebin.com/JMrbbFVA">http://pastebin.com/JMrbbFVA</a> is the dmesg output. (search &quot;jamie&quot;)

with this patch, my command line is *not scrambled* when I use
nouveau.noaccel=1, but crashes without that argument.

When I screen the 9600m from being initialized in the same way instead, the
console gets scrambled with nouveau.noaccel=1 and crashes without that
argument.

But, in the case of screening the 9400m, and using nouveau.noaccel=1, I cannot
start X - it gives a &quot;No screens found&quot; error. Using that patched kernel, and
trying to use the Nvidia proprietary driver fails as well with a &quot;No screens
found&quot; error - but the Nvidia driver works when I use the unpatched kernel.

And now I'm stuck .. any help?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377280028.FfB4F0C83.26862--

--===============1346447246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1346447246==--
