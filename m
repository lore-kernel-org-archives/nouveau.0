From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 72952] [NV94] no HDMI output,
 xrands claims DVI-D-1 disconnected
Date: Tue, 28 Jan 2014 20:23:52 +0000
Message-ID: <bug-72952-8800-xxFWI0cbJN@http.bugs.freedesktop.org/>
References: <bug-72952-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2065011691=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-72952-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2065011691==
Content-Type: multipart/alternative; boundary="1390940632.7e3b5E2.2314"; charset="us-ascii"


--1390940632.7e3b5E2.2314
Date: Tue, 28 Jan 2014 20:23:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=72952

--- Comment #8 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #7)
> I'm sure you meant attachment #92185 [details] [review] not the log file,

Indeed. Although a different approach was finally merged, that the original bug
reporter (and several others with the same issue) confirmed also fixed the
problem.

> but I'm sorry I've never recompiled a kernel or driver yet, despite decades
> of UNIX. One thing that worked well in the past with the Intel driver was
> when Keith put an intel_drv.so online for us users to try out. Is your
> nouveau_drv.so online (for SuSE 13.1/64) somewhere?

Unfortunately this is for a kernel module. If I were really clever, I could
figure out exactly how your kernel was built (and exactly what version), which
compiler, which settings, etc, and build a module that worked for you. But I'm
not that clever, or perhaps too lazy -- take your pick. Here's a guide for
building your own kernel on SUSE:

https://www.suse.com/communities/conversations/compiling-de-linux-kernel-suse-way/

I have no clue whether these instructions are in the least valid. You can also
just wait for 3.14-rc1 to come out and perhaps a fresh kernel will be
installable from

http://en.opensuse.org/openSUSE:Kernel_of_the_day

(These are all things I found with a quick Google search -- I have no knowledge
of SUSE beyond the fact that its auto-configurer tool... YaST iirc... that
overwrote all of my careful config modifications wildly annoyed me back in
~1999 or so and I decided to never touch it again.)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1390940632.7e3b5E2.2314
Date: Tue, 28 Jan 2014 20:23:52 +0000
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
   title="NEW --- - [NV94] no HDMI output, xrands claims DVI-D-1 disconnected"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72952#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV94] no HDMI output, xrands claims DVI-D-1 disconnected"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72952">bug 72952</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=72952#c7">comment #7</a>)
<span class="quote">&gt; I'm sure you meant <span class=""><a href="attachment.cgi?id=92185" name="attach_92185" title="vbios-pq1.patch">attachment #92185</a> <a href="attachment.cgi?id=92185&amp;action=edit" title="vbios-pq1.patch">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=72952&amp;attachment=92185'>[review]</a> [review] not the log file,</span >

Indeed. Although a different approach was finally merged, that the original bug
reporter (and several others with the same issue) confirmed also fixed the
problem.

<span class="quote">&gt; but I'm sorry I've never recompiled a kernel or driver yet, despite decades
&gt; of UNIX. One thing that worked well in the past with the Intel driver was
&gt; when Keith put an intel_drv.so online for us users to try out. Is your
&gt; nouveau_drv.so online (for SuSE 13.1/64) somewhere?</span >

Unfortunately this is for a kernel module. If I were really clever, I could
figure out exactly how your kernel was built (and exactly what version), which
compiler, which settings, etc, and build a module that worked for you. But I'm
not that clever, or perhaps too lazy -- take your pick. Here's a guide for
building your own kernel on SUSE:

<a href="https://www.suse.com/communities/conversations/compiling-de-linux-kernel-suse-way/">https://www.suse.com/communities/conversations/compiling-de-linux-kernel-suse-way/</a>

I have no clue whether these instructions are in the least valid. You can also
just wait for 3.14-rc1 to come out and perhaps a fresh kernel will be
installable from

<a href="http://en.opensuse.org/openSUSE:Kernel_of_the_day">http://en.opensuse.org/openSUSE:Kernel_of_the_day</a>

(These are all things I found with a quick Google search -- I have no knowledge
of SUSE beyond the fact that its auto-configurer tool... YaST iirc... that
overwrote all of my careful config modifications wildly annoyed me back in
~1999 or so and I decided to never touch it again.)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1390940632.7e3b5E2.2314--

--===============2065011691==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2065011691==--
