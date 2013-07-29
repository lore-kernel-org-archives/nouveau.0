From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67315] System lockup with X consuming all CPU
Date: Mon, 29 Jul 2013 16:48:45 +0000
Message-ID: <bug-67315-8800-sDRTKi8LWt@http.bugs.freedesktop.org/>
References: <bug-67315-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1486584661=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67315-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1486584661==
Content-Type: multipart/alternative; boundary="1375116525.F78D2.3627"; charset="us-ascii"


--1375116525.F78D2.3627
Date: Mon, 29 Jul 2013 16:48:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67315

--- Comment #9 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #8)
> I'm ready to continue sorting this out. Enjoyed adequate sleep over the
> weekend so I'm rarin' to go.
> 
> What else do you need from me?

Answers to the last two questions would be nice as a start :P

(In reply to comment #6)
> In the last attachment Xorg.log claims that it's starts at ~81.456, whereas
> dmesg states that X was running ~19.627541.
> * Are those logs matching (ie. captured from the same boot/system startup)
> I'm assuming that you've started your screensaver ~55.041877. Is that
> correct ?
I.e. understanding the timeline would be beneficial

> * Do you recall when did your nouveau started started reporting errors
> (nouveau E) ?
> 
I'm talking about nouveau errors in general, indicated by "nouveau E"
disregarding the I've mentioned as harmless. If unsure attach dmesg of older
kernels that you have handy :)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1375116525.F78D2.3627
Date: Mon, 29 Jul 2013 16:48:45 +0000
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
   title="NEW --- - System lockup with X consuming all CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67315#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - System lockup with X consuming all CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67315">bug 67315</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=67315#c8">comment #8</a>)
<span class="quote">&gt; I'm ready to continue sorting this out. Enjoyed adequate sleep over the
&gt; weekend so I'm rarin' to go.
&gt; 
&gt; What else do you need from me?</span >

Answers to the last two questions would be nice as a start :P

(In reply to <a href="show_bug.cgi?id=67315#c6">comment #6</a>)
<span class="quote">&gt; In the last attachment Xorg.log claims that it's starts at ~81.456, whereas
&gt; dmesg states that X was running ~19.627541.
&gt; * Are those logs matching (ie. captured from the same boot/system startup)
&gt; I'm assuming that you've started your screensaver ~55.041877. Is that
&gt; correct ?</span >
I.e. understanding the timeline would be beneficial

<span class="quote">&gt; * Do you recall when did your nouveau started started reporting errors
&gt; (nouveau E) ?
&gt; </span >
I'm talking about nouveau errors in general, indicated by &quot;nouveau E&quot;
disregarding the I've mentioned as harmless. If unsure attach dmesg of older
kernels that you have handy :)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1375116525.F78D2.3627--

--===============1486584661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1486584661==--
