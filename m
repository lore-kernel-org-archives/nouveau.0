From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67051] No nouveau HDMI sound on NVIDIA GT430
Date: Sun, 21 Jul 2013 22:41:12 +0000
Message-ID: <bug-67051-8800-3DYIcRoBQG@http.bugs.freedesktop.org/>
References: <bug-67051-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1821091721=="
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


--===============1821091721==
Content-Type: multipart/alternative; boundary="1374446472.67eF1.12254"; charset="us-ascii"


--1374446472.67eF1.12254
Date: Sun, 21 Jul 2013 22:41:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67051

--- Comment #50 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #49)
> (In reply to comment #48)
> > Actually wait, there's an easier way of achieving this.
> > 
> > boot both the kernel from the last attempt (with hdaminv-4.patch) and a
> > working kernel, e.g. 3.7.10 with a "nouveau.config=PDISP=spam" parameter.
> > This should produce a very large quantity of logs in your dmesg. In fact it
> > might overflow your dmesg buffer, but it should all go through syslog. Let
> > me know if that boot parameter doesn't cause the logs to show up...
> 
> Hi Ilia,
> 
> I'm back in action.
> Are you talking about hdminva_3_-4.patch?
> Anyway, please quickly clarify the two(?) configurations you want me to test
> and compare (?) (I said I was back in action;  I didn't say I was fully
> awake).

Sorry, I should have been clearer.

1. 8e9e3d2deacc460fbb8a4691140318f6e85e6891 + hdmi-1.patch + hdminva3.patch +
hdminva3-4.patch

2. f7960736d0b8647fd149687d15deb79e47122d69

The second one is the revision without the two problematic commits that are the
reason for the patches. This should ensure that they are as similar as
possible.

> 
> BTW, (informational) speaking of dmesg overflow, you may have noticed I
> routinely started the kernel with "log_buf_len=1M" lately.

Ah, that's good. BTW, you might consider going into #nouveau on freenode IRC to
avoid some of this back-and-forth.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374446472.67eF1.12254
Date: Sun, 21 Jul 2013 22:41:12 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051#c50">Comment # 50</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051">bug 67051</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=67051#c49">comment #49</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=67051#c48">comment #48</a>)
&gt; &gt; Actually wait, there's an easier way of achieving this.
&gt; &gt; 
&gt; &gt; boot both the kernel from the last attempt (with hdaminv-4.patch) and a
&gt; &gt; working kernel, e.g. 3.7.10 with a &quot;nouveau.config=PDISP=spam&quot; parameter.
&gt; &gt; This should produce a very large quantity of logs in your dmesg. In fact it
&gt; &gt; might overflow your dmesg buffer, but it should all go through syslog. Let
&gt; &gt; me know if that boot parameter doesn't cause the logs to show up...
&gt; 
&gt; Hi Ilia,
&gt; 
&gt; I'm back in action.
&gt; Are you talking about hdminva_3_-4.patch?
&gt; Anyway, please quickly clarify the two(?) configurations you want me to test
&gt; and compare (?) (I said I was back in action;  I didn't say I was fully
&gt; awake).</span >

Sorry, I should have been clearer.

1. 8e9e3d2deacc460fbb8a4691140318f6e85e6891 + hdmi-1.patch + hdminva3.patch +
hdminva3-4.patch

2. f7960736d0b8647fd149687d15deb79e47122d69

The second one is the revision without the two problematic commits that are the
reason for the patches. This should ensure that they are as similar as
possible.

<span class="quote">&gt; 
&gt; BTW, (informational) speaking of dmesg overflow, you may have noticed I
&gt; routinely started the kernel with &quot;log_buf_len=1M&quot; lately.</span >

Ah, that's good. BTW, you might consider going into #nouveau on freenode IRC to
avoid some of this back-and-forth.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374446472.67eF1.12254--

--===============1821091721==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1821091721==--
