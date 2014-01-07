From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 72943] [NV98] hangs in nvbios_init on probe (worked
	in 3.2)
Date: Tue, 07 Jan 2014 19:24:37 +0000
Message-ID: <bug-72943-8800-zHEizKu6Sl@http.bugs.freedesktop.org/>
References: <bug-72943-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0509680115=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-72943-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0509680115==
Content-Type: multipart/alternative; boundary="1389122677.0EDBddbd2.5260"; charset="us-ascii"


--1389122677.0EDBddbd2.5260
Date: Tue, 7 Jan 2014 19:24:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=72943

--- Comment #12 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #11)
> Created attachment 91612 [details]
> vmcore log excerpt
> 
> 
> Hi,
> 
> For me the issue is not fixed.
> Please see the attached vmcore-excerpt.log.

That's very unfortunate. Can you please triple-check that you booted a kernel
with that patch applied? Assuming that you did, mind adding
"nouveau.debug=trace" to the kernel cmdline? That should reveal where it's
looping. (Or perhaps the condition just never becomes true?) Do note that it
will produce *vast* amounts of log lines if it is indeed looping the way I
think it is...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389122677.0EDBddbd2.5260
Date: Tue, 7 Jan 2014 19:24:37 +0000
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
   title="NEW --- - [NV98] hangs in nvbios_init on probe (worked in 3.2)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72943#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV98] hangs in nvbios_init on probe (worked in 3.2)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72943">bug 72943</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=72943#c11">comment #11</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=91612" name="attach_91612" title="vmcore log excerpt">attachment 91612</a> <a href="attachment.cgi?id=91612&amp;action=edit" title="vmcore log excerpt">[details]</a></span>
&gt; vmcore log excerpt
&gt; 
&gt; 
&gt; Hi,
&gt; 
&gt; For me the issue is not fixed.
&gt; Please see the attached vmcore-excerpt.log.</span >

That's very unfortunate. Can you please triple-check that you booted a kernel
with that patch applied? Assuming that you did, mind adding
&quot;nouveau.debug=trace&quot; to the kernel cmdline? That should reveal where it's
looping. (Or perhaps the condition just never becomes true?) Do note that it
will produce *vast* amounts of log lines if it is indeed looping the way I
think it is...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389122677.0EDBddbd2.5260--

--===============0509680115==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0509680115==--
