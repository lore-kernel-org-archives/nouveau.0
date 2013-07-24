From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67051] No nouveau HDMI sound on NVIDIA GT430
Date: Wed, 24 Jul 2013 05:02:15 +0000
Message-ID: <bug-67051-8800-4r7VWHtiz6@http.bugs.freedesktop.org/>
References: <bug-67051-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1595973354=="
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


--===============1595973354==
Content-Type: multipart/alternative; boundary="1374642135.be5ebA0f0.18911"; charset="us-ascii"


--1374642135.be5ebA0f0.18911
Date: Wed, 24 Jul 2013 05:02:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67051

--- Comment #85 from Alex <alupu01-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
> ... I made the change on top of a much more recent kernel, and I guess
> my patches don't apply. You should be able to do this test on top of a
> recent kernel -- e.g. 3.10, or 3.11-rc2. You can get this by just doing "git
> checkout master" (or "origin" instead of "master", I forget)
> 
> perhaps I'll do that [whatever] later
> if you run into trouble with this or the results are nonsensical.

This is a really quick and not necessarily rigorous update.
I did run into trouble:

I went for 'git checkout _master_' - got something like 3.11.0-rc1+;
the patches (including the last one, debug-3), worked OK.
It's possible my "standard" '.config' file (circa 3.7.0-rc4+) I'd been using
for the tests (without any of my "massaging" it during the 'make menuconfig' -
for lack of time and energy) was a bit too long in the tooth for the "master"
kernel to "adapt" to.
The end result was after boot-up I couldn't even go into X at all and the
system got almost frozen and unmanageable.  In short, as you'd put it,
nonsensical.
Right now I'm back on my tried and true 3.7.10 (i.e., standard <-> git), the
last "official" with the HDMI sound, ready to resume the patches and any tests
in a more organized and less frantic way.  For better or worse, that will
happen not sooner than Wednesday, July 24, 6-7 PM EDT.
At least you get a chance to go over them mmio traces more thoroughly (if you
haven't done that already).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374642135.be5ebA0f0.18911
Date: Wed, 24 Jul 2013 05:02:15 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051#c85">Comment # 85</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051">bug 67051</a>
              from <span class="vcard"><a class="email" href="mailto:alupu01&#64;gmail.com" title="Alex &lt;alupu01&#64;gmail.com&gt;"> <span class="fn">Alex</span></a>
</span></b>
        <pre><span class="quote">&gt; ... I made the change on top of a much more recent kernel, and I guess
&gt; my patches don't apply. You should be able to do this test on top of a
&gt; recent kernel -- e.g. 3.10, or 3.11-rc2. You can get this by just doing &quot;git
&gt; checkout master&quot; (or &quot;origin&quot; instead of &quot;master&quot;, I forget)
&gt; 
&gt; perhaps I'll do that [whatever] later
&gt; if you run into trouble with this or the results are nonsensical.</span >

This is a really quick and not necessarily rigorous update.
I did run into trouble:

I went for 'git checkout _master_' - got something like 3.11.0-rc1+;
the patches (including the last one, debug-3), worked OK.
It's possible my &quot;standard&quot; '.config' file (circa 3.7.0-rc4+) I'd been using
for the tests (without any of my &quot;massaging&quot; it during the 'make menuconfig' -
for lack of time and energy) was a bit too long in the tooth for the &quot;master&quot;
kernel to &quot;adapt&quot; to.
The end result was after boot-up I couldn't even go into X at all and the
system got almost frozen and unmanageable.  In short, as you'd put it,
nonsensical.
Right now I'm back on my tried and true 3.7.10 (i.e., standard &lt;-&gt; git), the
last &quot;official&quot; with the HDMI sound, ready to resume the patches and any tests
in a more organized and less frantic way.  For better or worse, that will
happen not sooner than Wednesday, July 24, 6-7 PM EDT.
At least you get a chance to go over them mmio traces more thoroughly (if you
haven't done that already).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374642135.be5ebA0f0.18911--

--===============1595973354==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1595973354==--
