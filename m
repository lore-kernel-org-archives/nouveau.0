From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 33165] [NVA3, NVA8] gpu lockup during driver probe
Date: Sun, 09 Mar 2014 22:53:42 +0000
Message-ID: <bug-33165-8800-TpwCyLQKOK@http.bugs.freedesktop.org/>
References: <bug-33165-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0192444982=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-33165-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0192444982==
Content-Type: multipart/alternative; boundary="1394405622.4A8c7.15084"; charset="us-ascii"


--1394405622.4A8c7.15084
Date: Sun, 9 Mar 2014 22:53:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=33165

--- Comment #31 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #29)
> Created attachment 95418 [details] [review]
> another patch for gddr5 ram
> 
> I made this patch using my mmiotrace, but it doesn't help either.

Oh well. Indeed the values in your mmiotrace are different, but your and
Andrew's mmiotrace are the only traces I've seen that actually have the writes
to those 0x10fxyz registers. (A few other traces have writes to the
similar-but-different DDR3 registers.)

And yes, I definitely did want to use offsets[o] in my patch.

Well, perhaps this 0x10f stuff has nothing to do with the issue. My observation
was that it seemed like for all the people it was broken for had GDDR5 ram,
which is why I went in this direction.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1394405622.4A8c7.15084
Date: Sun, 9 Mar 2014 22:53:42 +0000
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
   title="NEW --- - [NVA3, NVA8] gpu lockup during driver probe"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=33165#c31">Comment # 31</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA3, NVA8] gpu lockup during driver probe"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=33165">bug 33165</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=33165#c29">comment #29</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=95418" name="attach_95418" title="another patch for gddr5 ram">attachment 95418</a> <a href="attachment.cgi?id=95418&amp;action=edit" title="another patch for gddr5 ram">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=33165&amp;attachment=95418'>[review]</a> [review]
&gt; another patch for gddr5 ram
&gt; 
&gt; I made this patch using my mmiotrace, but it doesn't help either.</span >

Oh well. Indeed the values in your mmiotrace are different, but your and
Andrew's mmiotrace are the only traces I've seen that actually have the writes
to those 0x10fxyz registers. (A few other traces have writes to the
similar-but-different DDR3 registers.)

And yes, I definitely did want to use offsets[o] in my patch.

Well, perhaps this 0x10f stuff has nothing to do with the issue. My observation
was that it seemed like for all the people it was broken for had GDDR5 ram,
which is why I went in this direction.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1394405622.4A8c7.15084--

--===============0192444982==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0192444982==--
